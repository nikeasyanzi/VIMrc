
if has("unix")

else
	call plug#begin('~/.vim/plugged')
	
    " tell VIM where to find tags
    set tags+=$HOME/.vim/tags/stl_tags,./tags,./TAGS,tags;~,TAGS;~
	let g:vimrc_iswindows=0
endif
	
    set tags+=$VIM/vimfiles/tags/stl_tags,./tags,./TAGS,tags;~,TAGS;~
	let g:vimrc_iswindows=1
	behave mswin

call plug#begin('~/.vim/plugged')


Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"===============================
"   VIM Appearence
"===============================
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'

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
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'Valloric/YouCompleteMe'


"===============================
"   Theme, Style and formatter
"===============================

" VIM theme
Plug 'whatyouhide/vim-gotham'

" Python code fortmatter
Plug 'python/black'

" alignment plugin
Plug 'junegunn/vim-easy-align'

call plug#end()


" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950
 
" 編輯喜好設定                                                                                                                                                                                                     
syntax on        " 語法上色顯示
set nocompatible " VIM 不使用和 VI 相容的模式
" set ai           " 自動縮排
set shiftwidth=4 " 設定縮排寬度 = 4 
set tabstop=4    " tab 的字元數
set softtabstop=4
set expandtab   " 用 space 代替 tab
 
set ruler        " 顯示右下角設定值
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
endif



" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1


"===============================
"   Detail plugin setting for syntax, code complete
"===============================

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


