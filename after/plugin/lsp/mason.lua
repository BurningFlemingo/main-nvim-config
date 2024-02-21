local lsp = require("lsp-zero")

local lsp_servers = {
	"clangd",
	"ltex"
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = lsp_servers,
	automatic_installation = true,
	handlers = {
		lsp.default_setup
	}
})

vim.keymap.set('n', '<leader>m', vim.cmd.mason, {})
