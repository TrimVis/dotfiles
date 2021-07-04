"--------------------------------------------------------------------------------
" Settings
"--------------------------------------------------------------------------------

let g:vimtex_view_method='zathura'
"inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
"nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Tex-conceal
set conceallevel=2
let g:tex_conceal="abdgm"



"--------------------------------------------------------------------------------
" Vimtex Bindings
"--------------------------------------------------------------------------------

" continuous and single-shot compilation
call mapping#def('l l', 'Compile', ':VimtexCompile')
call mapping#def('l S', 'Compile Single-Shot', ':VimtexCompileSS')
" compile selected lines only
call mapping#def('l E', 'Compile Selection', '<plug>(vimtex-compile-selected)')

" toggle between main and current file only
call mapping#def('l m', 'Toggle Main', ':VimtexToggleMain')

" stop compilation
call mapping#def('l s', 'Stop Compilation', ':VimtexStop')

" open pdf-viewer (with forward-search if possible)
call mapping#def('l v', 'View', ':VimtexView')

" open quickfix errors in case of errors or warnings
call mapping#def('l e', 'Errors', ':VimtexErrors')

" clean auxiliary files
call mapping#def('l c', 'Clean', ':VimtexClean')

" open doc / context menu for command/item under cursor (see :h vimtex-context-menu)
call mapping#def('l d', 'Documentation', ':VimtexDocPackage')
call mapping#def('l M', 'Context Menu', ':VimtexContextMenu')

" show info, current status, and message log
call mapping#def('l i', 'Info', ':VimtexInfo')
call mapping#def('l a', 'Status', ':VimtexStatus')
call mapping#def('l L', 'Log', ':VimtexLog')

" toggle/open table of contents
call mapping#def('l t', 'Toggle TOC', ':VimtexToggle')
call mapping#def('l T', 'Open TOC', ':VimtexTocOpen')


"--------------------------------------------------------------------------------
" Deoplete Vimtex Integration
"--------------------------------------------------------------------------------

call deoplete#custom#var('omni', 'input_patterns', { 'tex': g:vimtex#re#deoplete })
