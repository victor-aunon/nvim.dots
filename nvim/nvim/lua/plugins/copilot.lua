return {
  {
    "zbirenbaum/copilot.lua",
    requires = {
      "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-g>",
            dismiss = "<C-e>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
}
-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   build = ":Copilot auth",
--   event = "BufReadPost",
--   opts = {
--     suggestion = {
--       enabled = not vim.g.ai_cmp,
--       auto_trigger = true,
--       hide_during_completion = vim.g.ai_cmp,
--       keymap = {
--         accept = false, -- handled by nvim-cmp / blink.cmp
--         next = "<M-]>",
--         prev = "<M-[>",
--       },
--     },
--     panel = { enabled = false },
--     filetypes = {
--       markdown = true,
--       help = true,
--     },
--   },
-- }
--
-- return {
--   "zbirenbaum/copilot.lua",
--   event = "InsertEnter",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "hrsh7th/nvim-cmp",
--   },
--   config = function()
--     require("copilot").setup({
--       suggestion = {
--         enabled = true,
--         auto_trigger = true,
--         hide_during_completion = false,
--         debounce = 75,
--         trigger_on_accept = true,
--         keymap = {
--           accept = "<M-l>",
--           accept_word = false,
--           accept_line = false,
--           next = "<M-]>",
--           prev = "<M-[>",
--           dismiss = "<C-]>",
--         },
--       },
--     })
--     require("copilot_cmp").setup()
--   end,
-- }
