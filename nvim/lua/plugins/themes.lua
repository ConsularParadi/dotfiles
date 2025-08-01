return {
	{
		"zaldih/themery.nvim",
		command = "Themery",
		config = function()
			local available_colorschemes = vim.fn.getcompletion("", "color")
			local colorschemes = {}
			for _, colorscheme in ipairs(available_colorschemes) do
				table.insert(colorschemes, colorscheme)
			end

			require("themery").setup({
				themes = colorschemes,
			})
		end,
		lazy = false,
		priority = 900,
	},
	{
		"RRethy/nvim-base16",
		name = "nvim-base16",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},
	{
		"srcery-colors/srcery-vim",
		name = "srcery",
		lazy = false,
		priority = 1000,
	},
	-- More themes here
}
