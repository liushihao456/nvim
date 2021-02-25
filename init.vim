syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set nowrap
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set showcmd
set showmatch
set backspace=2
set nobackup
set incsearch
set nohlsearch
set hidden
set smartcase
set guicursor=
set scrolloff=8
set wildmenu
set wildignore+=**/node_modules/**
set completeopt=menuone,noinsert,noselect
nnoremap <SPACE> <Nop>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
let mapleader=" "
nnoremap <leader>xf :e .<CR>
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/seoul256.vim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

" rooter
let g:rooter_silent_chdir = 1

" gruvbox
"color seoul256
color gruvbox
hi Normal guibg=none ctermbg=none
hi Pmenu ctermbg=242 ctermfg=188
hi PmenuSel ctermbg=237 ctermfg=188

" lsp
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>lr :lua vim.lsp.buf.rename()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>lx :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>le :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>ln :lua vim.lsp.diagnostic.goto_next()<CR>

lua << EOF
local on_attach = require'completion'.on_attach
require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.clangd.setup{ on_attach=on_attach }
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, { signs = false, })
EOF

" fzf
nnoremap <leader>pf :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>fr :History<CR>


