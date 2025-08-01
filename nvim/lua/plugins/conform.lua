return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = {
						"ruff",
					},
					go = { "goimports", "gofmt", "golines" },
					rust = { "rustfmt", "rust-analyzer" },
					svelte = { "biome" },
					yaml = { "yamlfmt" },
					yml = { "yamlfmt" },
					-- dockerfile = { "dockfmt" },
					ansible = { "ansible-lint" },
					terraform = { "tflint" },
					hcl = { "hclfmt" },
					tf = { "tflint" },
					tfvars = { "tflint" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mti = require("mason-tool-installer")
			mti.setup({
				ensure_installed = {
					-- Lua
					"lua_ls",
					-- Python
					"pyright",
					"ruff",
					-- Go
					"gopls",
					"goimports",
					"gofumpt",
					"golines",
					-- Rust
					"rustfmt",
					-- Docker
					"yamlfmt",
					-- Ansible
					"ansible-language-server",
					"ansible-lint",
					-- Hashicorp
					"terraformls",
					"tflint",
					"hclfmt",
					-- Rust
					"rust-analyzer",
					"rustfmt",
					-- Svelte
					"svelte-language-server",
					"biome",
				},
			})
		end,
	},
}
