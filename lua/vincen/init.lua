require('vincen.remap') -- keybindings
require('vincen.packer') -- packages
require('vincen.set') -- vim set options
require('vincen.let') -- vim let options
require('mason').setup() -- LSP/Linter/etc things
-- require('mason-lspconfig').setup() --

vim.python3_host_prog = '/home/chrissyp/.config/nvim/venv/bin/python'

local augroup = vim.api.nvim_create_augroup
local VincenGroup = augroup('Vincen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = VincenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
--vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 25

-- autocmd({ "FormatterPost" }, {
--     group = VincenGroup,
--     command = require('formatter')
-- })
