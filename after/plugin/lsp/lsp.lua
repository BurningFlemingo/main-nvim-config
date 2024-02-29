local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.preset("recommended")

-- local signs = { Error = " ", Warning = " ", Hint = " ", Information = "" }

vim.keymap.set("n", "I", vim.lsp.buf.hover, opts)

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "I", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
end
)

lsp.setup()
