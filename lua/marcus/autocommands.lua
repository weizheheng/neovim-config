vim.api.nvim_command [[autocmd VimEnter * lua require('marcus.layout').set()]]
vim.api.nvim_command [[autocmd TabNewEntered * lua require('marcus.layout').set_new_tab()]]
