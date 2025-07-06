require("conform").setup({
    formatters_by_ft = {
        cpp = { lsp_format = "clangd" },
        lua = { lsp_format = "lua_ls" },
        python = { lsp_format = "jedi_language_server" },
        rust = { lsp_format = "rust_analyzer" },
        go = { lsp_format = "gopls" },
        javascript = {},
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    }
})
