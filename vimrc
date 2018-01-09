call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'valloric/youcompleteme'
call plug#end()

set autoindent
set expandtab
set sw=3
set tabstop=3
set ai
set si
set encoding=utf8
set guifont=Source\ Code\ Pro\ NF\ Medium\ 14

" Use vim-code-dark
colorscheme codedark

" --------------------------------------------------
" configure vim-airline

" display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" configure powerline fonts
let g:airline_powerline_fonts = 1

"---------------------------------------------------
" Configure NERDTree to auto open when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

"---------------------------------------------------
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"------------------
" Configure Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic config for ESLint
let g:syntastic_javascript_checkers=['eslint']

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
