" Author: Emiliano Carlos de Moraes Firmino
" Contact: emiliano.firmino@gmail.com | elmiliox@gmail.com
" Info: Developer @ INdT Manaus 2013

set backspace=2       " Expected Behaviour for Backspace
set clipboard=unnamed " Expected Behaviour for Clipboard
set number            " Show Line Number
set nocompatible      " Remove VI Anoyance
set mouse=a           " Expected Behaviour for Mouse

syntax enable         " Highlight

" Option
set autoread
set backup
set nowrap

" Menu
set wildmenu
set foldmethod=indent

" Limit max length
set tw=79
set colorcolumn=80
highlight  ColorColumn ctermbg=233

" Better search engine
set hlsearch
set incsearch
set ignorecase
set smartcase

" HotFix Typo
cab W  w
cab Q  q
cab Wq wq
cab wQ wq
cab WQ wq

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable backup
" set nobackup
" set nowritebackup
" set noswapfile

" Common Editor Shortcuts
nnoremap ; :

"" Undo
noremap  <C-Z> :undo<CR>
inoremap <C-Z> :undo<CR>
vnoremap <C-Z> :undo<CR>

"" Redo
noremap  <C-Y> <C-R>
inoremap <C-Y> <C-R>
vnoremap <C-Y> <C-R>

"" Save
noremap  <C-S> :update<CR>
inoremap <C-S> :update<CR>
vnoremap <C-S> :update<CR>

"" Copy to Clipboard
noremap  <C-C> Y
inoremap <C-C> Y
vnoremap <C-C> y

"" Copy to Clipboard
noremap  <C-X> :quit<CR>
inoremap <C-X> :quit<CR>
vnoremap <C-X> :quit<CR>

" Firefox Like TabNavigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Vi Like TAbNavigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Go to Tab
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

" Split Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Sort Functions to a key when press '\'s
vnoremap <Leader>s :sort<CR>

" Toggle invisible
noremap <Leader>i :set list!<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


" from https://github.com/eiro/rcfiles/

noremap! "" ""<left>
noremap! '' ''<left>

noremap! (( ()<left>
noremap! (<cr> (<cr>)<c-o>O
noremap! (; ();<esc>hi
noremap! (<cr>; (<cr>);<c-o>O
noremap! ('; ('');<esc>hhi
noremap! ("; ("");<esc>hhi
noremap! (' ('')<esc>hi
noremap! (" ("")<esc>hi

noremap! {{ {}<left>
noremap! {<cr> {<cr>}<c-o>O
noremap! {; {};<esc>hi
noremap! {<cr>; {<cr>};<c-o>O
noremap! {'; {''};<esc>hhi
noremap! {"; {""};<esc>hhi
noremap! {' {''}<esc>hi
noremap! {" {""}<esc>hi

noremap! [[ []<left>
noremap! [<cr> [<cr>]<c-o>O
noremap! [; [];<esc>hi
noremap! [<cr>; [<cr>];<c-o>O
noremap! ['; [''];<esc>hhi
noremap! ["; [""];<esc>hhi
noremap! [' ['']<esc>hi
noremap! [" [""]<esc>hi

" Show WhiteSpaces
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Remove WhiteSpaces
autocmd BufWritePre * :%s/\s\+$//e

" Easier formatting paragraphs
vmap Q gq
nmap Q gqap

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction


if has('statusline')
  set statusline=%#Question#                   " set highlighting
  set statusline+=%-2.2n\                      " buffer number
  set statusline+=%#WarningMsg#                " set highlighting
  set statusline+=%f\                          " file name
  set statusline+=%#Question#                  " set highlighting
  set statusline+=%h%m%r%w\                    " flags
  set statusline+=%{strlen(&ft)?&ft:'none'},   " file type
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}, " encoding
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%{&fileformat},              " file format
  set statusline+=%{&spelllang},               " language of spelling checker
  set statusline+=%{SyntaxItem()}              " syntax highlight group under cursor
  set statusline+=%=                           " ident to the right
  set statusline+=0x%-8B\                      " character code under cursor
  set statusline+=%-7.(%l,%c%V%)\ %<%P         " cursor position/offset
endif

set laststatus=2

"Dica de uso de tabulacao no Vim
"tabstop informa quantas colunas um tab representa
"expandtab faz com que ao aperta tab, insira-se o numero de espacos dito
"shiftwidth controla quantas colunas sao reindetadas
"softtabstop controla quantas colunas o vim usa quando voce aperta tab no modo de insercao

filetype plugin indent on "automaticamente identifica o arquivo de texto

au BufNewFile,BufRead *.as setf actionscript
au BufNewFile,BufRead *.cpy,*.vpy setf python
au BufNewFile,BufRead *.pt,*.cpt setf xhtml
au BufNewFile,BufRead *.kss, *.kss.dtml setf kss
au BufNewFile,BufRead *.css.dtml setf css
au BufNewFile,BufRead *.lmx,*.zcml setf xml


" Programming Language Rules

"Comentarios
" au FileType haskell, vhdl, ada let comment = '-- '
" au FileType sh, make, python let comment = '# '
" au FileType c, cpp, java let comment = '// '
" au FileType tex let comment = '% '
" au FileType vim let comment = '" '

"Comment Block
noremap <silent> ,C :s,^,<C-R>=comment<CR>,<CR>:noh<CR>
noremap <silent> ,U :s,^\V<C-R>=comment<CR>,,e<CR>:noh<CR>

" Explicite problemas
highlight Problem ctermbg=red guibg=red
match Problem /^\s\*\t\+\s\*/
match Problem /\s\+$/

nnoremap <silent> ,a :call Preserve("%s/\\s\\+$//e")<CR>
autocmd BufWritePre *.py, *.js, *.dtml :call Preserver("%s/\\s\\+$//e")


" Theme
if has("gui_running")
	colorscheme obsidian
	set guifont=Consolas\ 12
else
	colorscheme pablo
endif


" Highlight
highlight CursorLine ctermbg=darkblue
highlight StatusLine ctermfg=blue
highlight FoldColumn ctermbg=darkred
highlight Folded     ctermbg=red ctermfg=yellow

" Template
autocmd BufNewFile *.html 0r $VIMRUNTIME/templates/html.tpl
autocmd BufNewFile *.erl 0r $VIMRUNTIME/templates/erl.tpl
autocmd BufNewFile *.xrl 0r $VIMRUNTIME/templates/xrl.tpl

" Especific Programming Language
autocmd BufRead *.txt set wrap

" JavaScript
autocmd FileType javascript highlight javaScriptDocumentation ctermfg=5
autocmd FileType javascript highlight javaScriptPrototypeChain ctermfg=yellow
autocmd FileType javascript,erlang set nowrap

" Html
autocmd FileType html,xml,xsl source $VIMRUNTIME/scripts/closetag.vim
autocmd FileType html,xml,xsl let g:closetag_html_style=1
