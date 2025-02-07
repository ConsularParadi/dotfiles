return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").load_extension("harpoon")
    -- local harpoon = require("harpoon")
    -- harpoon.setup({
    --
    --})
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    vim.keymap.set('n', '<leader>hx', mark.add_file)
    vim.keymap.set('n', '<leader>hn', ui.nav_next)
    vim.keymap.set('n', '<leader>hp', ui.nav_prev)
    vim.keymap.set('n', '<leader>hm', ':Telescope harpoon marks<CR>')
  end
}
