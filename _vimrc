
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


" �ɮ׽s�X
set encoding=utf-8
set fileencodings=utf-8,cp950
 
" �s��ߦn�]�w                                                                                                                                                                                                     
syntax on        " �y�k�W�����
set nocompatible " VIM ���ϥΩM VI �ۮe���Ҧ�
" set ai           " �۰��Y��
set shiftwidth=4 " �]�w�Y�Ƽe�� = 4 
set tabstop=4    " tab ���r����
set softtabstop=4
set expandtab   " �� space �N�� tab
 
set ruler        " ��ܥk�U���]�w��
set backspace=2  " �b insert �]�i�� backspace
set ic           " �]�w�j�M�����j�p�g
set ru           " �ĴX��ĴX�Ӧr
set hlsearch     " �]�w���G����ܷj�M���G
set incsearch    " �b����r�٨S������J�����e�N��ܵ��G
set smartindent  " �]�w smartindent
set confirm      " �ާ@�L�{���Ĭ�ɡA�H���T����r�Ӹ߰�
set history=100  " �O�d 100 �ӨϥιL�����O
set cursorline   " ��ܥثe����Ц�m
set ruler        " �]�w�سW
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


