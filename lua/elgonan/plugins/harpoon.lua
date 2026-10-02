return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        -- Abrir la ventana flotante nativa de Harpoon
        { "<C-e>", function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, desc = "Open harpoon window" },

        -- Agregar y quitar el archivo actual
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Add file to harpoon" },
        { "<leader>r", function() require("harpoon"):list():remove() end, desc = "Remove current file from harpoon" },

        -- Navegación rápida por posición
        { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Select spot 1" },
        { "<C-t>", function() require("harpoon"):list():select(2) end, desc = "Select spot 2" },
        { "<C-n>", function() require("harpoon"):list():select(3) end, desc = "Select spot 3" },
        { "<C-s>", function() require("harpoon"):list():select(4) end, desc = "Select spot 4" },
    },
    config = function()
        require("harpoon"):setup({})
    end,
}
