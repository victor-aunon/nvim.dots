return {
  -- Este es un "plugin fantasma" solo para organizar nuestros atajos
  "LazyVim/LazyVim",
  keys = {
    {
      "<leader>cb",
      function()
        -- Llama a la función 'generate' de nuestro archivo 'utils.barrel'
        require("utils.barrel").generate()
      end,
      desc = "📦 Generate/Update Barrel (Custom)",
      mode = { "n" },
    },
  },
}
