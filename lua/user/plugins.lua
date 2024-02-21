return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'
	},
	{
		'theprimeagen/harpoon'
	},
	"mbbill/undotree",
	"ggandor/leap.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end
	},
	"tpope/vim-fugitive",
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',

	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-omni' },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	'saadparwaiz1/cmp_luasnip',
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	"nvim-telescope/telescope-project.nvim",
	-- "m4xshen/smartcolumn.nvim",
	{ 'glepnir/nerdicons.nvim', cmd = 'NerdIcons', config = function() require('nerdicons').setup({}) end },
	'lervag/vimtex',

	-- colorschemes
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require 'nordic'.load()
		end
	},

	{ 'rose-pine/neovim',       name = 'rose-pine' },
	{ "EdenEast/nightfox.nvim" }
}
