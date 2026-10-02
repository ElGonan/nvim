return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
        "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory",
        "DiffviewFocusFiles", "DiffviewToggleFiles", "DiffviewRefresh", "DiffviewLog",
    },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open diff view" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Open diff file history" },
        { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close diff view" },
    },
    opts = {
        enhanced_diff_hl = true,
    },
}
