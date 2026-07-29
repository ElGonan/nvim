local harpoon = require("harpoon")

-- Inicialización
harpoon:setup({})

-- Abrir la ventana flotante nativa de Harpoon
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Open harpoon window" })

-- Agregar y quitar el archivo actual
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
    { desc = "Add file to harpoon" })

vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end,
    { desc = "Remove current file from harpoon" })

-- Navegación rápida por posición
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
    { desc = "Select spot 1" })

vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end,
    { desc = "Select spot 2" })

vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end,
    { desc = "Select spot 3" })

vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end,
    { desc = "Select spot 4" })
