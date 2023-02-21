local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
})

--  Lua config
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- python config
lsp.configure('pylsp', {
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    enabled = true,
                },
                jedi_completion = {
                    include_params = true,
                },
            }
        }
    }
})


-- Get snippet jumping working. Example taken from
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
        -- regular mappings
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-a>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-b>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- snippet jumping
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
    })

-- Don't cycle using tab (or reverse with S-Tab)
-- Trying to avoid conflict with github copilot
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- Setting nvim-cmp settings for search
-- Not adding for cmd line because it breaks current behavior
-- idk why though
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})


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



lsp.on_attach(function(client, bufnr)
    -- local function to combine tables. This needs to be defind here otherwise
    -- the definition won't be found on attach
    local function Merge(...)
        local arg = { ... }
        local merged = {}
        for _, t in pairs(arg) do
            for k, v in pairs(t) do
                merged[k] = v
            end
        end
        return merged
    end
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        Merge(opts, { desc = '[g]oto  [d]efinition' }))

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        Merge(opts, { desc = 'hover info' }))

    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        Merge(opts, { desc = '[v]iew [w]orkspace [s]ymbol' }))

    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        Merge(opts, { desc = '[v]iew [d]efinition' }))

    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, Merge(opts, { desc = '[g]oto [n]ext' }))

    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, Merge(opts, { desc = '[g]oto [p]rev' }))

    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        Merge(opts, { desc = '[v]iew [c]ode [a]ction' }))

    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        Merge(opts, { desc = '[v]iew [r]elated [r]eferences' }))

    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
        Merge(opts, { desc = '[v]iew [r]related and [r]ename' }))

    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, Merge(opts, { desc = '[h]elp' }))
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
