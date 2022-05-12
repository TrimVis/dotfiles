" save files as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!


"" use leader-s/d to immediately fix last/next spelling mistake using first suggestion
"inoremap <leader>s <c-g>u<Esc>[s1z=`]a<c-g>u
"nnoremap <leader>s [s1z=`]a
"inoremap <leader>d <c-g>u<Esc>]s1z=`]a<c-g>u
"nnoremap <leader>d ]s1z=`]a
"" use leader-w/e to choose how to fix last/next spelling mistake
"inoremap <leader>w <c-g>u<Esc>[sz=
"nnoremap <leader>w [sz=
"inoremap <leader>e <c-g>u<Esc>]sz=
"nnoremap <leader>e ]sz=


"------------------------------------------------------------------------------------------
" Leaders
"------------------------------------------------------------------------------------------

" set leader to space and localleader to -
let mapleader =" "
let maplocalleader = "-"

" use , or <leader>l for language-specific bindings
call mapping#add_submenu('l', 'Language')
nmap <silent> , <leader>l



"------------------------------------------------------------------------------------------
" Buffers
"------------------------------------------------------------------------------------------

call mapping#add_submenu('b', 'Buffers')
" list buffers
call mapping#def('b L', 'list', ':ls')
" list and select buffer
nnoremap <leader>bb :ls<CR>:b<Space>
call mapping#def('b b', 'select', ':call feedkeys(":ls\<CR>:b ")')
" previously edited buffer
call mapping#def('b l', 'last', ':b#')
" next and previous buffer
call mapping#def('b n', 'next', ':bnext')
call mapping#def('b p', 'previous', ':bprev')
" delete buffer
call mapping#def('b d', 'delete', ':bdelete')


"------------------------------------------------------------------------------------------
" Panes
"------------------------------------------------------------------------------------------

" easier pane navigation with Ctrl+i/j/k/l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

call mapping#add_submenu('p', 'Panes')

" pane navigation
call mapping#def('p h', 'pane left', '<C-w>h')
call mapping#def('p j', 'pane down', '<C-w>j')
call mapping#def('p k', 'pane up', '<C-w>k')
call mapping#def('p l', 'pane right', '<C-w>l')

" pane resizing with Ctrl+Alt+i/j/k/l
let horiz_resize_step = 2
let vert_resize_step = 5
execute 'map <C-M-h> :vertical resize -' . vert_resize_step . '<CR>'
execute 'map <C-M-j> :resize +' . horiz_resize_step . '<CR>'
execute 'map <C-M-k> :resize -' . horiz_resize_step . '<CR>'
execute 'map <C-M-l> :vertical resize +' . vert_resize_step . '<CR>'

call mapping#add_submenu('p r', 'Resize')
call mapping#def('p r h', 'shrink vertically', ':vertical resize -' . vert_resize_step)
call mapping#def('p r j', 'grow horizontally', ':resize +' . horiz_resize_step)
call mapping#def('p r k', 'shrink horizontally', ':resize -' . horiz_resize_step)
call mapping#def('p r l', 'grow vertically', ':vertical resize +' . vert_resize_step)

" split current pane
call mapping#add_submenu('p s', 'Split')
call mapping#def('p s v', 'vertical', ':vsplit')
call mapping#def('p s h', 'horizontal', ':split')


"------------------------------------------------------------------------------------------
" Tabs
"------------------------------------------------------------------------------------------

" the number of tabs to handle in absolute tab number mappings (like move to i-th)
let abs_num_tabs = 5

" use \ as tab leader
nmap <silent> \ <leader>t

" easier tab cycling with Alt+h/l
map <silent> <M-h> :tabp<CR>
map <silent> <M-l> :tabn<CR>

call mapping#add_submenu('t', 'Tabs')

" go to next/previous tab
call mapping#def('t n', 'Next', 'gt')
call mapping#def('t p', 'Previous', 'gT')

" go to i-th tab
for i in range(1, abs_num_tabs)
    call mapping#def('t ' . i, 'Tab ' . i, i . 'gt')
endfor

" go to last tab
call mapping#def('t l', 'Last tab', ':tablast')


call mapping#add_submenu('t m', 'Move')

" move tab to i-th position (:tabm i moves to i+1st position)
for i in range(1, abs_num_tabs)
    call mapping#def('t m ' . i, 'Move to ' . i, ':tabm ' . (i-1))
endfor




"------------------------------------------------------------------------------------------
" Copy / Paste
"------------------------------------------------------------------------------------------

call mapping#add_submenu('k', 'Copy-Paste')

" copy/paste to clipboard / selection clipboard
call mapping#add_submenu('k +', 'Clipboard')
call mapping#add_submenu('k *', 'Selection clipboard')

nnoremap +y "+yy
vnoremap +y "+y
nnoremap +p "+p
nnoremap +P "+P
call mapping#def('k + y', 'Copy line', '"+yy')
call mapping#def('k + p', 'Paste line after', '"+p')
call mapping#def('k + P', 'Paste line before', '"+P')

nnoremap *y "*yy
vnoremap *y "*y
nnoremap *p "*p
nnoremap *P "*P
call mapping#def('k * y', 'Copy line', '"*yy')
call mapping#def('k * p', 'Paste line after', '"*p')
call mapping#def('k * P', 'Paste line before', '"*P')


"------------------------------------------------------------------------------------------
" Search / Replace
"------------------------------------------------------------------------------------------

call mapping#add_submenu('s', 'Search/Replace')

" search and replace (with and without confirmation) in whole file
nnoremap <leader>sr :%s//g<Left><Left>
nnoremap <leader>sc :%s//gc<Left><Left><Left>
call mapping#def('s r', 'Search & Replace all')
call mapping#def('s c', 'Search & Replace confirm')



"------------------------------------------------------------------------------------------
" Markers
"------------------------------------------------------------------------------------------

let marker = '<++>'

call mapping#add_submenu('m', 'Markers')

" insert/append marker at current position
execute 'nnoremap <leader>mi i' . marker
execute 'nnoremap <leader>ma a' . marker
call mapping#def('m i', 'Insert')
call mapping#def('m a', 'Append')

" edit next/previous marker ("_c4l changes the next 4 characters and puts them
" into the black-hole register to avoid changing other registers)
execute 'nnoremap <leader>mn /' . marker . '<Enter>:noh<Enter>"_c' . len(marker) . 'l'
execute 'nnoremap <leader>mp ?' . marker . '<Enter>:noh<Enter>"_c' . len(marker) . 'l'
call mapping#def('m n', 'Edit next')
call mapping#def('m p', 'Edit previous')
