require "nvchad.mappings"

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
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
