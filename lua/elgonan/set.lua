vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


vim.opt.smartindent = true


vim.opt.wrap = false


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true


vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")


vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.winborder = "rounded"
vim.opt.fillchars:append({ diff = "╱" })
vim.opt.diffopt:append({ "algorithm:histogram", "linematch:60" })

vim.opt.shadafile = "NONE"

vim.g.mapleader = " "


vim.g.loaded_python3_provider = 0


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    severity_sort = true,
    float = { border = "rounded" },
})
