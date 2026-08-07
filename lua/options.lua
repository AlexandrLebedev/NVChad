require "nvchad.options"

vim.opt.relativenumber = true

local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Code for disable lsp ppup menu for autocomplete
-- require("lspconfig")["gopls"].setup {
--   on_attach = function(client)
--     client.server_capabilities.completionProvider = false
--   end,
-- }
