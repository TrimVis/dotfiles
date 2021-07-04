" filetypes for which this module is enabled
let g:check#filetypes = g:programming_languages
let g:check#fileendings = g:programming_language_endings

" load neomake plugin for the given filetypes
Plug 'neomake/neomake', { 'for': g:check#filetypes }

" initialize module only when neomake is loaded (ensures right filetype)
augroup CheckInit
    autocmd!
    autocmd User neomake call check#_init()
augroup END


" configuration after plugins are loaded (only called for some filetypes)
function check#_init() abort
    " enable signcolumn (otherwise it appears and disappears with errors)
    set signcolumn=yes

    " maximum height of location/quickfix list
    let g:neomake_list_height = 5
    " don't open list automatically (set to 2 to enable and preserve cursor location)
    let g:neomake_opoen_list = 0
    " place signs in signcolumn (for appearance see :h neomake-signs)
    let g:neomake_place_signs = 1
    " don't highlight lines with items from location/quickfix list
    let g:neomake_highlight_lines = 0
    " show warning and error count in airline
    let g:airline#extensions#enabled = 1
    " automatically run neomake upon writing (w/o delay) (only execute once it has loaded)
    call neomake#configure#automake('w')

    " create submenu for this module on <leader>e
    call mapping#add_submenu('e', 'Errors')

    " go to next/previous error
    call mapping#def('e n', 'Next', ':NeomakeNextLoclist')
    call mapping#def('e p', 'Previous', ':NeomakePrevLoclist')
    " go to next/previous quickfix
    call mapping#def('e q', 'Next Quickfix', ':NeomakeNextQuickfix')
    call mapping#def('e Q', 'Previous Quickfix', ':NeomakePrevQuickfix')
    " running neomake manually
    call mapping#def('e r', 'Check', ':Neomake')
    " get info about neomake
    call mapping#def('e i', 'Info', ':NeomakeInfo')
    call mapping#def('e l', 'List Jobs', ':NeomakeListJobs')
    call mapping#def('e c', 'Clean', ':NeomakeClean')
    call mapping#def('e s', 'Status', ':NeomakeStatus')
    " toggle neomake
    call mapping#add_submenu('e t', 'Toggle')
    call mapping#def('e t g', 'Global', ':NeomakeToggle')
    call mapping#def('e t b', 'Buffer', ':NeomakeToggleBuffer')
    call mapping#def('e t t', 'Tab', ':NeomakeToggleTab')
    " enable/disable neomake
    call mapping#add_submenu('e e', 'Enable')
    call mapping#def('e e g', 'Global', ':NeomakeEnable')
    call mapping#def('e e b', 'Buffer', ':NeomakeEnableBuffer')
    call mapping#def('e e t', 'Tab', ':NeomakeEnableTab')
    call mapping#add_submenu('e d', 'Disable')
    call mapping#def('e d g', 'Global', ':NeomakeDisable')
    call mapping#def('e d b', 'Buffer', ':NeomakeDisableBuffer')
    call mapping#def('e d t', 'Tab', ':NeomakeDisableTab')

endfunction
