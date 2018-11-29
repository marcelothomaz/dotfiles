call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx']  }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'valloric/youcompleteme'
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'dikiaap/minimalist'
" Plug 'goatslacker/mango.vim'
Plug 'othree/yajs.vim'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx']  }
Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx']  }
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'crusoexia/vim-monokai'

Plug 'vim-scripts/svg.vim'

" Plug 'sheerun/vim-polyglot'
Plug 'alampros/vim-styled-jsx'
Plug 'hail2u/vim-css3-syntax'

Plug 'farmergreg/vim-lastplace'
Plug 'qpkorr/vim-bufkill'

call plug#end()

set autoindent
set expandtab
set sw=3
set tabstop=3
set ai
set si
set encoding=utf8
set guifont=Source\ Code\ Pro\ NF\ Medium\ 14
set hlsearch

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-i> :IndentGuidesToggle<CR>
" avoid repeating comments on new line
set formatoptions-=cro

" colorscheme
set background=dark
" Old colorscheme codedark
colorscheme minimalist
" for vim 7
set t_Co=256

" for vim 8
if (has("termguicolors"))
   set termguicolors
endif

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

" vim-javascript
let g:javascript_plugin_ngdoc=1

" vim-jsx
let g:jsx_ext_required = 1
" -----------------------------------------------

" auto detect filetypes
filetype plugin indent on


"activate jsdoc syntax from vim-javascript
let g:javascript_plugin_jsdoc = 1
