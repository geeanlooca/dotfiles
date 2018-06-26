
filetype off
"
" Plugin installation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-textobj-user'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'justincampbell/vim-eighties'
" Plugin 'rbonvall/vim-textobj-latex'
Plugin 'tpope/vim-commentary'
" Plugin 'christoomey/vim-system-copy'
Plugin 'kana/vim-textobj-line'
Plugin 'lervag/vimtex'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
" Plugin 'wincent/command-t'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-fugitive'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'
" Plugin 'jceb/vim-orgmode'
" Plugin 'tpope/vim-speeddating'
" Plugin 'vim-scripts/utl.vim'
" Plugin 'gcmt/taboo.vim'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'arcticicestudio/nord-vim'


call vundle#end()            " required
filetype plugin indent on
" set omnifunc=syntaxcomplete#Complete

let g:deoplete#enable_at_startup = 1

set t_Co=256
set mouse=a


"colorscheme Monokai
"colorscheme Tomorrow-Night
"colorscheme atom
"colorscheme codeschool

" hi Normal ctermbg=none
if has('gui_running')
    " GUI colors
    " colorscheme twilight
    " colorscheme nord
    " set guifont=RobotoMono\ Nerd\ Font\ Mono\ 12
else
    " Non-GUI (terminal) colors
    colorscheme Tomorrow-Night
    " colorscheme twilight256
    " colorscheme jellyx
    " colorscheme desert
    " colorscheme Tomorrow
    " set background=dark
    " colorscheme solarized
    " colorscheme nord
endif


nnoremap <CR> :noh<CR><CR>
set cursorline
set ruler
set number
" set relativenumber
set hidden
set incsearch

" better :commands completion
set wildmode=longest:full,list:full

imap jj <Esc>

map <space> <leader>
map <space><space> <leader><leader>
map <leader>s :w!<cr>
map gn :bn<CR>
map gp :bp<CR>

if bufwinnr(1)
    map è <C-W>+
    map - <C-W>-
    map ò <C-W><
    map à <C-W>>
    map = <C-W>=
    map ç :vertical resize -5<CR>
    map ° :vertical resize +5<CR>
    map _ :res -5<CR>
    map é :res +5<CR>
endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" nnoremap <leader>b :ls<CR>:b<space>
" :W sudo saves file
" command W w !sudo tee % > /dev/null

" set so=7
set wildmenu
set ignorecase
set smartcase
set hlsearch
set lazyredraw
set magic
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1
syntax enable
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
" map <leader>d :Bclose<cr>:tabclose<cr>gT
set mouse=a

" Close all the buffers
" map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>td :tabclose<cr>
" map <leader>tm :tabmove
" map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
" try
" set switchbuf=useopen,usetab,newtab
" set stal=2
" catch
" endtry

" Return to last edit position when opening files (You want this!)
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
" function! HasPaste()
" if &paste
"     return 'PASTE MODE  '
" endif
" set lazyredraw
" return ''
" endfunction

" Don't close window, when deleting a buffer
" command! Bclose call <SID>BufcloseCloseIt()
" function! <SID>BufcloseCloseIt()
" let l:currentBufNum = bufnr("%")
" let l:alternateBufNum = bufnr("#")

" if buflisted(l:alternateBufNum)
"  buffer #
" else
"  bnext
" endif

" if bufnr("%") == l:currentBufNum
"  new
" endif

" if buflisted(l:currentBufNum)
"  execute("bdelete! ".l:currentBufNum)
" endif
" endfunction




" Plugin configuration

" Commentary
autocmd FileType c,cpp,java setlocal commentstring=//\ %s

" NerdTree

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_follow_symlinks=1
nnoremap <leader>p :CtrlP ~<CR>
nnoremap <leader>bb :CtrlPBuffer<CR>
nnoremap <leader>bf :CtrlPLine<CR>
" nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="horizontal"
" let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips"]

" Commant-T
"let g:CommandTScanDotDirectoris=1
set wildignore+=/home/gianluca/bin/M*,*.md5,*.cfg,*.o,*.pyc,*.*synctex*,*.pdf,*.zip,*.aux

" Ack
nnoremap <Leader>a :Ack! ""<left>
nnoremap <Leader>A :Ack! <C-r><C-w><CR>


" Vimtex
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
let g:vimtex_fold_enabled = 1
let g:vimtex_complete_recursive_bib = 1


if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
"
" let g:vimtex_compiler_latexmk = {
"       \ 'options' : [
"       \   '-pdflatex',
"       \   '-synctex=1',
"       \   '-shell-escape'
"       \ ]
"       \}


" nnoremap <C-Tab> :tabNext<CR>
" nnoremap <C-S-Tab> :tabprevious<CR>
" inoremap <c-tab> :tabNext<CR>
" inoremap <c-s-tab> :tabprevious<CR>



" Fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" Open compilation errors in quickfix
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Tags
nnoremap <leader>g <C-]>

set ssop-=options    " do not store global and local values in a session

nnoremap ; A;<ESC>

" set statusline+=%{gutentags#statusline()}

" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_comment_brightness = 20
"

let g:tex_flavor = "latex"
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:pymode_rope_complete_on_dot = 1

" Pandoc
let g:pandoc#command#autoexec_command = "Pandoc! pdf"

" Calendar
nnoremap <leader>c :Calendar -view=year -split=vertical -width=27<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" VimWiki
let g:vimwiki_use_calendar = 1
let g:vimwiki_list = [{'path': '~/vimwiki', 'path_html': '~/vimwiki/html', 'template_path': '~/vimwiki/templates/'}]
au BufEnter,BufNew *.wiki nnoremap <leader><leader>r :Vimwiki2HTMLBrowse<CR>
au BufEnter,BufNew *.wiki nnoremap <leader><leader>a :VimwikiAll2HTML<CR>

