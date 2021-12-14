Plug 'preservim/nerdtree'

" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree')
"            \&& b:NERDTree.isTabTree() | quit | endif


" submenu for filetree mappings
call mapping#add_submenu('f', 'File-Tree')

" open/toggle/close filetree
call mapping#def('f o', 'Open', ':NERDTreeFocus<CR>')
call mapping#def('f t', 'Toggle', ':NERDTreeToggle<CR>')
call mapping#def('f c', 'Close', ':NERDTreeClose<CR>')
" open filetree in VCS root
call mapping#def('f v', 'VCS', ':NERDTreeVCS<CR>')
" find current file, i.e. show current file in currently open tree
call mapping#def('f f', 'Find', ':NERDTreeFind<CR>')
" change root to cwd
call mapping#def('f d', 'CWD', ':NerdTreeCWD<CR>')
" open new filetree
call mapping#def('f n', 'New', ':NERDTree<CR>')
" mirror filetree (i.e. synchronize with already open one)
call mapping#def('f m', 'Mirror', ':NERDTreeMirror<CR>')
" refresh root
call mapping#def('f r', 'Refresh', ':NERDTreeRefreshRoot<CR>')

" display help
call mapping#def('f h', 'Help', ':call feedkeys(''?'')')



" add bookmark support in own submenu?
