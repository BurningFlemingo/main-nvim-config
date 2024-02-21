vim.opt.number = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = false

vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.cursorline = true
vim.opt.history = 1000
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoread = true

vim.opt.termguicolors = true
vim.opt.pumheight = 20

vim.opt.ttyfast = true
vim.opt.signcolumn = "yes:1"

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80" -- replaced by plugin
