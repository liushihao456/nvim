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
set updatetime=500
set incsearch
set nohlsearch
set ignorecase
set smartcase
set hidden
set guicursor=
set scrolloff=8
set wildmenu
set wildignore+=**/node_modules/**
set completeopt=menuone,noinsert
nnoremap <SPACE> <Nop>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
let mapleader=" "
nnoremap <leader>e :e `dirname %`<CR>
nnoremap <M-q> :q<CR>
nnoremap <M-`> :bd<CR>
nnoremap <M-'> <C-^>
nnoremap <silent> <leader>ct !open -a Terminal.app .<CR>
nnoremap <F6> :ccl<CR>
nnoremap <F7> :cp<CR>
nnoremap <F8> :cn<CR>
inoremap jk <Esc>
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
nnoremap <leader>ct :!open -a Terminal .<CR>

call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danymat/neogen'
Plug 'mhinz/vim-startify'
Plug 'gruvbox-community/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jnurmine/Zenburn'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'tpope/vim-fugitive'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'danilamihailov/beacon.nvim'
Plug 'tpope/vim-rsi'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v2.x'}
Plug 'MunifTanjim/nui.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'github/copilot.vim'
Plug 'ahmedkhalf/project.nvim'
call plug#end()

" Color scheme
" set termguicolors
" color base16-tomorrow-night-eighties

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256  " Access colors present in 256 colorspace
    source ~/.vimrc_background
endif

" color zenburn
" color tender
" color gruvbox
" set background=light
" set background=dark
" color solarized8_low
" color solarized
hi Normal guibg=none ctermbg=none

" vim-startify
let g:startify_change_to_dir = 0

" Neotree
nnoremap <leader>z :Neotree<cr>

" Neogen
nnoremap <leader>d :Neogen<cr>

" Telescope
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pp <cmd>lua require('telescope').extensions.projects.projects()<cr>
nnoremap <leader>xf <cmd>lua require('telescope').extensions.file_browser.file_browser({ path = "%:p:h" })<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers({ sort_lastused = true })<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>

" Prettier
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"
let g:prettier#quickfix_enabled = 0
nmap <F5> <Plug>(Prettier)

" coc.nvim
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>lr <Plug>(coc-rename)
" Format buffer
nnoremap <leader>lf :call CocAction('format')<CR>
" Organize imports
autocmd FileType typescriptreact nnoremap <leader>lm :CocCommand tsserver.organizeImports<CR>
autocmd FileType typescript nnoremap <leader>lm :CocCommand tsserver.organizeImports<CR>
autocmd FileType javascriptreact nnoremap <leader>lm :CocCommand tsserver.organizeImports<CR>
autocmd FileType javascript nnoremap <leader>lm :CocCommand tsserver.organizeImports<CR>
" Show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Remap keys for applying codeAction to the current buffer.
nmap <leader>lx  <Plug>(coc-codeaction)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" set statusline^=%{coc#status()}

" beacon.nvim
highlight! link Beacon StatusLine
let g:beacon_enable = 0
let g:beacon_size = 20
nmap <silent> n n:Beacon<cr>
nmap <silent> N N:Beacon<cr>
nmap <silent> * *:Beacon<cr>
nmap <silent> # #:Beacon<cr>
nmap <silent> <C-o> <C-o>:Beacon<cr>
nmap <silent> <C-i> <C-i>:Beacon<cr>

" Load lua configs
lua require('config')
