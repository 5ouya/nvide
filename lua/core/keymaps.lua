local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.wo.number = true

map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>f", ":NvimTreeFocus<CR>")
map("n", "<leader>g", ":Neogit<CR>")

-- better indent
map("v", ">", ">gv")
map("v", "<", "<gv")

-- yank
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

map("n", "<F7>", ":tabp<CR>")
map("n", "<F8>", ":tabn<CR>")
map("n", "<F9>", ":FormatWrite<CR>")
