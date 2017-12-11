
"this is the MAINLINE=======================
"To do
"1. adopt 'YCM' in Linux and Win to replace other autopop 
"2. Is YCM syntax checker is better than 'syntastic'??
"

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"filetype detection
filetype off           " required for vundle
filetype plugin on
filetype indent on     " 
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936

" please make sure rtp and the parameter passed to begin() are the same
if has("unix") 
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	set tags+=$HOME/.vim/tags/stl_tags
	let g:vimrc_iswindows=0
else
	set rtp+=$VIM/bundle/Vundle.vim
	call vundle#begin('$VIM/bundle/Vundle.vim') 
	set tags+=$VIM/vimfiles/tags/stl_tags
	let g:vimrc_iswindows=1
	behave mswin
endif


"==let Vundle manage Vundle==
Plugin 'VundleVim/Vundle.vim'

Plugin 'The-NERD-tree'
"==tagbar:generate code tag, but it needs 'Ctags'!!!
Plugin 'majutsushi/tagbar'

"==Trnity : the Trinity of taglist, NERDtree and SrcExpl: an IDE works like Source Insight== 
Plugin 'chu-/Trinity'
"==syntax checker overlap with YCM==
Plugin 'scrooloose/syntastic' 
let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '?'
let g:syntastic_warning_symbol = '!'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*gbar

"==Autoformat, you need install clang-format package first. 
"rhysd/vim-clang-format is another alternatives for auto format
if has("unix") 
	Plugin 'Chiel92/vim-autoformat' "you need astyle
	let g:formatterpath = ['/usr/bin/'] 
else
	"	let g:formatterpath = ['$VIM/vim74']
endif

"Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'
" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'hari-rangarajan/CCTree'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsSnippetDirectories=['ultisnips_rep']
"let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/snippets'
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsUsePythonVersion = 3

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_theme='light'
  let g:airline#extensions#default#section_truncate_width = {
      \ 'a': 10,
      \ 'b': 5,
      \ 'c': 60,
      \ 'warning': 60,
      \ 'y': 10,
      \ 'z': 20,
      \ }

let g:airline#extensions#default#layout = [
			\ [ 'a', 'b', 'c' ],
			\ [ 'warning', 'y', 'z' ],
			\ ]

Plugin 'L9'
"let g:acp_behaviorSnipmateLength = 1	uncomment it will cause error while typeing word initiated with capatalized letter
let g:acp_behaviorKeywordLength = 4

"==automatically opens popup menu for completions  
" othree/vim-autocomlpop and omicppcomplete are similar and easy to
"use without dependency. However, YCM is actually THE BEST!!! BUT you need 'cmake' and 'build-essential'

Plugin 'othree/vim-autocomplpop'
"Plugin 'Valloric/YouCompleteMe'   
"Plugin 'rdnetto/YCM-Generator'
"let g:ycm_confirm_extra_conf=0 

Plugin 'srcexpl'

"official mirror of vim-script at github
" =============================================

" add author information
" Plugin 'header-info'
" let g:header_field_author = 'Craig Yang'
" let g:header_field_author_email = 'nikeasyanzi@yahoo.com.tw'

call vundle#end()	"filetype detection should be off for vundle, so we re-enable the option after the vundle function 
filetype plugin indent on	" required for UltiSnips

"==Brief Plugins usage help========================================
":PluginList          - list configured bundles
":PluginInstall(!)    - install(update) bundles
":PluginSearch(!) foo - search(or refresh cache first) for foo
":PluginClean(!)      - confirm(or auto-approve) removal of unused bundles

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"=============================================================================
set diffexpr=MyDiff()
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

:filetype plugin on


set cindent
set autoindent			" auto indentation
set copyindent			" copy the previous indentation on autoindenting
set smartindent

" do not behave like vi
:set nocompatible

:set history=50			" How many lines of history to remember
":set background=dark	"background color
:set cmdheight=2 		"command height
:set backspace=2 		"use backspace
:set nu 				"show line numbers
:set incsearch			"show searching result in real time
:set hlsearch			"highlight the search result
:set showmatch			"show match when using 'sp' to open file
:set wildmenu			"show match when using 'sp' to open file
:set cursorline
":hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

:set showmode			"set mode message ( --INSERT-- ) 

"tab 
:set shiftwidth=4
:set tabstop=4

"================ file encoding===================
"set fileencodings=big5,utf-8
"saving file with utf-8 encoding
"set termencoding=utf-8
"set enc=utf-8
"set tenc=utf8

"================ status line information =======================
"set statusline=%4*%<\ %1*[%F]
"set statusline+=%4*\ %5*[%{&encoding}, " encoding
"set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
"set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
"highlight User1 ctermfg=red
"highlight User2 term=underline cterm=underline ctermfg=green
"highlight User3 term=underline cterm=underline ctermfg=yellow
"highlight User4 term=underline cterm=underline ctermfg=white
"highlight User5 ctermfg=cyan
"highlight User6 ctermfg=white

