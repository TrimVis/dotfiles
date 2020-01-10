let mapleader =","

"Make sure VimPlug is installed, if not install it
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

"Plugins:
call plug#begin('~/.config/nvim/plugged')
	"Restore last location in files
	Plug 'farmergreg/vim-lastplace'
	"Replace 'surrounding' characters (see :help surround)
	Plug 'tpope/vim-surround'
	"Shows a file explorer of cwd inside vim
	Plug 'scrooloose/nerdtree'
	"Nice git workflow inside vim
	Plug 'jreybert/vimagit'
	"Comment out lines using gcc
	Plug 'tpope/vim-commentary'
	"Advanced error/warning detection
	Plug 'vim-syntastic/syntastic'
	"Advanced tabular creation
	Plug 'godlygeek/tabular'
	"Looks:
	"Statusbar
	Plug 'bling/vim-airline'
	"Distraction free writing
	Plug 'junegunn/goyo.vim'
	"i3 config syntax highlighting inside vim
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'pangloss/vim-javascript'
	"Themes:
	Plug 'Rigellute/rigel'
	Plug 'fielding/vice'
	Plug 'blueshirts/darcula'
	Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
	Plug 'levelone/tequila-sunrise.vim', { 'as': 'tequila-sunrise' }
	Plug 'xdg/vim-darkluma', { 'as': 'darkluma' }
	Plug 'arzg/vim-colors-xcode', { 'as': 'xcode' }
	Plug 'mcmartelle/vim-monokai-bold', { 'as': 'monokai' }
	"Disabled:
	"Easy markdown like highlighting directly in vim
	"Plug 'vimwiki/vimwiki'
	"Plug 'octol/vim-cpp-enhanced-highlight', { 'as': 'vim-cpp' }
call plug#end()

"Basics:
colorscheme xcodedark
set encoding=utf-8
set nocompatible
filetype plugin on
syntax on
" automatically read changes made to file
set autoread
"not working
"set clipboard+=unnamedplus

"Indentation:
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

"Navigation:
set number relativenumber
" leave 9 lines below or underneath cursor when scrolling
set so=9
" Enable autocompletion:
set wildmode=longest,list,full
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright
" Shortcutting cycling through tabs
map <C-[> :tabp<CR>
map <C-]> :tabn<CR>
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Plugins:
" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo<CR>
" Nerd tree - file navigation
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Syntastics
" set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"Spellcheck:
map <leader>oe :setlocal spell! spelllang=en_us<CR>
map <leader>od :setlocal spell! spelllang=de_de<CR>

"Shortcuts:
" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>
" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>
" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l
" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"Custom Behaviour:
" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Automatically deletes all trailing whitespace on save.
"autocmd BufWritePre * %s/\s\+$//e

" Enable Goyo by default for mutt writting
"autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light