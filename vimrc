set nocompatible
filetype off
"
" Plugin installation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-textobj-user'
Plugin 'justincampbell/vim-eighties'
Plugin 'rbonvall/vim-textobj-latex'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-system-copy'
Plugin 'kana/vim-textobj-line'
Plugin 'lervag/vimtex'
Plugin 'wincent/command-t'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'easymotion/vim-easymotion'
" Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'


call vundle#end()            " required
filetype plugin indent on

set t_Co=256
set mouse=a
set listchars=tab:▸\ ,eol:¬


"colorscheme Monokai
"colorscheme Tomorrow-Night
"colorscheme atom
"colorscheme codeschool

" hi Normal ctermbg=none
if has('gui_running')
    " GUI colors
    " colorscheme twilight
    colorscheme codeschool
else
    " Non-GUI (terminal) colors
    " colorscheme Tomorrow-Night
    " colorscheme twilight256
    colorscheme jellyx
    " colorscheme desert
endif


set cursorline
set ruler
set number
set relativenumber
set hidden
set incsearch

imap jj <Esc>

map <space> <leader>
map <space><space> <leader><leader>
map <leader>w :w!<cr>
map K i<CR><ESC>
map gn :bn<CR>
map gp :bp<CR>

if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
    map ò <C-W><
    map à <C-W>>
    "    map < <C-W><
    "    map > <C-W>>
endif

no <down> ddp
no <up> ddkP
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nnoremap <leader>b :ls<CR>:b<space>
" :W sudo saves file
command W w !sudo tee % > /dev/null

set so=7
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

highlight LineNr ctermfg=grey
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
set mouse=a

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
if &paste
    return 'PASTE MODE  '
endif
set lazyredraw
return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
 buffer #
else
 bnext
endif

if bufnr("%") == l:currentBufNum
 new
endif

if buflisted(l:currentBufNum)
 execute("bdelete! ".l:currentBufNum)
endif
endfunction



" Plugin configuration

" NerdTree
map <leader>nn :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ca'
nnoremap <leader>p :CtrlPTag<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_show_diagnostics_ui = 0


" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Commant-T
let g:CommandTTraverseSCM='pwd'
"let g:CommandTScanDotDirectoris=1
set wildignore+=/home/gianluca/bin/M*,*.md5,*.cfg,*.o,*.pyc,*.*synctex*,*.pdf,*.zip,*.aux

" Ack
nnoremap <Leader>a :Ack! ""<left>
nnoremap <Leader>A :Ack! <C-r><C-w><CR>

nnoremap <leader>bf :CtrlPLine<CR>
:
" Vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" nnoremap <c-tab> :tabNext<CR>
" nnoremap <c-s-tab> :tabprevious<CR>
" inoremap <c-tab> :tabNext<CR>
" inoremap <c-s-tab> :tabprevious<CR>

" CtrlP
let g:ctrlp_follow_symlinks=1

" " Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" " let g:syntastic_c_checkers = ['clang_check']



let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" hi CursorLine cterm=bold
" Fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" Open compilation errors in quickfix
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Tags
nnoremap <leader>g <C-]>
