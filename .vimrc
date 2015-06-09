" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Set leader to space
let mapleader = " "

execute pathogen#infect()

syntax on
set backspace=2   " Backspace deletes like most programs in insert mode
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline:
set cursorline                    " highlight current line
set hlsearch
set number
set mouse=a                       " enable mouse support
set ruler                         " show row and column in footer
set showmatch                     " show bracket matches
set clipboard=unnamed
set hidden
set noswapfile

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set background=dark
colorscheme solarized

filetype plugin indent on

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

nnoremap    <leader><leader> <c-^>
nnoremap    <leader>R       :RubocopThis<CR>
nnoremap    <C-n> :NERDTreeToggle<CR>
nnoremap    <leader>P       :set paste<CR>
nnoremap    <leader>N       :set nopaste<CR>

" In normal mode, shift+enter will create blank line before current
nmap <C-Enter> O<Esc>
" In normal mode, enter will create blank line after current
nmap <CR> o<Esc>

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

map <C-l> gt
map <C-h> gT

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" Disable arrow keys for movement
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

let g:vim_markdown_folding_disabled=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:Powerline_symbols = 'fancy'

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Auto strip trailing whitespace on file save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType scss,c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Remove statusbar update delay when leaving insert mode
" http://apw-bash-settings.readthedocs.org/en/latest/tipstricks.html
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

au BufNewFile,BufRead *.zsh-theme set filetype=zsh

" Close vim if only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
