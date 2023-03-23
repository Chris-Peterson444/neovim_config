vim.keymap.set('i', '<C-\\>', 'copilot#Accept("")', {expr=true, silent=true, replace_keycodes = false})
vim.keymap.set('i', '<C-e>', 'copilot#Dssmiss()', {expr=true, silent=true, replace_keycodes = false})
