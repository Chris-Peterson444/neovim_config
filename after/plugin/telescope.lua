local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files,
    {desc = '[P]roject [F]iles'})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = 'git files'})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
    {desc = '[P]roject [S]earch'})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
