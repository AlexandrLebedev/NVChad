require "nvchad.options"
local cmp = require "cmp"

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
  },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").clangd.setup {
  capabilities = capabilities,
}

-- Code for disable lsp ppup menu for autocomplete
-- require("lspconfig")["gopls"].setup {
--   on_attach = function(client)
--     client.server_capabilities.completionProvider = false
--   end,
-- }
