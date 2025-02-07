return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "isort", "ruff" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "yamlls", "pyright", "ansiblels", "terraformls", },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabiities = capabilities,
      })
      lspconfig.gopls.setup({
        capabiities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabiities = capabilities,
      })
      lspconfig.pyright.setup({
        capabiities = capabilities,
      })
      lspconfig.ansiblels.setup({
        capabilities = capabilities,
      })
      lspconfig.terraformls.setup({
        capabilities = capabilities,
        filetype = { "terraform", "terraform-vars", "hcl" }
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
