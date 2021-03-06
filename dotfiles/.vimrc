set background=dark
syntax off
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd 
set nu

set nocompatible
set mouse=a
set incsearch
set hlsearch
set ignorecase
set smartcase
set history=1000
set scrolljump=5 " lines to scroll when cursor leaves screen"

"pathogen init
call pathogen#runtime_append_all_bundles() 
filetype off
syntax on
filetype plugin indent on

colorscheme my-desert
"keep space on vertical window moving
set so=7

" set foldmethod=syntax
set foldenable      " fold enable but..
set foldmethod=syntax
set foldlevelstart=1 

" jump between pairs element ( => ) if => endif etc..
runtime! macros/matchit.vim

" indnet
augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
	autocmd FileType c,php,html,htmldjango set ai sw=2 sts=2 et
	autocmd FileType python,javascript set ai sw=4 sts=4 et
augroup END

augroup markdown
	autocmd!
	autocmd BufRead,BufNewFile *.mkd set filetype=mkd 
	autocmd BufRead,BufNewFile *.mkd set tw=100
augroup END

augroup filetypedetect
	autocmd BufNewFile,BufRead *.php set filetype=php
augroup END

filetype on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" my leader shortcut
let mapleader = ","

" spell checking!
map <leader>C :w<CR>:!aspell -c %<CR>:e %<CR>

" my custom rgrep
set grepprg=mgrep\ $*\ .\ -n

" rgrep word under cursor
map <leader>g :grep <cword><CR> :cope <CR>

" ctrl + right click rgrep for word under cursor
map <c-RightMouse> :grep <cword><CR> :cope <CR> <CR>

" faster write buffer
nmap <leader>w :w!<cr>

" gist
nmap <leader>l :Gist -l<cr>

" update ctags with easy tags recursive
nmap <leader>r :UpdateTags -R .<cr>

" reload vimrc
map <leader>c :source ~/.vimrc <cr>

" no backup no swap
set nobackup
set nowritebackup
set noswapfile

" shortcuts for saving with ctrl-s
nmap <c-s> :w<CR>
vmap <c-s> <esc><c-s>
imap <c-s> <esc><c-s>

" esay windo moving
map  <c-k> :wincmd k<CR>
map  <c-j> :wincmd j<CR>
map  <c-h> :wincmd h<CR>
map  <c-l> :wincmd l<CR>

" gvim 
set guifont=Monospace\ 8


" go to next window: not nerdtree
au VimEnter *  wincmd l

" nerdtree
nmap <leader>n :tabnew<CR>:NERDTree<CR><c-w><c-w><c-w><c-c>


set wildmenu

" php helping
let php_sql_query=1
let php_htmlInStrings=1

" tabs
:nmap <C-t> :tabnext<CR>
:nmap <C-n> :bnext<CR>
map <Esc>[C :bnext<CR>
map <Esc>[D :bprevious<CR>
:imap <C-t> <Esc>:tabnext<CR>

" sessions life from vim.org

" Creates a session
function! MakeSession()
	let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
	if (filewritable(b:sessiondir) != 2)
		exe 'silent !mkdir -p ' b:sessiondir
		redraw!
	endif
	let b:filename = b:sessiondir . '/session.vim'
	exe "mksession! " . b:filename
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
	let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
	let b:sessionfile = b:sessiondir . "/session.vim"
	if (filereadable(b:sessionfile))
		exe "mksession! " . b:sessionfile
	endif
endfunction

" Loads a session if it exists
function! LoadSession()
	if argc() == 0
		let b:sessiondir = $HOME . "/.vim_sessions" . getcwd()
		let b:sessionfile = b:sessiondir . "/session.vim"
		if (filereadable(b:sessionfile))
			exe 'source ' b:sessionfile
		else
			echo "No session loaded."
		endif
	endif
endfunction

au VimEnter * :call LoadSession()
au VimLeave * :call UpdateSession()
map <leader>m :call MakeSession()<CR>

"""""""""""""""""""""""""""""
" => Minibuffer plugin
" """""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>

" Bufonly
map <leader>b :BufOnly<cr>
"
"""""""""""""""""""""""""""""
" => MRU plugin
" """""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>"


" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv gv)

let g:SuperTabCrMapping = 0
         
 " automatically SuperTabCrMappingopen and close the popup menu / preview
 " window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest"

set tags=./tags;/,~/.vimtags
let g:easytags_cmd = 'ctags'


let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Updatet_Use_SingleClick = 1

let g:ctags_statusline=1
" Override how taglist does javascript
let g:tlist_javascript_settings = 'javascript;tlist_javascript_settingsf:function;c:class;m:method;p:property;v:global'


let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Don't leave on by default, use :ShowMarksOn to enable
let g:showmarks_enable = 0
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

" insert date
:nnoremap <leader>d  "=strftime("%c")<CR>P"
:inoremap <leader>d <C-R>=strftime("%c")<CR>
