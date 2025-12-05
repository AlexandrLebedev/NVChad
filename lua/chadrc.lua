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
    -- NormalFloat отвечает за текст и фон плавающих окон (LSP hover, signature help)
    NormalFloat = {
      fg = "#c0c0c0", -- Светло-серый цвет текста
      bg = "#1e222a", -- Темный фон (подбери под свою тему, если нужно)
    },

    -- FloatBorder отвечает за рамку этого окна
    FloatBorder = {
      fg = "#565f89",
      bg = "#1e222a",
    },

    -- LspSignatureActiveParameter отвечает за подсветку активного аргумента (на котором сейчас курсор)
    LspSignatureActiveParameter = {
      fg = "#E5C07B", -- Например, желтый/золотой
      bold = true,
      bg = "NONE",
    },
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
