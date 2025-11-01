" call plug#begin('~/.vim/plugged')
call plug#begin()
"Plug 'sheerun/vim-polyglot'
" Plug 'arcticicestudio/nord-vim'
"Plug '~/plugins/nord-vim'
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'tpope/vim-fugitive'
"Plug 'mg979/vim-visual-multi'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-surround'
"Plug 'szw/vim-maximizer'
"Plug 'cohama/lexima.vim'
"Plug 'voldikss/vim-floaterm'
"Plug '~/plugins/vim-closetag'
"Plug 'weizheheng/nvim-workbench'
" Plug '~/plugins/nvim-workbench'
"Plug '~/plugins/swap-buffers.nvim'
"Plug 'AndrewRadev/tagalong.vim'
"Plug 'andymass/vim-matchup'
"Plug 'ap/vim-css-color'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'tpope/vim-commentary'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'arnamak/stay-centered.nvim'
"Plug 'stevearc/dressing.nvim'
"Plug 'mrshmllow/document-color.nvim'
"Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.0.0'}
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug '~/plugins/ror.nvim'
" Plug 'weizheheng/ror.nvim'
"Plug 'rcarriga/nvim-notify'
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'stevearc/oil.nvim'
"Plug 'monkoose/neocodeium'
call plug#end()

set termguicolors
colorscheme nord

let mapleader = " "

" nnoremap <C-s> :NvimTreeToggle<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <silent> <leader>ff :lua vim.lsp.buf.format({ timeout_ms = 10000 })<CR>
inoremap <C-s>= <%=  %><Left><Left><Left>
inoremap <C-s>- <%  %><Left><Left><Left>


" Copy current file path to clipboard
nmap <leader>cp :let @+ = expand("%:~:.")<cr>

" terminal
tnoremap <Esc> <C-\><C-n>

" my personal remap
inoremap jk <Esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>th <C-w>t<C-w>H
nnoremap <leader>tk <C-w>t<C-w>K

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader><Left> :tabprevious<CR>
nnoremap <leader><Right> :tabnext<CR>
noremap  <leader>hh :set invhlsearch hlsearch?<CR>
noremap  <leader>rv :vertical resize 155<CR>
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nmap <leader>bp <Plug>ToggleProjectWorkbench
nmap <leader>bb <Plug>ToggleBranchWorkbench
nmap <leader><CR> <Plug>WorkbenchToggleCheckbox

nnoremap <leader>v "0p
nnoremap <leader>Y gg"+yG
vnoremap <leader>d "_d
nnoremap <leader>br :%s//g<Left><Left>
"nnoremap <leader>gsr :cdo s//gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
let g:closetag_close_shortcut = ",>"
let g:closetag_filenames = '*.erb,*.slim,*.tsx,*.html'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ }
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_offscreen = {}

"lua require('marcus.lsp')
"lua require('marcus.cmp')
"lua require('marcus.telescope')
"lua require('marcus.lualine')
lua require('marcus.autocommands')
lua require('marcus.ror')
lua require('marcus.dressing')
lua require('marcus.notify')
lua require('marcus.nvim-tree')
lua require('marcus.stay-centered')
lua require('marcus.swap-buffers')
lua require('marcus.document-color')
lua require('marcus.luasnip')
lua require('marcus.oil')
lua require('marcus.neocodeium')

lua <<EOF
require("ibl").setup {}
EOF
