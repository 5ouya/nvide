return {
	"zoriya/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
			callbacks = { -- functions to be executed at different intervals
				enabling = nil, -- ran when enabling auto-save
				disabling = nil, -- ran when disabling auto-save
				before_asserting_save = nil, -- ran before checking `condition`
				before_saving = nil, -- ran before doing the actual save
				after_saving = function()
					-- vim.cmd(":FormatWrite")
				end,
			},
		})
	end,
}
