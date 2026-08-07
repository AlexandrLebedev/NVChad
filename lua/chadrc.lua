-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Почему то надо выводить в отдельное опредедение
-- только тогда будет работать nvdash
M.nvdash = {
  load_on_startup = true,
  -- header = {
  --   "   █████╗ ██╗     ███╗   ██╗ ██████╗██████╗   ",
  --   "  ██╔══██╗██║     ████╗  ██║██╔════╝██╔══██╗  ",
  --   "  ███████║██║     ██╔██╗ ██║██║     ██║  ██║  ",
  --   "  ██╔══██║██║     ██║╚██╗██║██║     ██║  ██║  ",
  --   "  ██║  ██║███████╗██║ ╚████║╚██████╗██████╔╝  ",
  --   "  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═════╝   ",
  -- },
}

M.base46 = {
  theme = "github_dark",
  transparency = true,

  hl_override = {
    NormalFloat = {
      fg = "#c0c0c0",
      bg = "#1e222a",
    },

    FloatBorder = {
      fg = "#565f89",
      bg = "#1e222a",
    },

    CmpPmenu = { bg = "#1e222a" },
    CmpBorder = { fg = "#565f89", bg = "#1e222a" },
    CmpDocBorder = { fg = "#565f89", bg = "#1e222a" },
    CmpDoc = { bg = "#1e222a" },
    CmpSel = { bg = "#2c313a", bold = true },

    LspSignatureActiveParameter = {
      fg = "#E5C07B",
      bold = true,
      bg = "NONE",
    },

    ["@string"] = { fg = "#98c379" },
    ["@variable"] = { fg = "#bd93f9" },
    ["@number"] = { fg = "#d19a66" },
  },
}

-- M.ui = {
--   statusline = {
--     theme = "vscode_colored",
--   },
--   telescope = { style = "bordered" },
--
--   tabufline = {
--     order = { "treeOffset", "buffers", "tabs", "clock", "btns" },
--
--     modules = {
--       clock = function()
--         return "  " .. os.date "%H:%M" .. " "
--       end,
--     },
--   },
-- }

M.ui = {
  cmp = {
    style = "default", -- default = с рамкой; atom/atom_colored = без
    icons_left = false,
  },
  statusline = { theme = "vscode_colored" },
  telescope = { style = "bordered" },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs", "clock", "btns" },
    modules = {
      clock = function()
        return "  " .. os.date "%H:%M" .. " "
      end,
    },
  },
}

return M
