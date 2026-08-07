local configs = require "nvchad.configs.lspconfig"

local function get_vue_plugin_path()
  return vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
end

local servers =
  { "html", "cssls", "jsonls", "clangd", "gopls", "protols", "ts_ls", "pyright", "phpactor", "intelephense" }

-- Enable the lsp
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

local vue_plugin_path = get_vue_plugin_path()

vim.lsp.config["ts_ls"] = {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_plugin_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

---

vim.lsp.config["vue-language-server"] = {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
}

-- Настройка PHP (intelephense)
-- vim.lsp.config["intelephense"] = {
--   on_attach = configs.on_attach,
--   capabilities = configs.capabilities,
--   filetypes = { "php" },
--   on_new_config = function(new_config, root_dir)
--     local config_file = root_dir .. "/intelephense.json"
--     local file = io.open(config_file, "r")
--     if not file then
--       return
--     end
--
--     vim.notify(
--       "Найден intelephense.json, загружаю настройки...",
--       vim.log.levels.INFO,
--       { title = "LSP" }
--     )
--
--     local content = file:read "*a"
--     file:close()
--
--     local ok, decoded = pcall(vim.fn.json_decode, content)
--     if ok then
--       new_config.settings.intelephense = vim.tbl_deep_extend("force", new_config.settings.intelephense or {}, decoded)
--     else
--       vim.notify("Ошибка парсинга intelephense.json!", vim.log.levels.ERROR, { title = "LSP" })
--     end
--   end,
-- }

vim.lsp.config["intelephense"] = {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
  filetypes = { "php" },
  settings = {
    intelephense = {
      files = {
        maxSize = 5000000,
      },
      environment = {
        includePaths = { "vendor" }, -- Явно указываем vendor
      },
      -- Важно: заглушки для Laravel, чтобы он знал стандартные функции
      stubs = {
        "bcmath",
        "bz2",
        "calendar",
        "Core",
        "curl",
        "date",
        "dba",
        "dom",
        "enchant",
        "fileinfo",
        "filter",
        "ftp",
        "gd",
        "gettext",
        "hash",
        "iconv",
        "imap",
        "intl",
        "json",
        "ldap",
        "libxml",
        "mbstring",
        "mcrypt",
        "mysql",
        "mysqli",
        "password",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_mysql",
        "Phar",
        "readline",
        "recode",
        "Reflection",
        "regex",
        "session",
        "SimpleXML",
        "soap",
        "sockets",
        "sodium",
        "SPL",
        "standard",
        "superglobals",
        "sysvmsg",
        "sysvsem",
        "sysvshm",
        "tokenizer",
        "xml",
        "xdebug",
        "xmlreader",
        "xmlwriter",
        "yaml",
        "zip",
        "zlib",
        "wordpress",
        "laravel", -- Дополнительные стабы
      },
    },
  },
}

-- vim.lsp.config["phpactor"] = {
--   cmd = { "phpactor", "language-server", "-vvv" },
--   on_attach = function(client)
--     client.server_capabilities.hoverProvider = false
--     client.server_capabilities.documentSymbolProvider = false
--     client.server_capabilities.referencesProvider = false
--     --    client.server_capabilities.completionProvider = false
--     client.server_capabilities.documentFormattingProvider = false
--   end,
-- }

-- 2. Phpactor (Рефакторинг, генерация классов, импорт)
-- Настраиваем его работу через наш Docker-мост
vim.lsp.config["phpactor"] = {
  on_attach = function(client, bufnr)
    -- Отключаем функции, которые лучше делает Intelephense, чтобы они не дублировались
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.documentSymbolProvider = false
    client.server_capabilities.referencesProvider = false
    -- client.server_capabilities.completionProvider = false
    -- Оставляем автокомплит за Intelephense

    configs.on_attach(client, bufnr)
  end,
  capabilities = configs.capabilities,
  init_options = {
    ["php.bin"] = vim.fn.getcwd() .. "/bin/php_bridge",
  },
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

-- Support lsp for SQL
--
-- vim.lsp.config["sqls"] = {
--   on_attach = configs.on_attach,
--   capabilities = configs.capabilities,
--   settings = {
--     sqls = {
--       connections = {
--         -- In this block we can set up connections
--         -- For lsp can see the structure database
--         -- TODO: change to dadbod
--         {
--           driver = "postgresql",
--         },
--       },
--     },
--   },
-- }
