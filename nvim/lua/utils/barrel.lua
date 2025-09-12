local M = {}

--- Función de ayuda para obtener el directorio correcto con varias estrategias.
function M.get_target_dir()
  -- Estrategia 1: Preguntar al explorador de archivos (neo-tree)
  -- Se envuelve en pcall para no dar error si neo-tree no está cargado.
  local success, neo_tree_api = pcall(require, "neo-tree.api")
  if success and neo_tree_api.tree.is_tree_buf() then
    local node = neo_tree_api.tree.get_node()
    if node then
      if node.type == "directory" then
        -- Si el nodo seleccionado es un directorio, esa es nuestra ruta.
        return node.path
      else
        -- Si es un archivo, usamos la ruta del directorio que lo contiene.
        return vim.fn.fnamemodify(node.path, ":p:h")
      end
    end
  end

  -- Estrategia 2: Usar el directorio del archivo activo en el buffer
  local buffer_dir = vim.fn.expand("%:p:h")
  if buffer_dir and buffer_dir ~= "" and buffer_dir ~= vim.fn.getcwd() then
    return buffer_dir
  end

  -- Estrategia 3 (Fallback): Usar el directorio de trabajo global
  return vim.fn.getcwd()
end

--- Genera un archivo "barrel" (index.ts o index.js) en el directorio actual.
function M.generate()
  -- Obtiene el directorio del archivo que tienes abierto
  local current_dir = M.get_target_dir()

  if not current_dir or current_dir == "" then
    vim.notify("Barrel: No se pudo determinar el directorio de destino.", vim.log.levels.ERROR)
    return
  end

  -- 1. DETERMINA EL TIPO DE PROYECTO Y EL NOMBRE DEL BARREL
  local is_typescript = vim.fn.findfile("tsconfig.json", ".;") ~= ""
  local barrel_filename = is_typescript and "index.ts" or "index.js"
  local barrel_filepath = current_dir .. "/" .. barrel_filename

  -- 2. LEE Y FILTRA LOS ARCHIVOS DEL DIRECTORIO
  local files_to_export = {}
  -- Itera sobre los archivos en el directorio actual
  for _, file in ipairs(vim.fn.readdir(current_dir)) do
    -- Excluye el propio archivo barrel, los tests y los directorios
    if
      file ~= barrel_filename
      and not file:match("%.spec%.")
      and not file:match("%.test%.")
      and vim.fn.isdirectory(current_dir .. "/" .. file) == 0
    then
      -- Incluye solo archivos .ts, .tsx, .js, .jsx
      if file:match("%.ts$") or file:match("%.tsx$") or file:match("%.js$") or file:match("%.jsx$") then
        -- Elimina la extensión del archivo para la línea de exportación
        local file_name_no_ext = file:gsub("%.[jt]sx?$", "")
        table.insert(files_to_export, file_name_no_ext)
      end
    end
  end

  -- Si no hay nada que exportar, no hagas nada
  if #files_to_export == 0 then
    vim.notify("Barrel: No se encontraron archivos para exportar.", vim.log.levels.WARN)
    return
  end

  -- Ordena los archivos alfabéticamente para un resultado consistente
  table.sort(files_to_export)

  -- 3. GENERA EL CONTENIDO DEL ARCHIVO
  local content = {}
  for _, name in ipairs(files_to_export) do
    table.insert(content, "export * from './" .. name .. "';")
  end

  -- 4. ESCRIBE EL ARCHIVO
  local file = io.open(barrel_filepath, "w")
  if file then
    file:write(table.concat(content, "\n") .. "\n")
    file:close()
    vim.notify(
      "Barrel '" .. barrel_filename .. "' generado/actualizado con " .. #files_to_export .. " exportaciones.",
      vim.log.levels.INFO
    )
  else
    vim.notify("Barrel: Error al abrir el archivo para escribir.", vim.log.levels.ERROR)
  end
end

return M
