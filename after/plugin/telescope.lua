local ts = require("telescope")
ts.load_extension("project")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pg', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

vim.keymap.set('n', "<leader>pp", ts.extensions.project.project, { noremap = true, silent = true })
