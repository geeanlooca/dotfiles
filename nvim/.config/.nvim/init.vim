call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kana/vim-textobj-user'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'heavenshell/vim-pydocstring'
Plug 'simeji/winresizer'
Plug 'jremmen/vim-ripgrep'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'idanarye/vim-merginal'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'unblevable/quick-scope'       " Plug
Plug 'alfredodeza/pytest.vim'
Plug 'preservim/nerdtree'
Plug 'romainl/vim-cool'
Plug 'vim-vdebug/vdebug'
Plug 'junegunn/goyo.vim'
call plug#end()

" set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

colorscheme ayu
" colorscheme gruvbox
let g:airline_theme='ayu_dark'
""Credit joshdick
""Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
""(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
"set background=dark        " for the light version
"let g:one_allow_italics = 1 " I love italic for comments
"colorscheme one

filetype on
filetype plugin on
filetype plugin indent on

" Useful mappings
""""""""""""""""""
map 0 ^
map <space> <leader>
map <space><space> <leader><leader>


" Clipboard Management
set clipboard=unnamedplus
set encoding=utf-8
vnoremap <leader>y "+y
nnoremap <leader>P "+p


" Folding
set foldenable
set foldmethod=manual
set foldcolumn=1
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent loadview
" augroup END


" Colorscheme
"
"colorscheme Monokai
"colorscheme atom
"colorscheme codeschool

syntax enable



" Buffer management
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>D :bp<bar>sp<bar>bn<bar>bd!<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Close all the buffers
map <leader>ba :bufdo bd<cr>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <c-w><c-h>
nnoremap <leader>ws :split<cr>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wd <C-W>q
nnoremap <C-W>[ :resize -5<CR>
nnoremap <C-W>] :resize +5<CR>
nnoremap <C-W>; :vertical resize -5<CR>
nnoremap <C-W>' :vertical resize +5<CR>
nnoremap <leader>q <C-W>q

set splitright
set splitbelow


" General options
""""""""""""""""""

set ignorecase " case insensitive search
set smartcase
set hlsearch
set lazyredraw
set magic
set noerrorbells
set novisualbell
set tm=500

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set linebreak
set tw=500
set autoindent
set smartindent
set wrap
set mouse=a

nnoremap <CR> :noh<CR><CR>
set nocursorline
set ruler
set number
set relativenumber
set hidden
set incsearch

" better :commands completion
set wildmenu
set wildignore+=*.md5,*.cfg,*.o,*.pyc,*.*synctex*,*.pdf,*.zip,*.aux,.git
set wildmode=longest:full,list:full

" Always show the status line
set laststatus=2

" do not store global and local values in a session
set ssop-=options


" Tabs management
map <leader>tc :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabmove

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Spell Checking
" Toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:Powerline_symbols='unicode'
"
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
"
" " Ultisnips
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsEditSplit="horizontal"
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/my-snippets/UltiSnips']


" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_fold_enabled = 1
let g:vimtex_complete_recursive_bib = 1


" Fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" FZF
""""""
nnoremap <leader>ww :Windows<CR>
nnoremap <leader><leader> :Buffers<CR>
nnoremap <leader>o :FZF<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>H :History<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>T :Tags<cr>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Opening, closing, saving files

" Quit without saving
nnoremap <leader>Q :qa!<CR>

" Save file
map <leader>w :w<cr>
map <leader>W :w!<cr>

" Save and quit
nnoremap <leader>x ZZ

" Search and replace

"Linting
""
"let g:ale_linters = {
"\   'python': ['flake8'],
"\}

"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'python': ['black'],
"\}

"let g:ale_fix_on_save = 1

"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-c><C-c> coc#refresh()


" Testing
nnoremap <leader>uh :TestNearest<CR>
nnoremap <leader>uv :TestVisit<CR>
nnoremap <leader>uf :TestFile<CR>
nnoremap <leader>us :TestSuite<CR>
nnoremap <leader>uu :TestLast<CR>

" default updatetime 4000ms is not good for async update
set updatetime=100


nnoremap <leader>gh :cd %:p:h<CR>
let g:pydocstring_formatter = 'numpy'

" coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? "\<C-n>" :
" \ <SID>check_back_space() ? "\<TAB>" :
" \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

 " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
 " position. Coc only does snippet and additional edit on confirm.
 " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <C-p> <C-^>
nnoremap <C-n> <C-^>

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>v  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Python docstring generation
let g:pydocstring_doq_path = "C:/Users/Gianluca/AppData/Local/Programs/Python/Python38-32/Scripts/doq.exe"
nnoremap <leader>pd :Pydocstring<CR>



" Git hunks information in statusbar
function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


" Git commands
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>ga :Gw<CR>
nmap <leader>gP :Gpush<CR>
nmap <leader>gp :Gpull<CR>
nmap <leader>gb :Gbrowse<CR>
nmap <leader>gR :Gread<CR>
nmap <leader>G :MerginalToggle<CR>
nmap <leader>b :GV<CR>
nmap <leader>B :GV!<CR>
nmap <leader>hj <Plug>(GitGutterNextHunk)
nmap <leader>hk <Plug>(GitGutterPrevHunk)
nmap <leader>hv <Plug>(GitGutterPreviewHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" nmap <leader>gb :GCheckout<CR>

" Find using ripgrep
nnoremap <leader>f :Rg 
nnoremap <leader>F :Rg<cr>

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)



" Quickscope highlighting colors
highlight QuickScopePrimary guifg='#eb34cf' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" let test#neovim#term_position = "topleft"
" let test#neovim#term_position = "vert"
" let test#neovim#term_position = "vert botright 30"


" Exit terminal mode
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif


" Use FZF to select open buffers and close them
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout!' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))


" Run python file in terminal
nnoremap <leader>r :vsplit <CR> :term python % <CR>

" Directory navigation
nnoremap <leader>n :NERDTreeToggle<CR>
nmap <space>e :CocCommand explorer<CR>

" Autoreload file when changed

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None



