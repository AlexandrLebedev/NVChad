local cmp = require "cmp"
local conf = require "nvchad.configs.cmp"

conf.window = {
  completion = {
    border = "rounded",
    winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
    scrollbar = false,
  },
  documentation = {
    border = "rounded",
    winhighlight = "Normal:CmpDoc",
  },
}

conf.mapping["<C-h>"] = cmp.mapping.scroll_docs(-4)
conf.mapping["<C-l>"] = cmp.mapping.scroll_docs(4)
conf.mapping["<C-k>"] = cmp.mapping.select_prev_item()
conf.mapping["<C-j>"] = cmp.mapping.select_next_item()
conf.mapping["<C-Space>"] = cmp.mapping.complete()
conf.mapping["<C-e>"] = cmp.mapping.abort()
conf.mapping["<CR>"] = cmp.mapping.confirm { select = true }

table.insert(conf.sources, { name = "vim-dadbod-completion" })

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
  matching = { disallow_symbol_nonprefix_matching = false },
})

return conf
