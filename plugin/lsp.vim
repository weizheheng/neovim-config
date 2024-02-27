nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>j :lua vim.diagnostic.goto_next({popup_opts={border="double", focusable=true}})<CR>
nnoremap <silent><leader>k :lua vim.diagnostic.goto_prev({popup_opts={border="double", focusable=true}})<CR>
nnoremap <silent><leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>ca :lua vim.lsp.buf.code_action()<CR>
