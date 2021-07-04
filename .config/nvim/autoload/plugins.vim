function plugins#load() abort
    " vim startup screen
    Plug 'mhinz/vim-startify'
    " add more text object targets (e.g. di[ to delete inside brackets)
    DeferPlug 'wellle/targets.vim'

    " latex plugin and concealing
    Plug 'lervag/vimtex', { 'for': 'latex' }
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'latex'}
    " PEP8-compliant python indenting
    Plug 'vimjas/vim-python-pep8-indent', { 'for': 'python' }
    " better syntax highlighting for C++
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
    " Haskell IDE
    "Plug 'neovimhaskell/haskell-vim'
    "" Neomake (required by intero)
    "Plug 'neomake/neomake'
    "" Intero (ghci session in vim)
    "Plug 'parsonsmatt/intero-neovim'
endfunction


" initialize plugin manager
function plugins#init() abort
    " Install VimPlug if not already installed
    if ! filereadable(expand(g:config_path . '/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins ..."
        execute 'silent !mkdir -p ' . g:config_path . '/autoload/'
        execute 'silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ' . g:config_path . '/autoload/plug.vim'
        autocmd VimEnter * PlugInstall
    endif

    " initialize VimPlug
    call plug#begin(g:config_path . '/plugged')
endfunction

" finalize plugin manager
function plugins#finish() abort
    call plug#end()
endfunction



" list of deferred plugins, loaded when user idle
let g:plugins#deferred = []

" load plugin deferred
function! plugins#defer_load(name, ...)
    " echo a:000
    if !has("vim_starting")
        return
    endif
    let opts = get(a:000, 0, {})
    let cond = 1
    if has_key(opts, 'cond')
        let cond = opts['cond']
    endif
    let opts = extend(opts, { 'on': [], 'for': [] })
    Plug a:name, opts
    if cond
        let g:plugins#deferred = g:plugins#deferred + split(a:name, '/')[1:]
    endif
endfunction

" add convenience command DeferPlug similar to Plug
command! -nargs=* DeferPlug call plugins#defer_load(<args>)

" autocommands to load all deferred plugins
augroup DeferredPluginLoad
    au!
    autocmd User Defer call plug#load(g:plugins#deferred)
                \ | echom "deferred load completed for ". len(g:plugins#deferred) . " plugins"
                \ | autocmd! DeferredPluginLoad
augroup END
