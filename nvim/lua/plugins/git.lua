return {
	{
		"tpope/vim-fugitive",
		config = function()
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true, desc = "" }
			map("n", "<leader>gs", ":Git<CR>", vim.tbl_extend("force", opts, { desc = "Git Status" }))
			map("n", "<leader>gc", ":Git commit<CR>", vim.tbl_extend("force", opts, { desc = "Git Commit" }))
			map("n", "<leader>gp", ":Git push<CR>", vim.tbl_extend("force", opts, { desc = "Git Push" }))
			map("n", "<leader>gl", ":Git pull<CR>", vim.tbl_extend("force", opts, { desc = "Git Pull" }))
			map("n", "<leader>gb", ":Git blame<CR>", vim.tbl_extend("force", opts, { desc = "Git Blame" }))
			map("n", "<leader>gd", ":Gdiffsplit<CR>", vim.tbl_extend("force", opts, { desc = "Git Diff" }))
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local Gitsigns = require("gitsigns")
			Gitsigns.setup()
			vim.keymap.set("n", "<leader>gp", function()
				Gitsigns.preview_hunk()
			end)
		end,
	},
}
