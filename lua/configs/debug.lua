local dap = require "dap"
local dapui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"
local async = require "plenary.async"
local notify = require("notify").async

dapui.setup {
  -- Иконки для различных элементов UI
  icons = { expanded = "▾", collapsed = "▸", current_frame = "->" },
  mappings = {
    -- Маппинги для окон dap-ui
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Расположение окон. 'sidebar'
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.60 }, -- Окно с переменными (locals, globals, $_GET, и т.д.)
        { id = "breakpoints", size = 0.20 },
        { id = "stacks", size = 0.20 },
      },
      size = 40, -- Ширина сайдбара
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 1 }, -- REPL/консоль
      },
      size = 0.25, -- Высота окна
      position = "bottom",
    },
  },
  -- Отображение значений переменных через <leader>dh
  floating = {
    max_height = nil,
    max_width = nil,
    border = "rounded",
  },
  render = {
    max_type_length = nil,
  },
}

-- Автоматическое открытие/закрытие UI при старте/остановке отладки
dap.listeners.after.event_initialized.dapui_config = function()
  dapui.open()
  async.run(function()
    notify("DapUI is open", "info", { title = "Dap ui" })
  end)
end

-- Настройка nvim-dap-virtual-text для отображения переменных в коде
dap_virtual_text.setup {
  enabled = true, -- Убедимся, что плагин включен
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = true,
  show_stop_reason = true,
  commented = false,

  -- Отображать для всех ссылок на переменную, а не только для первого определения
  only_first_definition = false,
  all_references = true,

  -- Позиция текста в конце строки (end of line)
  virt_text_pos = "eol",
  virt_text_prefix = " ⯈ ",

  display_callback = function(variable, buf, stackframe, node, options)
    local a_lot_of_text = #variable.value > 200
    local value = variable.value

    if a_lot_of_text then
      value = string.sub(value, 1, 200) .. "..."
    end

    -- Формируем итоговую строку, добавляя префикс в самом начале
    return options.virt_text_prefix .. variable.name .. " = " .. value:gsub("[\n\r]", " ")
  end,

  virt_text_hl_changed = "DapVirtualTextChanged",
  virt_text_win_col = nil,
}

local mason_path = vim.fn.stdpath "data" .. "/mason/packages"

require("telescope").load_extension "dap"

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { mason_path .. "/php-debug-adapter/extension/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    name = "Listen for Xdebug",
    type = "php",
    request = "launch",
    port = 9003,
    log = true,
    pathMappings = {
      ["/app"] = "${workspaceFolder}",
    },
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
vim.cmd "highlight DapStoppedLine guibg=#333333"
-- mason_path /home/<username>/.local/share/nvimmason/packages
-- command for watch dap config - :Telescope dap configurations
