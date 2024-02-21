local remapable = { noremap = false, silent = true }
local notremapable = { noremap = true, silent = true }

local function map(mode, lh, rh, opts)
	vim.keymap.set(mode, lh, rh, opts)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

map({ "i", "v", "o", "t" }, ",,", "<esc>", notremapable)
map("t", ",,", "<c-\\><c-n>", notremapable)

map("t", "<esc>", "<c-\\><c-n>", notremapable)

map({ "n", "v", "o", "t" }, "L", "$", notremapable)
map({ "n", "v", "o", "t" }, "H", "^", notremapable)
map({ "n", "v", "o", "t" }, "K", "<c-u>zz", notremapable)
map({ "n", "v", "o", "t" }, "J", "<c-d>zz", notremapable)
map({ "n", "o", "t" }, "<a-k>", "<c-b>", notremapable)
map({ "n", "o", "t" }, "<a-j>", "<c-f>", notremapable)
map('n', "<tab>", "<c-w>w", notremapable)

map('v', "<C-j>", ":m '>+1<CR>gv=gv", notremapable)
map('v', "<C-k>", ":m '<-2<CR>gv=gv", notremapable)

map('n', "<cr>", "<cmd>bnext<cr>", notremapable)
map('n', "<bs>", "<cmd>bprev<cr>", notremapable)

map('x', "P", '"_dP', notremapable)

map('n', "<leader>y", '"+y', notremapable)
map('n', "<leader>Y", '"+Y', notremapable)
map('v', "<leader>y", '"+y', notremapable)

map("n", "<leader>d", '"_d', notremapable);
map("v", "<leader>d", '"_d', notremapable);

map("n", "n", "nzzzv", notremapable);
map("n", "N", "Nzzzv", notremapable);

map({ "n", "v" }, "cp", '"+y', notremapable)
map({ "n", "v" }, "cv", '"+p', notremapable)

map({ "n", "i" }, "<c-n>", "<cmd>vsplit<cr><c-w>l", notremapable)
map({ "n", "i" }, "<c-h>", '<c-w>h', notremapable)
map({ "n", "i" }, "<c-l>", '<c-w>l', notremapable)
map({ "n", "i" }, "<c-k>", '<c-w>k', notremapable)
map({ "n", "i" }, "<c-j>", '<c-w>j', notremapable)
