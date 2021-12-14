" Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-lsp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

set completeopt=longest,menuone,noselect ",preview


" helper to check if previous symbol is space
function! Check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction


function autocomplete#init() abort
    lua << EOF
        -- setup nvim-cmp
        local cmp = require('cmp')
        cmp.setup({
            completion = {
                keyword_length = 3,
            },
            snippet = {
              expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
              end,
            },
            mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ['<Tab>'] = function(callback)
              -- skip if whitespace before cursor
              if vim.fn.Check_back_space() == 1 then
                  callback()
              -- if the menu is already open, go to next item
              elseif cmp.visible() then
                  cmp.select_next_item()
              -- otherwise, open the menu
              else
                  cmp.complete()
              end
            end,
            ['<S-Tab>'] = function(fallback)
              -- if vim.fn.pumvisible() == 1 then
              --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
              if cmp.visible() then
                  cmp.select_prev_item()
              else
                fallback()
              end
            end,
          },
          sources = {
            { name = 'nvim_lsp' },   -- language server
            { name = 'ultisnips' },  -- snippets
            { name = 'buffer' },     -- buffers
            { name = 'path' },       -- filesystem paths
            { name = 'spell' },      -- spelling suggestions
            { name = 'latex_symbols' },
            { name = 'omni',
              keyword_pattern = vim.g.vimtex_cmp_kw_regex },
        }
      })
EOF
endfunction
