-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Почему то надо выводить в отдельное опредедение
-- только тогда будет работать nvdash
M.nvdash = {
    load_on_startup = true,
    header = {
      "██████╗ ██╗   ██╗██████╗ ██████╗ ██╗     ███████╗",
      "██╔══██╗██║   ██║██╔══██╗██╔══██╗██║     ██╔════╝",
      "██████╔╝██║   ██║██████╔╝██████╔╝██║     █████╗  ",
      "██╔═══╝ ██║   ██║██╔══██╗██╔═══╝ ██║     ██╔══╝  ",
      "██║     ╚██████╔╝██║  ██║██║     ███████╗███████╗",
      "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚══════╝╚══════╝",
    },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#461414",
      fg = "none",
    },
  },
}

return M
