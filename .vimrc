call pathogen#infect()
call pathogen#helptags()
set number 				" turn on line numbers and highlight colors
set ruler 				" Always show current positions along the bottom
set showcmd 				" show the command being typed
set autoindent 				" autoindent spaces
set cursorline
set t_Co=256				" 256 colors 
set history=100
set scrolloff=8	
set wildmenu
set hlsearch
set lazyredraw
set spelllang=de,en
nmap <C-h> <C-w>h			" control h, j, k, l tab navigation
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
set mousehide
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
syntax on
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
"colorscheme solarized set autoread 				" Set to auto read when a file is changed from the outside

let g:snippets_dir = "~/.vim/bundle/vim-snippets"
filetype plugin on

"-----------------------------------------------------------------------------
"" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
"" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
" nmap <S-F7> :NERDTreeClose<CR>


" COLORS {
" syntax highlighting groups
hi Comment      ctermfg=12
hi Constant     ctermfg=1 
hi Identifier   ctermfg=4
hi Statement    ctermfg=2
hi PreProc      ctermfg=6
hi Type         ctermfg=3
hi Special      ctermfg=5
hi Underlined   ctermfg=7
hi Ignore       ctermfg=9
hi Error        ctermfg=11
hi Todo         ctermfg=1
hi Normal ctermfg=none ctermbg=none
hi NonText ctermfg=0 ctermbg=none
hi Directory	ctermfg=12

hi VertSplit	ctermfg=black
hi StatusLine	ctermfg=white
hi StatusLineNC	ctermfg=0 

hi Pmenu ctermfg=10 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=14
hi LineNr ctermfg=0 ctermbg=none
hi CursorLine ctermfg=none ctermbg=none cterm=none
hi CursorLineNr ctermfg=none ctermbg=0 
hi CursorColumn ctermfg=none ctermbg=0
"}


" WORD PROCESSING {
set formatoptions=1
set lbr
set linebreak
set wrap
au BufRead,BufNewFile *.todo setfiletype todo


cabbr wp call Wp()
fun! Wp()
	set formatoptions=1
	set lbr
	set linebreak
	set wrap
	set nonumber
	nnoremap j gj
	nnoremap k gk
	nnoremap 0 g0
	nnoremap $ g$
	set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:[+],fb:[x],fb:[-]
	set comments +=fb:-
	set spell spelllang=de_at

endfu

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy/<C-R><C-R>=substitute(
			\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy?<C-R><C-R>=substitute(
			\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
"}

" VIM-AIRLINE {
if has('statusline')
	set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\ " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\ [%{&ff}/%Y] " Filetype
	set statusline+=\ [%{getcwd()}] " Current dir
	set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
	let g:airline_theme='powerlineish' " airline users use the powerline theme
	let g:airline_powerline_fonts=1 " and the powerline fonts
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_linecolumn_prefix = '␊ '
	let g:airline_linecolumn_prefix = '␤ '
	let g:airline_linecolumn_prefix = '¶ '
	let g:airline_branch_prefix = '⎇ '
	let g:airline_paste_symbol = 'ρ'
	let g:airline_paste_symbol = 'Þ'
	let g:airline_paste_symbol = '∥'
	let g:airline_whitespace_symbol = 'Ξ'
endif
" }
