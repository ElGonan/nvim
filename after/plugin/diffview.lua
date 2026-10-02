vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", {desc = "Open diff view"})
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", {desc = "Open diff file history"})
vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", {desc = "Close diff view"})

vim.opt.fillchars:append({ diff = "╱" })
vim.opt.diffopt:append({ "algorithm:histogram", "linematch:60" })
vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1e3326" })


require("diffview").setup({
  enhanced_diff_hl = true,
})


