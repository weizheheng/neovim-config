set tabstop=2
set softtabstop=2
set shiftwidth=2
" set relativenumber
set nu
set hidden
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set incsearch
set termguicolors
" set scrolloff=40
set signcolumn=yes
set cursorline
set colorcolumn=120
set textwidth=99
"highlight ColorColumn guibg=grey
highlight WinSeparator guifg=#4C566A
set clipboard=unnamedplus
set splitbelow splitright
set laststatus=3
set completeopt=menu,menuone,noselect
" set inccommand=split
set nohls

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  " return bufname(buflist[winnr - 1])
  return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

set tabline=%!MyTabLine()
