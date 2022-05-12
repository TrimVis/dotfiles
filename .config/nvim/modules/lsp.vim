" filetypes for which this module is enabled
let g:check#filetypes = g:programming_languages

" load nvim lsp plugin
Plug 'neovim/nvim-lspconfig', { 'for': g:check#filetypes }

" initialize module after plugin is loaded
augroup LSPInit
    autocmd!
    autocmd User nvim-lspconfig call lsp#_init()
augroup END


function lsp#_init() abort
    " show signcolumn for errors and warnings (o/w it appears and disappears)
    set signcolumn=yes

    " go to next/previous error/warning/... (also with ]d and [d)
    nnoremap <silent> <leader>ln <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
    nnoremap <silent> <leader>lp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
    call mapping#def('l n', 'Next')
    call mapping#def('l p', 'Previous')
    nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
    nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
    " open location list
    nnoremap <silent> <leader>ll <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
    call mapping#def('l l', 'List')
    " go to declaration/definition/implementation
    nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> <leader>lD <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
    call mapping#def('l d', 'Declaration')
    call mapping#def('l D', 'Definition')
    call mapping#def('l i', 'Implementation')
    " rename
    nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.rename()<CR>
    call mapping#def('l r', 'Rename')
    " show doc in popup window
    nnoremap <silent> <leader>lK <cmd>lua vim.lsp.buf.hover()<CR>
    call mapping#def('l K', 'Hover')
    " highlight occurences of object under cursor
    nnoremap <silent> <leader>lH <cmd>lua vim.lsp.buf.hover()<CR>
    call mapping#def('l H', 'Highlight')
    " format document/selection
    nnoremap <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>
    vnoremap <leader>lf <cmd>lua vim.lsp.buf.range_formatting()<CR>
    call mapping#def('l f', 'Format')
    " find out what these do
    nnoremap <silent> <leader>lt <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> <leader>lT <cmd>lua vim.lsp.buf.type_definition()<CR>
    nnoremap <silent> <leader>lR <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> <leader>le <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
    call mapping#def('l t', 'Signature Help')
    call mapping#def('l T', 'Type Definition')
    call mapping#def('l R', 'References')
    call mapping#def('l e', 'Line Diagnostics')

    let g:lsp_diagnostics_enabled = 1

    " show diagnostic signs
    let g:lsp_signs_enabled = 1
    let g:lsp_signs_error = {'text': '✗'}
    let g:lsp_signs_warning = {'text': '!'}
    let g:lsp_highlights_enabled = 1

    " Do not use virtual text, they are far too obtrusive.
    let g:lsp_virtual_text_enabled = 0
    " echo a diagnostic message at cursor position
    let g:lsp_diagnostics_echo_cursor = 0
    " show diagnostic in floating window
    let g:lsp_diagnostics_float_cursor = 1
    " whether to enable highlight a symbol and its references
    let g:lsp_highlight_references_enabled = 1
    let g:lsp_preview_max_width = 80

    " Highlighting of reads/writes/text occurences of objects
    hi LspReferenceRead cterm=bold ctermbg=red guibg=#393c54
    hi LspReferenceText cterm=bold ctermbg=red guibg=gray29
    hi LspReferenceWrite cterm=bold ctermbg=red guibg=#503954

    " autocommand to clear highlight when cursor moves
    augroup lsp_document_highlight
      autocmd!
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END


    " Language Servers
    lua << EOF
    local lspconfig = require('lspconfig')
    local configs = require('lspconfig/configs')
    local util = require('lspconfig.util')
    -- python
    lspconfig.pylsp.setup{}

    -- C/C++/Cuda/...
    lspconfig.clangd.setup{
        cmd = {"clangd", "--background-index"};
        root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".");
        filetypes = { "c", "cpp", "cuda", "objc", "objcpp" };
    }

    -- LaTeX
    lspconfig.texlab.setup{
        cmd = {"/home/christoph/.cargo/bin/texlab"},
        filetypes = {"latex", "tex", "bib"},
    }

    -- Go
    lspconfig.gopls.setup{
        cmd = {"gopls", "serve"};
        filetypes = {"go", "gomod"};
    }

    -- Rust,
    -- TODO: doesn't work for standalone files
    -- need to be specified on startup via init_options = detachedFiles = {...} }
    lspconfig.rust_analyzer.setup{
        root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".");
    }

    -- Haskell
    lspconfig.hls.setup{
        filetypes = { "haskell" };
        root_dir = util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".");
    }

    -- Java
    if not lspconfig.java_lsp then
        configs.java_lsp = {
            default_config = {
                cmd = {"java-language-server"};
                filetypes = {"java"};
                root_dir = util.root_pattern(".git", ".");
                settings = {};
            };
        }
    end
    lspconfig.java_lsp.setup{}
EOF
endfunction
