filetype plugin indent on

autocmd BufRead,BufNewFile *.tex set ft=plaintex
autocmd FileType plaintex call SetPlaintexOptions()
autocmd FileType r call SetROptions()

"plaintex options
function! SetPlaintexOptions()
	"surround with paragraph
	nnoremap <buffer> <leader>p :s/\v.*/\\paragraph{\0}<cr>:nohlsearch<cr>

	"quick compile latex to 'out' folder
	nnoremap <buffer> <leader>c :!compile-latex.sh %<cr>

	" Enum Surround
	"
	" Used for note taking. Surrounds properly formatted lines into an
	" enum environment block
	"
	" line format:
	"
	"	<title>
	"	<empty-line>
	"	<note>
	"	<note>
	"	...
	"	<empty-line>
	"
	" note, an empty line is not the same as an EOF line. Hence, at the end of the
	" file there must be at least 2 blank lines
	nnoremap <buffer> <leader>e 0:s/\v.+/\\begin{enum}{\0}<cr>:/^$/;\/s/\v.+/\t\\item<space>\0<cr>'':.;/^$/g/^$/normal dd<cr>O\end{enum}<esc>:nohlsearch<cr>o<esc>

	"auto fold paragraphs
"	setlocal foldmethod=expr
"	setlocal foldexpr=GetTexFold(v:lnum)
"	function! GetTexFold(lnum)
"		if getline(a:lnum) =~# "\v\\paragraph\.*$"
"			return 0
"		fi
"		return 1
"	endfunction

endfunction

function! SetROptions()
"	let fileName = expand("%:p")
"	call system("R --file=\"".fileName."\"")
endfunction

function! SetEclimOptions()
	"eclipse-esq auto-import resolution
	nnoremap <buffer> <c-O> :JavaImportMissing<cr>:JavaImportClean<cr>:JavaImportSort<cr>
	"create javadoc comment
	nnoremap <buffer> <leader>d :JavaDocComment<cr>
	"eclipse rename refactor
	"nnoremap <buffer> <a-R> :JavaRename<space>
endfunction

"function OpenTempBuffer()
"	
"	let tempBuffer = "scratch"
"	if bufexists(tempBuffer)
"		
"
"	fi
"
"	"set height to 15 lines
"	resize 15
"
"endfunction








" shifts local vim directory to directory of newly buffer
autocmd BufEnter * :cd %:p:h

" load pathogen package manager
call pathogen#infect()

set tabstop=4
set shiftwidth=4
set softtabstop=4
set number

set nocompatible
set modelines=0

set encoding=utf-8
set scrolloff=4
set autoindent
set showmode
set showcmd
set hidden
"set visualbell
"set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set history=1000
syntax on

"colorscheme setup
set background=dark
colorscheme solarized
"to fix colors while in tmux
set term=screen-256color

"set wildmenu
"set wildmode=list:longest,full

"perl/python regex
nnoremap // \v
vnoremap // \v

let mapleader = ","
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

"control-d to escape insert mode
imap <C-d> <ESC>


"------ general key mappings -----------------------------------------------

"open new window and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>l :set invnumber<cr>
nnoremap <leader>s :setlocal invspell<cr>
nnoremap ; :
nnoremap <space> G
vnoremap <space> G
nnoremap <leader>r :redraw!<cr>
nnoremap <enter> o
" wasd style movement, h for insert mode
"nnoremap h i
"nnoremap i k
"nnoremap j h
"nnoremap k j

"code completions
inoremap {<CR>  {<CR>}<Esc>O
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap (  ()<Left>
"inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"


"removes the two blank surrounding lines
"/^$/;\/g/^$/normal dd
"prepend item tags
"/^$/;\/s/\v.+/\t\\item \0

" ------ movement remaps -----------------
nnoremap <C-n> <Left>
nnoremap <C-e> <Down>
nnoremap <C-i> <Up>
nnoremap <C-o> <Right>
vnoremap <C-n> <Left>
vnoremap <C-e> <Down>
vnoremap <C-i> <Up>
vnoremap <C-o> <Right>
inoremap <C-n> <Left>
inoremap <C-e> <Down>
inoremap <C-i> <Up>
inoremap <C-o> <Right>
