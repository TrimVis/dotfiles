Plug 'sirver/UltiSnips'

" set UltiSnips snippet path
let g:UltiSnipsSnippetDirectories=[g:config_path . '/UltiSnips']

" use <M-tab> to activate and navigate through snippets and <C-tab> to navigate backwards
let g:UltiSnipsExpandTrigger = '<M-tab>'
let g:UltiSnipsJumpForwardTrigger = '<M-tab>'
let g:UltiSnipsJumpBackwardTrigger = '<C-tab>'
" open edit window in new tab
let g:UltiSnipsEditSplit = 'tabdo'
