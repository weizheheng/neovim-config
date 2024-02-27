"Auto close tag config
let g:closetag_filenames = '*.erb,*.html,*.tsx,*.jsx,*.mjml,*.js'
let g:closetag_xhtml_filenames = '*.jsx,*.tsx,*.js'
let g:closetag_filetypes = 'erb,html,jsx,tsx,mjml,js'
let g:closetag_xhtml_filetypes = 'jsx,tsx,js'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
