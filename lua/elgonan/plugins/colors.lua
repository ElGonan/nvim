return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        function ColorMyPencils(color)
            color = color or "rose-pine"
            -- color = color or "shades_of_purple"
            vim.cmd.colorscheme(color)
            vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1e3326" })

            --bg
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end

        ColorMyPencils()
    end,
}
