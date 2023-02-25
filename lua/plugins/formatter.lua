function TsAndTsx(util)
	return function()
		-- conditional formatting
		if util.get_current_buffer_file_name() == "special.ts" then
			return nil
		end

		return {
			exe = "prettier",
			args = {
				"--config-precedence",
				"prefer-file",
				"--stdin-filepath",
				util.escape_path(util.get_current_buffer_file_path()),
			},
			stdin = true,
			try_node_modules = true,
		}
	end
end

return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")

		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				javascript = TsAndTsx(util),
				typescript = TsAndTsx(util),
				typescriptreact = TsAndTsx(util),
				lua = {
					require("formatter.filetypes.lua").stylua, -- stylua need bo be installed
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
