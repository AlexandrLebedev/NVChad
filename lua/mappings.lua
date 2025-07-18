require "nvchad.mappings"
local async = require "plenary.async"
local notify = require("notify").async
local dap = require "dap"
local dapui = require "dapui"

-- add yours here

local map = vim.keymap.set
local dapui_widget = require "dap.ui.widgets"

------------------------------------------------------------------
-- Дополнительные функции
------------------------------------------------------------------

local function terminate_and_cleanup()
  dapui.close()
  dap.terminate()

  local virtual_text = require "nvim-dap-virtual-text/virtual_text"
  virtual_text.clear_virtual_text()

  async.run(function()
    notify("DapUI is close (event terminated)", "info", { title = "Dap ui" })
  end)
end

local function toggle_vista()
  if vim.fn.bufwinid "vista" ~= -1 then
    vim.cmd "Vista!"
  else
    vim.cmd "Vista"
  end
end

local function toggle_dadbod()
  if vim.fn.bufwinid "dbui" ~= -1 then
    vim.cmd "DBUIClose"
  else
    vim.cmd "DBUI"
  end
end

------------------------------------------------------------------
-- Основные горячие клавиши
------------------------------------------------------------------

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>v", toggle_vista, { desc = "Toggle Vista" })
map("n", "<leader>sd", toggle_dadbod, { desc = "Toggle DBUI" })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Show code action" })
-- lua vim.lsp.buf.code_action()

map("n", "<Left>", function()
  async.run(function()
    notify("Use h", "error", { title = "Navigation" })
  end)
end, { desc = "Use h" })

map("n", "<Right>", function()
  async.run(function()
    notify("Use l", "error", { title = "Navigation" })
  end)
end, { desc = "Use l" })

map("n", "<Up>", function()
  async.run(function()
    notify("Use k", "error", { title = "Navigation" })
  end)
end, { desc = "Use k" })

map("n", "<Down>", function()
  async.run(function()
    notify("Use j", "error", { title = "Navigation" })
  end)
end, { desc = "Use j" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

------------------------------------------------------------------
-- Горячие клавиши для отладчика (DAP)
------------------------------------------------------------------

-- Основные действия
map("n", "<leader>dsc", dap.continue, { desc = "DAP: Continue" })
map("n", "<leader>dsso", dap.step_over, { desc = "DAP: Step Over" })
map("n", "<leader>dssi", dap.step_into, { desc = "DAP: Step Into" })
map("n", "<leader>dssu", dap.step_out, { desc = "DAP: Step Out" })
map("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last" })

map("n", "<leader>dsk", terminate_and_cleanup, { desc = "DAP: Terminate/Kill" })
-- map("n", "<leader>dsd", dap.disconnect, { desc = "DAP: Disconnect" })

-- Брейкпоинты
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>dB", dap.set_breakpoint, { desc = "DAP: Set Breakpoint" })
map("n", "<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "DAP: Set Log Point" })

-- REPL - не нужна так как автоматически открывается во время отладки
-- map("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })

-- UI виджеты
map({ "n", "v" }, "<leader>dh", dapui_widget.hover, { desc = "DAP: Hover" })
map({ "n", "v" }, "<leader>dp", dapui_widget.preview, { desc = "DAP: Preview" })
map("n", "<leader>df", function()
  dapui.centered_float(dapui_widget.frames)
end, { desc = "DAP: Frames" })
map("n", "<leader>ds", function()
  dapui.centered_float(dapui_widget.scopes)
end, { desc = "DAP: Scopes" })
