vim.g.mapleader = " "

-- opens netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, {desc = '[P]roject [V]iew'})
-- clears search highlighting until the next search
vim.keymap.set('n', '<leader>l', vim.cmd.noh, {desc = 'C[l]ear Highlights'})

--Move highlighted block through text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = 'Move highlighted block down'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = 'Move highlighted block up'})

--Move line below at the end of current line, keepiing cursor at front
vim.keymap.set("n", "J", "mzJ`z", {desc = 'Move line below up'})

-- Page up and down while keeping curson in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = 'Page down'})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = 'Page up'})

--keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv", {desc = '[n]ext search - forward'})
vim.keymap.set("n", "N", "Nzzzv", {desc = '[N]ext search - backward'})

-- Instead of replacing copy buffer with highlighted contents when pasting
-- send contents to 'void' buffer
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = '[p]aste without losing copy register'})

-- Just delete into 'void' buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {desc = ''})

-- Originally thanks to asbjornHaland
-- Yank into system clip board (as opposed to just vim's)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {desc = 'System [y]ank'})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = 'Sytem [Y]ank'})

-- remap for taste. Honestly I run into the same thing
--  will keep until I find the difference between the two
vim.keymap.set("i", "<C-c>", "<Esc>", {desc = 'Return to normal mode'})

-- Q 'repeats the last recorded register n times'
-- Apparently this is terrible, will trust for now.
-- Hopefully this doesn't bite me down the road!
vim.keymap.set("n", "Q", "<nop>", {desc = 'Safety feature'})

-- Can't get this working yet. Need tmux server?
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",
    {desc = 'Open new instance in tmux'})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {desc = 'format text'})

-- Quick fix list binds
vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>zz", {desc = ''})
vim.keymap.set("n", "<M-N>", "<cmd>cprev<CR>zz", {desc = ''})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = ''})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = ''})

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    {desc = '[R]eplace currently highlighted word'})

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true },
--     {desc = 'Make current file executable'})

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", {desc = 'CellularAutomaton fun'});

-- Get tired of writing :so all the time?
vim.keymap.set("n", "<leader><leader>", function () vim.cmd("so") end)

-- non lsp formatting
vim.keymap.set("n", "<leader>F", [[:Format<CR>]], {desc = 'Format file with formatter'})
vim.keymap.set("n", "<leader>FW", [[:FormatWrite<CR>]], {desc = 'Format and save file with formatter'})