"=============== folding ===============================
"folding
"zo: open fold
"zO: open all fold
"zc: Close Fold 
"zC: Close all Fold 
"zm: ?券8蝮株絲靘?撠?foldlevel-1) 
"zM: ?券8蝮株絲靘?閮?foldlevel=0)
"zf: 鋆賭??箄絲憪?Fold 蝚西?
"zF: 鋆賭??箄絲憪?蝯偏 Fold 蝚西?
":set foldmarker={,}
:set foldmethod=syntax "marker or syntax
"maximum number of folding layers 
:set foldnestmax=10
":set nofen
":set fdl=0
:syntax on

"=============== separate setting for gvim and vim in console =========================
if (has("gui_running"))
	"some settings for gvim
	"set nowrap
	"set guioptions+=b
	colorscheme torte
	set guifont=Monaco:h14
else
	"some settings for console
	"set wrap
	set term=xterm-256color
	colorscheme torte
endif

"Always display the current cursor position in the lower 
"right corner of the Vim window.
:set ruler

" For full type font, in case if such word out of order
if exists("&ambiwidth")
	:set ambiwidth=double
endif

"set mode message ( --INSERT-- ) to green
":hi ModeMsg cterm=bold ctermfg=green ctermbg=none  


"turn the commond color from deep blue to dark cyan
:hi Comment ctermfg=darkcyan
:hi Search term=reverse ctermbg=red ctermfg=white
:hi Normal cterm=reverse ctermbg=black ctermfg=white

" Line highlight
":set cursorline
:highlight Cursorline cterm=underline ctermfg=none ctermbg=none 
" Column highlight
:highlight CursorColumn cterm=bold ctermfg=none ctermbg=Magenta 
"   cterm =  
"	following items (in any order):
"		bold
"		underline
"		undercurl	not always available
"		reverse
"		inverse		same as reverse
"		italic
"		standout
"		NONE		no attributes used (used to reset it)

" Translation by Yahoo dictionary	(Perl required)
":set keywordprg=ydict

"=======hot key=========================================================

" Move vertically in the window through the horizontal splits... 
map wa <C-w>< 
map wd <C-w>> 
"Move horizontally in the window through the vertical splits... 
map ww <C-w>+
map ws <C-w>-

"key mapping for Tabs
" go to {num}th tab
" {num} gt
" switch between tabs
" ctrl + pgup/pgdn

" switch hllight search by F2
:map <F2> :set hls!<BAR>set hls?<CR>
" switch syntax by F3
:map <F3> :
			\   if exists("syntax_on") <BAR>
			\       syntax off <BAR>
			\   else <BAR>
			\       syntax enable <BAR>
			\   endif <CR>
" you need install 'cscope' first
:map <F5> : call AddCsTag()<CR>

function LoadCsTag()
	if filereadable("cscope.out")
		execute "cs add cscope.out"
	endif
endfunction

function AddCsTag()
	if(executable('cscope') && has("cscope") )
		if(has('win32'))
			silent! execute "!dir /b *.c,*.cpp,*.h,*.cs >> cscope.files"
			silent! execute "!cscope -Rbk"
		else
			silent! execute "!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.py" > cscope.files"
			silent! execute "!cscope -Rbkq"
		endif
		silent! execute "call LoadCsTag()"
		exec "redraw!"
	endif
endfunction
set cst " to search cscope database and tag files
set nocsverb " prompts whether a failure occurs when add a database 


" CursorLine
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":map <F5> <ESC>:set cursorcolumn!<CR>:set cursorcolumn?<CR>

:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:map <F6> <ESC>:set cursorline!<CR>:set cursorline?<CR>
"	code_complete

":map <F8> <ESC>:!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q <ESC>

":map <F9> <ESC>:TlistToggle<CR>:TlistUpdate<CR>
"	NERDTree
":map <F10> <ESC>:NERDTreeToggle<CR>:TlistUpdate<CR>

":map <F1> :w<cr>:!python %<cr>  
":map <F2> :call RunPython()<CR>
":map <F3> :call CheckPythonSyntax()<CR>
":map <F4> :call CompileRunGcc()<CR>
function RunPython()
	exec "w"
	exec "!python %"
endfunc
function CheckPythonSyntax() 
	let mp = &makeprg 
	let ef = &errorformat 
	let exeFile = expand("%:t") 
	setlocal makeprg=python\ -u 
	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
	silent make % 
	copen 
	let &makeprg     = mp 
	let &errorformat = ef 
endfunction
func! CompileRunGcc()
	exec "w"
	exec "!g++ % -o %<"
	exec "!./%<"
endfunc


" The switch of the Source Explorer 
"nmap <F8> :SrcExplToggle<CR> 
"
" Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 4
" Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
"
" Set 'Enter' key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
"
" Set 'Space' key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
"
" " // In order to Avoid conflicts, the Source Explorer should know what plugins are using buffers.
" And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
			\ "__Tag_bar__", 
			\ "_NERD_tree_", 
			\ "Source_Explorer" 
			\ ] 

"" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" " // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 
"
"" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
"let g:SrcExpl_updateTagsCmd = "ctags -R --c++-kinds=+px --fields=+iaS --extra=+q"
let g:SrcExpl_updateTagsCmd = '-L cscope.files'

"
" // Set <F12> key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>"  

" Trinity :
"
" " Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 

"" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 

" Open and close the Tagbar separately 
nmap <F10> :TrinityToggleTagbar<CR> 
"
" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR>  "


