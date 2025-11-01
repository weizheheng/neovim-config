require("config.lazy")
require("marcus.lsp")
require('marcus.cmp')
require('marcus.oil')
require('marcus.luasnip')
require("marcus.telescope")
require('marcus.lualine')
require('marcus.autocommands')
require('marcus.ror')
require('marcus.dressing')
require('marcus.notify')
require('marcus.stay-centered')
require('marcus.swap-buffers')
require('marcus.document-color')
require('marcus.diffview')
-- require('marcus.neocodeium')
require("ibl").setup({})

-- Override the conflict highlight gropu
vim.cmd([[
  highlight AvanteConflictIncoming guibg=#354a39
  highlight AvanteConflictCurrent guibg=#4a3536
]])

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.turbo_stream.erb",
  callback = function()
    vim.bo.filetype = "eruby"
  end
})
