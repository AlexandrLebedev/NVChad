local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

-- 1. Настраиваем простые серверы (HTML, CSS) с дефолтными настройками
local servers = { "html", "cssls", "intelephense" }

for _, server_name in ipairs(servers) do
  lspconfig[server_name].setup {
    on_attach = configs.on_attach, -- Используем стандартный on_attach от NvChad
    capabilities = configs.capabilities, -- И стандартные capabilities
  }
end

-- 2. Настраиваем PHP. Нужно выбрать ОДИН сервер или настроить оба по отдельности.
--    Самый популярный и простой вариант - intelephense.
lspconfig.intelephense.setup {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  -- filetypes уже определены по умолчанию для intelephense, но можно указать явно
  filetypes = { "php" },
  -- Здесь могут быть специфичные настройки для intelephense
}

-- Если очень хочется И phpactor И intelephense, их нужно настраивать как два разных сервера.
-- Но обычно это избыточно и может привести к конфликтам. Выберите один.
-- Пример для phpactor:
-- lspconfig.phpactor.setup {
--   on_attach = configs.on_attach,
--   capabilities = configs.capabilities,
-- }

-- read :h vim.lsp.config for changing options of lsp servers
