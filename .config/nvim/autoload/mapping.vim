" leader mappings menu for leader and localleader
let g:mapping#leadermap = {}
let g:mapping#lleadermap = {}

"let g:mapping#leadermap.p = {
"            \'name': '+printing',
"            \'h': 'hello',
"            \'m': 'moin',
"            \}
"
"let g:mapping#leadermap.b = {
"      \ 'name' : '+buffer' ,
"      \ '1' : ['b1'        , 'buffer 1']        ,
"      \ '2' : ['b2'        , 'buffer 2']        ,
"      \ 'd' : ['bd'        , 'delete-buffer']   ,
"      \ 'f' : ['bfirst'    , 'first-buffer']    ,
"      \ 'h' : ['Startify'  , 'home-buffer']     ,
"      \ 'l' : ['blast'     , 'last-buffer']     ,
"      \ 'n' : ['bnext'     , 'next-buffer']     ,
"      \ 'p' : ['bprevious' , 'previous-buffer'] ,
"      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
"      \ }
"let g:mapping#leadermap.o = {
"      \ 'name' : '+open',
"      \ 'q' : 'open-quickfix'    ,
"      \ 'l' : 'open-locationlist',
"      \ }



function mapping#init()
    call which_key#register(g:mapleader, "g:mapping#leadermap")
    nnoremap <silent> <leader> :<c-u>WhichKey '<leader>'<CR>
    vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<leader>'<CR>
endfunction


"function mapping#finish()
"endfunction



" convenience function to create a new submenu in the leader menu
" path: path of the new submenu
" name: name of the submenu to create
function mapping#add_submenu(path, name) abort
    let l:name = '+' . a:name
    " navigate to the submenu in which to create the new one
    let l:menu = g:mapping#leadermap
    let l:path = split(a:path, ' ')
    for parent in l:path[:-2]
        if ! has_key(l:menu, parent)
            echoerr 'Path ' . join(l:path[:-2], ' ') . ' does not exist in leader menu'
            return
        endif
        let l:menu = l:menu[parent]
    endfor
    " create the new submenu (if it doesn't already exist)
    let l:key = l:path[-1]
    if has_key(l:menu, l:key)
        echoerr 'Submenu ' . l:key . ' in ' . join(l:path[:-2], ' ') . ' already exists'
        return
    endif
    let l:menu[l:key] = {'name': l:name}
endfunction



" convenience function to give a name and possibly command to a (possibly existing) mapping
" seq: key sequence of the mapping to name, separated by spaces
" name: name to display for the mapping
" opt1: command to execute for the mapping
function mapping#def(seq, name, ...) abort
    " navigate to the submenu in which to create the new one
    let l:menu = g:mapping#leadermap
    let l:path = split(a:seq, ' ')
    for key in l:path[:-2]
        if ! has_key(l:menu, key)
            echoerr 'Path "' . join(l:path[:-2], ' ') . '" does not exist in leader menu'
            return
        endif
        let l:menu = l:menu[key]
    endfor
    " create the new entry with just its name or command and name
    let l:key = l:path[-1]
    if a:0 > 0
        let l:cmd = mapping#escape(a:1)
        let l:menu[l:key] = [l:cmd, a:name]
    else
        let l:menu[l:key] = a:name
    endif
endfunction




function mapping#escape(value) abort
    let l:value = a:value
    " escape Enter or Escape if command starts with colon and ends with <CR>
    if l:value =~? ':.\+<cr>$'
        " remove <CR> in the end
        let l:value = l:value[:-5]
        let l:value = substitute(l:value, '<cr>', "\<cr>", 'g')
        let l:value = substitute(l:value, '<CR>', "\<CR>", 'g')
        let l:value = substitute(l:value, '<Esc>', "\<Esc>", 'g')
    endif
    return l:value
endfunction
