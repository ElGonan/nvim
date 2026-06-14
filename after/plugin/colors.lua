function ColorMyPencils(color)
	color = color or "rose-pine"
	-- color = color or "shades_of_purple"
	vim.cmd.colorscheme(color)

	--bg 
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- style
    vim.opt.winborder = 'rounded'
end

ColorMyPencils()
