" register idleboot function to CursorHold events (only on startup)
augroup DeferCmds
    autocmd!
    if has('vim_starting')
        autocmd CursorHold,CursorHoldI * call autocmds#idleboot()
    endif
augroup END


" fire User DeferIdle event and deregister autocmd calling this
function autocmds#idleboot() abort
    augroup DeferCmds
        autocmd!
    augroup END

    doautocmd User Defer
endfunction
