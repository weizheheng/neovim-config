nnoremap <silent><C-f> :lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent><C-p> :lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>
nnoremap <silent><C-b> :lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ previewer = false, layout_config = { height = 15, width = 110 } }))<CR>
nnoremap <silent><leader>ps :lua require('telescope.builtin').grep_string()<CR>
nnoremap <silent><leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent>gd :lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap <silent>gr :lua require('telescope.builtin').lsp_references()<CR>
" nnoremap <silent>gi :lua require('telescope.builtin').lsp_implementations()<CR>
