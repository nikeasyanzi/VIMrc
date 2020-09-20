
if has("unix")
    " tell VIM where to find tags
    set tags+=$HOME/.vim/tags/stl_tags,./tags,./TAGS,tags;~,TAGS;~
	let g:vimrc_iswindows=0
	
else
    set tags+=$VIM/vimfiles/tags/stl_tags,./tags,./TAGS,tags;~,TAGS;~
	let g:vimrc_iswindows=1
	behave mswin
endif

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"===============================
"   VIM Appearence
"===============================
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" VIM theme
Plug 'vim-airline/vim-airline'
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='gotham'
let g:airline_theme='simple'
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




" A command line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"===============================
"   Syntax, code complete
"===============================
" Syntax check
Plug 'vim-syntastic/syntastic'

" Code pattern generation ex. for, if, else
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" to generate configfile for YOU COMPLETEME
" Plug 'Valloric/YouCompleteMe'
" Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"tagbar:generate code tag, but it needs 'Ctags'!!!
Plug 'majutsushi/tagbar'

"===============================
"   go
"===============================
Plug 'nsf/gocode'

let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}


"===============================
"   Style and formatter
"===============================


" General formatter
Plug 'Chiel92/vim-autoformat'

" alignment plugin
Plug 'junegunn/vim-easy-align'

call plug#end()


" 檔案編碼
filetype off           " required!
filetype plugin on
filetype indent on     " 
set encoding=utf-8
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936,cp950
 
" 編輯喜好設定                                                                                                                                                                                                     
syntax on        " 語法上色顯示
set nocompatible " VIM 不使用和 VI 相容的模式
" set ai           " 自動縮排
set shiftwidth=4 " 設定縮排寬度 = 4 
set tabstop=4    " tab 的字元數
set softtabstop=4
set expandtab   " 用 space 代替 tab
set showmatch			"show match when using 'sp' to open file
set wildmenu			"show match when using 'sp' to open file
 
set ruler        " 顯示右下角設定值
set cmdheight=2 		"command height
set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫
set ru           " 第幾行第幾個字
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
set cursorline   " 顯示目前的游標位置
set ruler        " 設定尺規
set nu
set laststatus=2
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]

"===============================
"   Detail setting for VIM Appearence
"===============================
if (has("gui_running"))
	"some settings for gvim
	"set nowrap
	"set guioptions+=b
    "colorscheme gotham
    let base16colorspace=256
    colorscheme koehler
    set guifont=Monaco:h12 
else
	"some settings for console
	"set wrap
	set term=xterm-256color
	colorscheme koehler
	"colorscheme torte
endif



" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·

"===============================
"   Detail plugin setting for syntax, code complete
"===============================

"Autoformat, you need install clang-format package first. 
"rhysd/vim-clang-format is another alternatives for auto format
if has("unix") 
	let g:formatterpath = ['/usr/bin/']
else
	"let g:formatterpath = ['$VIM/vim74']
endif

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

set cindent
set autoindent			" auto indentation
set copyindent			" copy the previous indentation on autoindenting

" recommend setting for syntastic
let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '?'
let g:syntastic_warning_symbol = '!'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" config for ycm
let g:ycm_server_python_interpreter='/usr/bin/python3.5'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_key_invoke_completion = '<F3>'
" This would be slow if the tag file is from network
let g:ycm_collect_identifiers_from_tags_files = 1
" The followings are for debugging
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.', '::'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

"nmap \c :YcmCompleter GoTo<CR>
"nmap <C-\>t :YcmCompleter GetType<CR>

