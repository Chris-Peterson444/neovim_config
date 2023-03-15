local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files,
    {desc = '[P]roject [F]iles'})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = 'git files'})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
    {desc = '[P]roject [S]earch'})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {desc = '[V]im [H]elp'})
vim.keymap.set('n', '<leader>vb', builtin.buffers, {desc = '[V]im [B]uffers'})
vim.keymap.set('n', '<leader>vg', builtin.live_grep, { desc = '[V]im [G]rep' })
vim.keymap.set('n', '<leader>vr', builtin.lsp_references, {desc = '[V]iew [R]eferences'})
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, {  desc = '[D]ocument [S]ymbols' } )
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })

-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 0,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find , { desc = '[/] Fuzzily search in current buffer' })
