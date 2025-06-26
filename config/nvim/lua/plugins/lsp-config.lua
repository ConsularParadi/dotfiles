return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig",
		config = function()
			require("mason-lspconfig").setup({
				--ensure_installed = { "lua_ls", "gopls", "yamlls", "pyright", "ansiblels", "terraformls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Define LSP servers in opts
			local opts = {
				servers = {
					lua_ls = {},
					gopls = {},
					yamlls = {},
					pyright = {},
					ansiblels = {},
					terraformls = {
						filetypes = { "terraform", "tf", "hcl" },
					},
					svelte = {},
				},
			}

			-- Loop through servers and set them up dynamically
			for server, config in pairs(opts.servers) do
				lspconfig[server].setup(vim.tbl_extend("force", config, {
					capabilities = capabilities,
				}))
			end

			-- LSP Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
