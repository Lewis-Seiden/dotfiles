-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.relativenumber = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { "xiyaowong/transparent.nvim", opts = {} },
    {
    	'MeanderingProgrammer/render-markdown.nvim',
    	dependencies = { 'latex-lsp/tree-sitter-latex', 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    	---@module 'render-markdown'
    	---@type render.md.UserConfig
    	opts = {
		render_modes = true,
		latex = {
		    enabled = true,
		    render_modes = false,
		    converter = { 'utftex', 'latex2text' },
		    highlight = 'RenderMarkdownMath',
		    position = 'center',
		    top_pad = 0,
		    bottom_pad = 0,
		}
	    },
	
    },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.cmd [[colorscheme moonfly]]
-- Lua initialization file
vim.g.moonflyTransparent = true
vim.g.moonflyUnderlineMatchParen = true

