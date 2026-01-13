local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities
if cmp_lsp_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
else
    capabilities = vim.lsp.protocol.make_client_capabilities()
end
-- mason + mason-lspconfig
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "gopls" },
})
-- Global LspAttach: keymaps + omnifunc + optional format-on-save
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = bufnr }

        -- use LSP for omnifunc (works with <C-x><C-o> and as cmp fallback)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- keymaps
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        -- optional: format on save via LSP
        if client and client:supports_method("textDocument/formatting") then
            local group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
            vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
vim.diagnostic.config({
    virtual_text = false,          -- disable inline/right-of-line text
    virtual_lines = {
        only_current_line = false, -- show under the cursor line only (optional)
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})

-- 0.11-style server configs
vim.lsp.config["lua_ls"] = {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
}

vim.lsp.config["rust_analyzer"] = {
    capabilities = capabilities,
}

vim.lsp.config["pyright"] = {
    capabilities = capabilities,
}

vim.lsp.config["gopls"] = {
    capabilities = capabilities,
}

-- for cmp-style UI
vim.o.completeopt = "menu,menuone,noselect"

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args) end, -- or your snippet engine
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = "nvim_lsp" },
        -- { name = "buffer" },
        -- { name = "path" },
    },
})
