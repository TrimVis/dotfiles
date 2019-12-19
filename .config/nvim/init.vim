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
	"Looks:
	"Statusbar
	Plug 'bling/vim-airline'
	"Distraction free writing
	Plug 'junegunn/goyo.vim'
	"i3 config syntax highlighting inside vim
	Plug 'PotatoesMaster/i3-vim-syntax'
	"Themes:
	Plug 'Rigellute/rigel'
	Plug 'fielding/vice'
	Plug 'blueshirts/darcula'
	Plug 'octol/vim-cpp-enhanced-highlight'
	"Disabled:
	"Easy markdown like highlighting directly in vim
	" Plug 'vimwiki/vimwiki'
call plug#end()

"not working
"set clipboard+=unnamedplus
colorscheme rigel

"Basics:
set encoding=utf-8
set nocompatible
filetype plugin on
syntax on
" automatically read changes made to file
set autoread

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

"Plugins:
" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Nerd tree - file navigation
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Spellcheck: 
map <leader>oe :setlocal spell! spelllang=en_us<CR>
map <leader>od :setlocal spell! spelllang=de_de<CR>



" Shortcutting cycling through tabs
"map <C-[> :tabp<CR>
"map <C-]> :tabn<CR>
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
"map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
"map <leader>p :!opout <c-r>%<CR><CR>

" Ensure files are read as what I want:
"let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
"autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
"autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
"autocmd BufRead,BufNewFile *.tex set filetype=tex

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
"autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
"autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
"autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
