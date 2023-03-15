vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true , desc = "Toggle Trouble"}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true , desc = "Toggle Trouble [W]orkspace"}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true, desc =  "Toggle Trouble [D]ocument" }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true , desc = "Toggle Trouble [L]oclist"}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true , desc = "Toggle Trouble [Q]uickfix"}
)
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true , desc = "Toggle Trouble [R]eferences"}
)

