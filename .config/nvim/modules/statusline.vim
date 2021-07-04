" statusline with themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git integration
Plug 'tpope/vim-fugitive'


" set theme (dark (default), deus, wombat, minimalist, angr)
let g:airline_theme = 'wombat'
" use powerline symbols instead of unicode
let g:airline_powerline_fonts = 1

" show git information using fugitive
let g:airline#extensions#branch#enabled = 1

" hide parts of fugitive names for better output
let g:airline#extensions#fugitiveline#enabled = 1

" neomake integration
let g:airline#extensions#neomake#enabled = 1

" nerdtree-specific statusline
let g:airline#extensions#nerdtree#enabled = 1

" lsp integration
let g:airline#extensions#nvimlsp#enabled = 1

" adjust title for quickfix/location list buffers
let g:airline#extensions#quickfix#enabled = 1

" statusline for tabs
let g:airline#extensions#tabline#enabled = 1
" only show tabline for more than one tab
"let g:airline#extensions#tabline#tab_min_count = 1
" don't show close button
let g:airline#extensions#tabline#show_close_button = 0
" show number of tabs on right (if > 1)
let g:airline#extensions#tabline#show_tab_count = 1
" show tab number (use 2 to also show number of splits and 0 for only number of splits)
let g:airline#extensions#tabline#tab_nr_type = 1
" don't show tab type (buffers/tabs)
let g:airline#extensions#tabline#show_tab_type = 0
" tab separators ({left[_alt],right[_alt]}_sep)
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
" don't show buffers if only one tab is open (so not to confuse with tabs)
let g:airline#extensions#tabline#show_buffers = 0

" use specific style for builtin terminal
let g:airline#extensions#term#enabled = 1

" vimagit integration
"let g:airline#extensions#vimagit#enabled = 1

" show vimtex info
"let g:airline#extensions#vimtex#enabled = 1

" word counting of document/visual selection
"let g:airline#extensions#wordcount#enabled = 1


" symbols to display for each mode
let g:airline_mode_map = {
            \ '__'     : '-',
            \ 'c'      : 'C',
            \ 'i'      : 'I',
            \ 'ic'     : 'I',
            \ 'ix'     : 'I',
            \ 'n'      : 'N',
            \ 'multi'  : 'M',
            \ 'ni'     : 'N',
            \ 'no'     : 'N',
            \ 'R'      : 'R',
            \ 'Rv'     : 'R',
            \ 's'      : 'S',
            \ 'S'      : 'S',
            \ ''     : 'S',
            \ 't'      : 'T',
            \ 'v'      : 'V',
            \ 'V'      : 'V',
            \ ''     : 'V',
            \ }
