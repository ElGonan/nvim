-- COMENTED SINCE I WILL TRY DIFFVIEW
return {
    "tpope/vim-fugitive",
    enabled = false,
    cmd = { "Git", "G" },
    keys = {
        { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
        { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
    },
    config = function()
        -- Color setting
        vim.api.nvim_set_hl(0, "@diff.plus",  { link = "Added" })
        vim.api.nvim_set_hl(0, "@diff.minus", { link = "Removed" })
        vim.api.nvim_set_hl(0, "@diff.delta", { link = "Changed" })
    end,
}
