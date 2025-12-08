local configs = require "nvchad.configs.lspconfig"

local servers = { "html", "cssls", "jsonls", "clangd", "gopls" }

for _, server_name in ipairs(servers) do
  vim.lsp.config[server_name] = {
    on_attach = configs.on_attach,
    capabilities = configs.capabilities,
  }

  vim.lsp.enable(server_name)
end

---

vim.lsp.config["eslint"] = {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
    configs.on_attach(client, bufnr)
  end,
  capabilities = configs.capabilities,
}

vim.lsp.config["ts_ls"] = {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        -- locaton = "/usr/local/lib/node_modules/@vue/language-server",
        location = os.getenv "HOME"
          .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

---

-- lspconfig.volar.setup {
--   on_attach = configs.on_attach,
--   capabilities = configs.capabilities,
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
--   init_options = {
--     vue = {
--       hybridMode = false,
--     },
--   },
-- }

-- Настройка PHP (intelephense)
vim.lsp.config["intelephense"] = {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  filetypes = { "php" },
  on_new_config = function(new_config, root_dir)
    local config_file = root_dir .. "/intelephense.json"
    local file = io.open(config_file, "r")
    if not file then
      return
    end

    vim.notify(
      "Найден intelephense.json, загружаю настройки...",
      vim.log.levels.INFO,
      { title = "LSP" }
    )

    local content = file:read "*a"
    file:close()

    local ok, decoded = pcall(vim.fn.json_decode, content)
    if ok then
      new_config.settings.intelephense = vim.tbl_deep_extend("force", new_config.settings.intelephense or {}, decoded)
    else
      vim.notify("Ошибка парсинга intelephense.json!", vim.log.levels.ERROR, { title = "LSP" })
    end
  end,
}

vim.lsp.config["phpactor"] = {
  cmd = { "phpactor", "language-server", "-vvv" },
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.documentSymbolProvider = false
    client.server_capabilities.referencesProvider = false
    --    client.server_capabilities.completionProvider = false
    client.server_capabilities.documentFormattingProvider = false
  end,
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.g.PHP_default_indenting = 4
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers
