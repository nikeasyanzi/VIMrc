"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

"filetype detection
filetype off           " required!
filetype plugin on
filetype indent on     " 

if has("unix") 
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	set tags+=$HOME/.vim/tags/stl_tags
	let g:vimrc_iswindows=0
else
	set rtp+=$VIM/bundle/vundle/
	call vundle#rc('$VIM/bundle/') 
	set tags+=$VIM/vimfiles/tags/stl_tags
	let g:vimrc_iswindows=1
	behave mswin
endif

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
"syntax checker
"Bundle 'scrooloose/syntastic' 
"Insert or delete brackets, parens, quotes in pair.
Bundle 'jiangmiao/auto-pairs'
" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

Bundle 'L9'
"let g:acp_behaviorSnipmateLength = 1	uncomment it will cause error while typeing word initiated with capatalized letter
let g:acp_behaviorKeywordLength = 4
Bundle 'honza/vim-snippets'
" automatically opens popup menu for completions  othree/vim-autocomlpop and omicppcomplete are similar
Bundle 'othree/vim-autocomplpop'
"Bundle 'omnicppcomplete'

"Trnity : the Trinity of taglist, NERDtree and SrcExpl: an IDE works like Source Insight 
Bundle 'Trinity'
Bundle 'brookhong/cscope.vim' 
Bundle 'srcexpl'

"official mirror of vim-script at github
" =============================================
"Bundle 'The-NERD-Commenter'   not work????
" add author information
"Bundle 'AuthorInfo'


"numbers.vim is a plugin for intelligently toggling line numbers
"Bundle 'numbers.vim'


"==Brief Bundles usage help========================================
":BundleList          - list configured bundles
":BundleInstall(!)    - install(update) bundles
":BundleSearch(!) foo - search(or refresh cache first) for foo
":BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

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
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

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
	set guifont=Monaco:h16
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

:map <F5> : call Do_CsTag()<CR>

function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=.svn."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

"function Do_CsTag()
"	if(executable('cscope') && has("cscope") )
"		silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.out"
"
"		"silent! execute /"!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
"		silent! execute "!cscope -b"
"		if filereadable("cscope.out")
"			execute "cs add cscope.out"
"		endif
"	endif
"endf

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


" // The switch of the Source Explorer 
"nmap <F8> :SrcExplToggle<CR> 
"
" " // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 4
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
"
" " // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
"
" " // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
"
" " // In order to Avoid conflicts, the Source Explorer should know what
" plugins 
" " // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
			\ "__Tag_List__", 
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
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsCmd = "ctags -R --c++-kinds=+px --fields=+iaS --extra=+q"
"
" // Set <F12> key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F12>"  
" Trinity :
"
" " Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 

"" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 

" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 
"
" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR>  "


