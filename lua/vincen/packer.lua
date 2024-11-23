-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim',
        -- tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    })

    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         require("rose-pine").setup({
    --             variant = 'main',
    --         })
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })
    --

    use { "catppuccin/nvim", as = "catppuccin" }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('brenoprata10/nvim-highlight-colors')
    use('tpope/vim-fugitive')
    use('tpope/vim-sleuth')
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    })

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use({ "iamcco/markdown-preview.nvim",
    --     run = "cd app && npm install",
    --     setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    --     ft = { "markdown" },
    -- })

    use('ThePrimeagen/vim-be-good')
    use('folke/zen-mode.nvim')
    use('eandrju/cellular-automaton.nvim')
    use('mfussenegger/nvim-lint')
    use('mhartington/formatter.nvim')
    use('junegunn/fzf')
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    })
    -- Use lualine cuz meh
    use({
        'nvim-lualine/lualine.nvim',
        -- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })
    -- -- Use feline for better catppuccin integration?
    -- use('freddiehaddad/feline.nvim')
    use('folke/neodev.nvim')
    -- use('nvim-tree/nvim-tree.lua')
    use("nvim-tree/nvim-web-devicons")
    -- use("nvim-tree/nvim-web-devicons")
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- use({
    --     'j-hui/fidget.nvim',
    --     config = function()
    --         require('fidget').setup()
    --     end
    -- })
    use('tpope/vim-rhubarb')
    use('lewis6991/gitsigns.nvim')
    use(
        {
            'folke/todo-comments.nvim',

            requires = {
                { 'nvim-lua/plenary.nvim' }
            }
        })
    -- use("github/copilot.vim")
    -- disabled use('lukas-reineke/indent-blankline.nvim')
end)

