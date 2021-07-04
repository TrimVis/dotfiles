" A module is a vimscript file defining plugins and configuration for some functionality
" configuration and plugin loading can be performed in the file itself,
" but everything that requires plugins to be loaded must be done in the <name>#init() function


" list of used modules and plugins imported by modules
let g:module#modules = []

" add a module with the given name
function module#add(name) abort
    " skip if already added
    if index(g:module#modules, a:name) >= 0
        return
    endif
    let l:file = g:config_path . '/modules/' . a:name . '.vim'
    " raise error if module doesn't exist
    if ! filereadable(l:file)
        echoerr 'Module ' . a:name . ' (' . g:config_path . '/modules/' . a:name . '.vim)
                    \ does not exist'
        return
    endif
    " add module to list
    call add(g:module#modules, a:name)
    " source module file
    execute 'source ' . l:file
endfunction


" initialize all modules
function module#init() abort
    for l:module in g:module#modules
        if exists("*" . l:module . "#init")
            execute 'call ' . l:module . '#init()'
        endif
    endfor
endfunction
