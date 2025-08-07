-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Почему то надо выводить в отдельное опредедение
-- только тогда будет работать nvdash
M.nvdash = {
  load_on_startup = true,
  header = {
    "   █████╗ ██╗     ███╗   ██╗ ██████╗██████╗   ",
    "  ██╔══██╗██║     ████╗  ██║██╔════╝██╔══██╗  ",
    "  ███████║██║     ██╔██╗ ██║██║     ██║  ██║  ",
    "  ██╔══██║██║     ██║╚██╗██║██║     ██║  ██║  ",
    "  ██║  ██║███████╗██║ ╚████║╚██████╗██████╔╝  ",
    "  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═════╝   ",
  },
}

M.base46 = {
  theme = "carbonfox",
  transparency = true,

  hl_override = {
    NormalFloat = { bg = "none" },
    FloatBorder = { fg = "#565f89" },
  },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
  telescope = { style = "bordered" },

  tabufline = {
    order = { "treeOffset", "buffers", "tabs", "clock", "btns" },

    modules = {
      clock = function()
        return "  " .. os.date "%H:%M" .. " "
      end,
    },
  },
}

return M
