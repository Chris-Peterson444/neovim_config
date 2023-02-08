local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc = '[a]dd file to harpoon'})
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {desc = '[h]arpoon menu'})
vim.keymap.set("n", "<C-j>", function() ui.nav_next() end,
	{desc = 'next pinned file (harpoon)'})
vim.keymap.set("n", "<C-k>", function() ui.nav_prev() end,
	{desc = 'previous pinned file (harpoon)'})
