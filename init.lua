local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("core/options")
require("core/keymaps")

require("utils/fold")

require("lazy").setup({
	require("plugins/tokyonight"),
	require("plugins/nvimtree"),
	require("plugins/mason"),
	require("plugins/cmp"),
	require("plugins/treesitter"),
	require("plugins/telescope"),
	require("plugins/surround"),
	require("plugins/commentary"),
	require("plugins/git"),
	require("plugins/yanky"),
	require("plugins/auto-save"),
	require("plugins/formatter"),
	require("plugins/git-signs"),

	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"styled-components/vim-styled-components",
	},
})
