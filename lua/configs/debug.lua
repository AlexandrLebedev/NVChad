local dap = require "dap"

local async = require "plenary.async"
local notify = require("notify").async
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

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
-- mason_path /home/<username>/.local/share/nvimmason/packages
-- command for watch dap config - :Telescope dap configurations
