return {
  "nvim-pack/nvim-spectre",
  -- Opcional pero recomendado: añade un atajo de teclado
  keys = {
    {
      "<leader>sp", -- "sr" de "Search and Replace"
      "<cmd>Spectre<cr>",
      desc = "Buscar/Reemplazar en proyecto (Spectre)",
    },
  },
}
