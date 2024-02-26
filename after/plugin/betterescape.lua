local be = require("better_escape")
be.setup({
	mapping = { ",," },
	timeout = vim.o.timeoutlen,
	clear_empty_lines = false,
	keys = "<Esc>"
})
