return {
	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	},


	-- lua/plugins/rose-pine.lua
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	},

    -- shades of purple theme
    -- {
    --     'Rigellute/shades-of-purple.vim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd("colorscheme shades_of_purple")
    --     end,
    -- },
    -- lualine letsgooooo
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
        branch = 'master',
		lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'python', 'rust', 'javascript', 'typescript', 'lua', 'zig'},
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },

            })
        end,
    },

	-- fugitive vim
	{
		'tpope/vim-fugitive',
	},

	-- mason nvim
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		}
	},


    -- intellisense
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright", "ruff", "angularls" },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Locate the project's virtualenv interpreter, cross-platform.
            -- Returns nil when there is no .venv, letting pyright fall back to
            -- whatever python it finds on PATH.
            local function venv_python(root)
                local candidates = {}
                if root then
                    table.insert(candidates, root .. "/.venv/bin/python")        -- macOS / Linux
                    table.insert(candidates, root .. "/.venv/Scripts/python.exe") -- Windows
                end
                local active = vim.env.VIRTUAL_ENV
                if active then
                    table.insert(candidates, active .. "/bin/python")
                    table.insert(candidates, active .. "/Scripts/python.exe")
                end
                for _, path in ipairs(candidates) do
                    if vim.uv.fs_stat(path) then
                        return vim.fs.normalize(path)
                    end
                end
                return nil
            end

            vim.lsp.config("pyright", {
                capabilities = capabilities,
                before_init = function(_, config)
                    local python = venv_python(config.root_dir)
                    if python then
                        config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
                            python = { pythonPath = python },
                        })
                    end
                end,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })
            vim.lsp.enable("pyright")

            vim.lsp.config("ruff", {
                capabilities = capabilities,
            })
            vim.lsp.enable("ruff")

            local angular_pkg = vim.fn.stdpath("data") .. "/mason/packages/angular-language-server"
            local ngserver_js = angular_pkg .. "/node_modules/@angular/language-server/bin/ngserver"
            local angular_probe = angular_pkg .. "/node_modules"

            vim.lsp.config("angularls", {
                capabilities = capabilities,
                cmd = function(dispatchers)
                    local root = vim.fs.root(0, { "angular.json", "nx.json" }) or vim.fn.getcwd()
                    local cmd = {
                        "node",
                        ngserver_js,
                        "--stdio",
                        "--tsProbeLocations", root .. "/node_modules," .. angular_probe,
                        "--ngProbeLocations", root .. "/node_modules," .. angular_probe,
                    }
                    return vim.lsp.rpc.start(cmd, dispatchers)
                end,
                filetypes = { "typescript", "html", "htmlangular", "typescriptreact", "typescript.tsx" },
                root_markers = { "angular.json", "nx.json" },
            })
            vim.lsp.enable("angularls")

            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }),
            })
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event  = "InsertEnter",
        config =  true
    },


    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {}
    },

    -- git signs
    {
        "lewis6991/gitsigns.nvim",
    },

    -- icons
    {
        "nvim-tree/nvim-web-devicons", lazy = true
    },

    -- blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    -- harpoon 2: the revenge
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    }
}

