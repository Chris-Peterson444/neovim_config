local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
})

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})



local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

-- Don't cycle using tab (or reverse with S-Tab)
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})


-- Table merging function
-- function Merge(...)
--     local arg = {...}
--     local merged = {}
--     for _,t in pairs(arg) do
--         for k, v in pairs(t) do
--             merged[k] = v
--         end
--     end
--     return merged
-- end

lsp.on_attach(function(client, bufnr)


    local function Merge(...)
        local arg = {...}
        local merged = {}
        for _,t in pairs(arg) do
            for k, v in pairs(t) do
                merged[k] = v
            end
        end
        return merged
    end
    local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        Merge(opts, {desc = '[g]oto  [d]efinition'}))

	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        Merge(opts, {desc='hover info'}))

	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        Merge(opts, {desc='[v]iew [w]orkspace [s]ymbol'}))

	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        Merge(opts, {desc='[v]iew [d]efinition'}))

	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, Merge(opts, {desc='[g]oto [n]ext'}))

	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, Merge(opts, {desc='[g]oto [p]rev'}))

	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, Merge(opts, {desc='[v]iew [c]ode [a]ction'}))

	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, Merge(opts, {desc='[v]iew [r]elated [r]eferences'}))

	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, Merge(opts, {desc='[v]iew [r]related and [r]ename'}))

	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, Merge(opts, {desc='[h]elp'}))

end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})
