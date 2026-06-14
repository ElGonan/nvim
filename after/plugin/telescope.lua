local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git file search' })
vim.keymap.set('n', '<leader>ps', '<cmd>Telescope live_grep<CR>', { desc = 'Telescope find text'})
