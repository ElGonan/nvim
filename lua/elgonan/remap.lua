vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "File Explorer"})


-- move highlighted chunks of code up n down
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv")


--keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- keep the copied registry
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({'n', 'v'}, '<leader>d', '"_d', { desc = 'Delete to black hole' })


-- asbjornHaland system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


-- words from theprimeagen "never press Q"
vim.keymap.set("n", "Q", "<nop>")


-- quick fixing
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- mega replacer
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")


-- config from what claude gave me
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>",  { desc = "Quit" })
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "jump to def"})


-- splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontal' })

-- Quick escape from insert mode
vim.keymap.set('i', 'vb', '<Esc>', { desc = 'Escape insert' })

-- Quick vsplit
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Split view' })
