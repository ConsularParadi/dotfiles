return {
  "folke/snacks.nvim",
  config = function()
    local Snacks = require("snacks")
    Snacks.setup {
      animate = {
        enabled = true,
        duration = 20, -- ms per step
        easing = "linear",
        fps = 60,      -- frames per second. Global setting for all animations
      },

      bigfile = { enabled = false },
      dashboard = { enabled = true },
      input = { enabled = true },

      notifier = {
        enabled = true,
        timeout = 3000,
        style = "fancy",
      },
      statuscolumn = { enabled = true },
      terminal = {
        enabled = true,
        win = {
          style = "terminal",
          border = vim.g.border_style,
          position = "float",
          height = 0.8,
          width = 0.8,
        }
      },
      words = { enabled = true },
      styles = {
        notification = {
          border = vim.g.border_style,
          wo = { wrap = true }, -- Wrap notifications
          history = {
            border = vim.g.border_style,
          },
        },
        scratch = {
          border = vim.g.border_style,
        },
      },
      zen = { enabled = true },
    }
    vim.keymap.set({ "n", "t" }, "<c-,>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })
    vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
  end
}
