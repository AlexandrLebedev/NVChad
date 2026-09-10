-- setings for Formatters

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    go = { "goimports", "staticcheck" },
    proto = { "buf" },
    sql = { "sqlfluff" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {
    sqlfluff = {
      args = { "fix", "--dialect", "postgres", "-" },
    },
  },
}

require("conform").setup(options)
