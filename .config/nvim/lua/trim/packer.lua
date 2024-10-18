-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

    -- vim-just syntax
    use('NoahTheDuke/vim-just')

	-- Telescope
	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	-- Pywal colorscheme
	use('dylanaraps/wal.vim')

	-- Rose Pine Colorscheme
	use({ 'rose-pine/neovim', as = 'rose-pine'})

	-- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	})
	use('nvim-treesitter/playground')

	-- Harpoon
	use('nvim-lua/plenary.nvim')
	use('ThePrimeagen/harpoon')

	-- Undotree
	use('mbbill/undotree')

	-- Vim Fugitive
	use('tpope/vim-fugitive')

	-- LSP Zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
end)

