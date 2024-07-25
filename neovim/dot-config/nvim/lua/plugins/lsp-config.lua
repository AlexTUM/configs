function Basic_setup_mason()

    require("mason").setup({
        max_concurrent_installers = 6,
    })

end

function Basic_setup_mlspconfig()

    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "typos_lsp",
            "bashls",
            "clangd",
            "neocmake",
            "dockerls",
            "docker_compose_language_service",
            "jsonls",
            "jdtls",
            "ltex",
            "autotools_ls",
            "pylsp",
            "rust_analyzer",
            "terraformls",
        },
    })

end

function Basic_setup_lsp()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.typos_lsp.setup({ capabilities = capabilities })
    lspconfig.bashls.setup({ capabilities = capabilities })
    lspconfig.clangd.setup({ capabilities = capabilities })
    lspconfig.neocmake.setup({ capabilities = capabilities })
    lspconfig.dockerls.setup({ capabilities = capabilities })
    lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })
    lspconfig.jsonls.setup({ capabilities = capabilities })
    lspconfig.jdtls.setup({ capabilities = capabilities })
    lspconfig.ltex.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            require("ltex_extra").setup({
                load_langs = { "en-US" }
            })
        end,
    })
    lspconfig.autotools_ls.setup({ capabilities = capabilities })
    lspconfig.pylsp.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    lspconfig.terraformls.setup({ capabilities = capabilities })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {}, vim.lsp.buf.rename, {})
end

return {
    {
        "barreiroleo/ltex_extra.nvim",
        lazy = false,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = Basic_setup_mason,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = Basic_setup_mlspconfig,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = Basic_setup_lsp,
    },
}
