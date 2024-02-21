-- Set fillchars
vim.o.fillchars = 'stl:─,stlnc:─'

-- Set statusline
vim.o.statusline = '%F%=%2l:%-2c%=%m'

local active_color = vim.api.nvim_get_hl_by_name("NormalFloat", true)

-- Set highlight for StatusLine
vim.cmd([[highlight StatusLine guifg=active_color]])
