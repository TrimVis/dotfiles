let g:config_path=stdpath('config')

"------------------------------------------------------------------------------------------
" Basic Settings
"------------------------------------------------------------------------------------------

" load general settings
execute 'source ' . g:config_path . '/settings.vim'
" load default keybindings
execute 'source ' . g:config_path . '/bindings.vim'
" set up default autocmds
execute 'source ' . g:config_path . '/autocmds.vim'


"------------------------------------------------------------------------------------------
" Custom Modules
"------------------------------------------------------------------------------------------

" default modules
let g:default_modules = [
            \'autocomplete',
            \'snippets',
            \'lsp',
            \'filetree',
            \'statusline',
            \'comment',
            \'git',
            \]


"------------------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------------------

" initialize plugin management
call plugins#init()

" load leader menu plugin
Plug 'liuchengxu/vim-which-key'

" load selected plugins
call plugins#load()

" load modules so they can load their plugins
for b:module in g:default_modules
    call module#add(b:module)
endfor


" finish plugin management
call plugins#finish()

" initialize leader menu
call mapping#init()

" initialize loaded modules
call module#init()
