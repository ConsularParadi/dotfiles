return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = {
            "isort",
            "mypy",
            "ruff",
          },
          go = { "goimports", "gofmt", "golines" },
          rust = { "rustfmt" },
          -- svelte = { "prettierd", "prettier" },
          yaml = { "yamlfmt" },
          -- dockerfile = { "dockfmt" },
          ansible = { "ansible-lint" },
          terraform = { "tflint" },
          hcl = { "tflint", "hclfmt" },
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
          -- Python
          "isort",
          "mypy",
          "ruff",
          -- Go
          "goimports",
          "gofumpt",
          "golines",
          -- Rust
          "rustfmt",
          -- Docker
          "yamlfmt",
          -- Ansible
          "ansible-lint",
          -- Hashicorp
          "tflint",
          "hclfmt"
        },
      })
    end,
  },
}
