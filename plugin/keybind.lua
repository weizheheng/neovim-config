-- ror.nvim
vim.keymap.set("n", "<Leader>tl", ":lua require('ror.test').run('Line')<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tf", ":lua require('ror.test').run()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tc", ":lua require('ror.test').clear()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ta", ":lua require('ror.test').attach_terminal()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>pp", ":lua require('ror.commands').list_commands()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>pm", ":lua require('ror.finders.model').find()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>pc", ":lua require('ror.finders.controller').find()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>pv", ":lua require('ror.finders.view').find()<CR>", { silent = true })
vim.keymap.set("n", "gmo", ":lua require('ror.navigations').go_to_model('normal')<CR>", { silent = true })
vim.keymap.set("n", "smo", ":lua require('ror.navigations').go_to_model('vsplit')<CR>", { silent = true })
vim.keymap.set("n", "gco", ":lua require('ror.navigations').go_to_controller('normal')<CR>", { silent = true })
vim.keymap.set("n", "sco", ":lua require('ror.navigations').go_to_controller('vsplit')<CR>", { silent = true })
-- vim.keymap.set("n", "gte", ":lua require('ror.navigations').go_to_test('normal')<CR>", { silent = true })
vim.keymap.set("n", "ste", ":lua require('ror.navigations').go_to_test('vsplit')<CR>", { silent = true })
vim.keymap.set("n", "gv", ":lua require('ror.navigations').go_to_view()<CR>", { silent = true })
-- vim.keymap.set("n", "<Leader>cs", ":lua require('ror.coverage').show()<CR>", { silent = true })
-- vim.keymap.set("n", "<Leader>ch", ":lua require('ror.coverage').clear()<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fs", ":lua require('ror.frozen_string_literal').add()<CR>", { silent = true })

-- oil.nvim
vim.keymap.set("n", "<Leader>n", ":lua require('oil').toggle_float()<CR>", { silent = true })

vim.keymap.set(
  'n',
  '<leader>lg',
  ':FloatermNew --height=0.99 --width=0.99 --wintype=float --name=lazygit --position=center --autoclose=2 lazygit<CR>',
  { noremap = true, silent = true }
  )

vim.keymap.set('n', '<leader>gs', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gc', ':DiffviewClose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gr', ':DiffviewRefresh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gl', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gu', ':GitBlameOpenCommitURL<CR>', { noremap = true, silent = true })
