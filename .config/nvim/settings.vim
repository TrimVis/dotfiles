" make sure vi-compatible mode is off
set nocompatible

" set default encoding
set encoding=utf-8

" automatically reread files that have been changed
set autoread

" enable filetype detection
filetype on
" load filetype-specific settings and indent files
filetype plugin indent on


" --------------------------------------------------------------------------------------------
" Display
" --------------------------------------------------------------------------------------------

" set the default colorscheme
colorscheme gruvbox
" enable syntax highlighting and use 24-bit RGB colors in TUI
set termguicolors
syntax enable

" italicize comments
highlight Comment cterm=italic gui=italic

" highlight matching bracket
set showmatch 

" show relative line numbers
set number relativenumber

" already jump to match while typing search pattern
set incsearch
" highlight matches afterwards
set hlsearch

" splits open at the bottom and right (unlike the default)
set splitbelow splitright

" begin scrolling when cursor is 10 lines away from end
set so=10

" Folds
set foldenable
set foldlevelstart=10
set foldnestmax=10
"space opens and closes folds
"nnoremap <space> za
set foldmethod=indent


" --------------------------------------------------------------------------------------------
" Indentation
" --------------------------------------------------------------------------------------------

" indentation settings
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab


" --------------------------------------------------------------------------------------------
" Editing
" --------------------------------------------------------------------------------------------

" follow ignorecase option for searching tags file
"set tagcase=followic

" wrap (but not break) long lines
set linebreak


" --------------------------------------------------------------------------------------------
" Timeout & Other timings
" --------------------------------------------------------------------------------------------

" wait up to 500ms to complete mappings
set timeoutlen=500

" fire idle events (CursorHold, ...) after 2s
set updatetime=2000




" --------------------------------------------------------------------------------------------
" Spell-checking
" --------------------------------------------------------------------------------------------

set spelllang=en_us,de




" --------------------------------------------------------------------------------------------
" Filetypes
" --------------------------------------------------------------------------------------------

" use latex as filetype for .tex files
let g:tex_flavor = 'latex'

" define names and file endings for programming languages
let g:programming_languages = [
            \'c', 'cpp', 'cuda',
            \'python',
            \'go',
            \'haskell', 'ocaml',
            \'java',
            \'rust',
            \'latex', 'tex',
            \]
let g:programming_language_endings = [
            \'c', 'cpp', 'cxx', 'cu',
            \'py',
            \'go',
            \'hs', 'ocaml',
            \'java',
            \'rs',
            \'tex',
            \]
            
