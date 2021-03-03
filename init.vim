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
set completeopt=menuone,noinsert
nnoremap <SPACE> <Nop>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
let mapleader=" "
nnoremap <leader>xf :e .<CR>
nnoremap <leader>ct :silent !open -a Terminal.app .<CR>
nnoremap <F5> :cp<CR>
nnoremap <F6> :cn<CR>
nnoremap <F7> :ccl<CR>
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-rooter'
Plug 'gruvbox-community/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" rooter
let g:rooter_silent_chdir = 1

" gruvbox
" color gruvbox
let g:solarized_termcolors=256
set background=dark
color solarized
hi Normal guibg=none ctermbg=none
hi Pmenu ctermbg=242 ctermfg=188
hi PmenuSel ctermbg=237 ctermfg=188

" fzf
nnoremap <leader>pf :GFiles --exclude-standard --cached --others<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>fr :History<CR>

" coc.nvim
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
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
" Symbol renaming.
nnoremap <leader>lr <Plug>(coc-rename)
" Format buffer
nnoremap <leader>lf :call CocAction('format')<CR>
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
