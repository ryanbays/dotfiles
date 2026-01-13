local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope-ui-select.nvim'
    },
    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            dependencies = {
                { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
                { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
            },
            build = "make tiktoken",                            -- Only on MacOS or Linux
            opts = {
                system_prompt = 'COPILOT_INSTRUCTIONS',

                model = "gpt-5.1",
                agent = "copilot",
                sticky = { "#buffer", "#files" },
                window = {
                    layout = "float",
                    width = 0.8,
                    height = 0.8,
                },
                question_header = " Query ",
                answer_header = " Answer ",
                error_header = " Error ",
                seperator = " ───────────────────────────────────────────────",

            },
        },
    },
    {
        "AlphaTechnolog/pywal.nvim",
        as = 'pywal'
    },
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    "rose-pine/neovim",
    "navarasu/onedark.nvim",
    {
        'andrew-george/telescope-themes',
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        'nosduco/remote-sshfs.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        opts = {},
    },
    "github/copilot.vim",
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
    },
    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    },
    {                  -- This plugin
        "Zeioth/compiler.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
        opts = {},
    },
    { -- The task runner we use
        "stevearc/overseer.nvim",
        commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1
            },
        },
    },
    {
        "folke/zen-mode.nvim",
        opts = {
        }
    },
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            require('grug-far').setup({
            });
        end
    },
    'rcarriga/nvim-notify',
    'RRethy/vim-illuminate',
    'wbthomason/packer.nvim',
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async'
    },
    'mfussenegger/nvim-dap',
    'lambdalisue/vim-suda',
    {
        'stevearc/conform.nvim',
        opts = {},
    },
    'xiyaowong/transparent.nvim',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    'VidocqH/lsp-lens.nvim',
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
        }
    },
    'kevinhwang91/nvim-hlslens',
    'nvim-tree/nvim-web-devicons',
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
    },
    'lewis6991/gitsigns.nvim',
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
        end,
    },
}

local opt = {}

require('lazy').setup(plugins, opt)
