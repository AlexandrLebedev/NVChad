require "nvchad.mappings"
local async = require "plenary.async"
local notify = require("notify").async

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local function toggle_vista()
  if vim.fn.bufwinid "vista" ~= -1 then
    vim.cmd "Vista!"
  else
    vim.cmd "Vista"
  end
end

map("n", "<leader>v", toggle_vista, { desc = "Toggle Vista" })

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
