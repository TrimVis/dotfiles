Plug 'preservim/nerdcommenter'

" don't create default mappings
let g:NERDCreateDefaultMappings = 0
" add spaces after comment sign
let g:NERDSpaceDelims = 1
" always remove extra spaces
let g:NERDRemoveExtraSpaces = 1
" always remove trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" no default alignment of comments
let g:NERDDefaultAlign = 'left'
" use C delimiters as fallback default
let g:NERDAltDelims_c = 1
" also comment/invert empty lines
"let g:NERDCommentEmptyLines = 1
" nest comments (i.e. comment commented lines again)
let g:NERDDefaultNesting = 1
" use placeholders for nested comments using left and right delimiters
let g:NERDUsePlaceHolders = 1
let g:NERDLPlace = '[>'
let g:NERDRPlace = '<]'
" control menu behavior, see :h NERDMenuMode
" no compact sexy comments
let g:NERDCompactSexyComs = 0


" submenu for comments under <leader>c
call mapping#add_submenu('c', 'Comments')

" comment/uncomment line/selection
nmap <silent> <leader>cc <plug>NERDCommenterComment
vmap <silent> <leader>cc <plug>NERDCommenterComment
nmap <silent> <leader>cu <plug>NERDCommenterUncomment
vmap <silent> <leader>cu <plug>NERDCommenterUncomment
call mapping#def('c c', 'Comment')
call mapping#def('c u', 'Uncomment')
" toggle (based on first) / invert (for each line) line/selection
nmap <silent> <leader>ct <plug>NERDCommenterToggle
vmap <silent> <leader>ct <plug>NERDCommenterToggle
nmap <silent> <leader>ci <plug>NERDCommenterInvert
vmap <silent> <leader>ci <plug>NERDCommenterInvert
call mapping#def('c t', 'Toggle')
call mapping#def('c i', 'Invert')
" as above, but force nested
nmap <silent> <leader>cn <plug>NERDCommenterNested
vmap <silent> <leader>cn <plug>NERDCommenterNested
call mapping#def('c n', 'Nested')
" comment with minimal number of delimiters (e.g. multipart)
nmap <silent> <leader>cm <plug>NERDCommenterMinimal
vmap <silent> <leader>cm <plug>NERDCommenterMinimal
call mapping#def('c m', 'Minimal')
" comment sexily
nmap <silent> <leader>cs <plug>NERDCommenterSexy
vmap <silent> <leader>cs <plug>NERDCommenterSexy
call mapping#def('c s', 'Sexy')
" comment and yank
nmap <silent> <leader>cy <plug>NERDCommenterYank
vmap <silent> <leader>cy <plug>NERDCommenterYank
call mapping#def('c y', 'Yank')
" comment until end of line
nmap <silent> <leader>c$ <plug>NERDCommenterToEOL
vmap <silent> <leader>c$ <plug>NERDCommenterToEOL
call mapping#def('c $', 'To EOL')
" insert comments at end of line and enter insert mode there
nmap <silent> <leader>cA <plug>NERDCommenterAppend
vmap <silent> <leader>cA <plug>NERDCommenterAppend
call mapping#def('c A', 'Append')
" switch to alternative commenting style (e.g. /* instead of //)
nmap <silent> <leader>ca <plug>NERDCommenterAltDelims
call mapping#def('c a', 'Switch to Alternative')
" comment with the comment signs aligned to left/right
nmap <silent> <leader>cl <plug>NERDCommenterAlignLeft
vmap <silent> <leader>cl <plug>NERDCommenterAlignLeft
nmap <silent> <leader>cr <plug>NERDCommenterAlignRight
vmap <silent> <leader>cr <plug>NERDCommenterAlignRight
call mapping#def('c l', 'Left-Aligned')
call mapping#def('c r', 'Right-Aligned')

" insert comment at cursor position (only in insert mode)
imap <silent> <c-c> <plug>NERDCommenterInsert
