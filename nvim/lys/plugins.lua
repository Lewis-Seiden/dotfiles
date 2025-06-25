-- Ik this should be multiple files but lua didnt feel like loading other files so here we are

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd.colorscheme("rose-pine-moon")
        end
    	},
	{
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup()
        end
    	},
	{
	"mfussenegger/nvim-jdtls",
    	},
	{
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
    	},
	{
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    	},	
    	"tpope/vim-fugitive",
	"neovim/nvim-lspconfig",
	'hrsh7th/nvim-cmp',
    	'hrsh7th/cmp-nvim-lsp',
    	'saadparwaiz1/cmp_luasnip',
    	{
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    	},
	{
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}
    }

local opts = {}

require("lazy").setup(plugins, opts)
