Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-lsp'

let g:deoplete#enable_at_startup = 1
augroup DeopleteAutocmds
    autocmd VimEnter * call deoplete#initialize()
augroup END


set completeopt=longest,menuone,preview

" cycle completion menu with Tab / Shift-Tab
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" open tab-menu unless whitespace (or nothing) before cursor
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


function autocomplete#init() abort
    call deoplete#custom#option('auto_complete', 1)
    call deoplete#custom#option('auto_complete_popup', 'auto')
    call deoplete#custom#option('camel_case', 1)
    " at most 50 entries in menu
    call deoplete#custom#option('max_list', 50)
    " patterns must contain at least 3 characters for completion
    call deoplete#custom#source('_', 'min_pattern_length', 3)
    " don't autocomplete in comments and strings
    "call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

    " Custom Sources
    " collect keywords from omnifunc
    call deoplete#custom#source('omni', 'rank', 500)
    " show snippets in completion menu
    call deoplete#custom#source('ultisnips', 'rank', 1000)
    " complete local files on the file system
    call deoplete#custom#source('file', 'rank', 150)
    " complete keywords from current buffers and opened buffers with same filetype
    "call deoplete#custom#source('buffer')
endfunction
