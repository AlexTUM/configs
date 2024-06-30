function Basic_setup_mason()

    require("mason").setup({
        max_concurrent_installers = 6,
    })

end

function Basic_setup_mlspconfig()

    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "snyk_ls",
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

    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})
    lspconfig.synk_ls.setup({})
    lspconfig.typos_lsp.setup({})
    lspconfig.bashls.setup({})
    lspconfig.clangd.setup({})
    lspconfig.neocmake.setup({})
    lspconfig.dockerls.setup({})
    lspconfig.docker_compose_language_service.setup({})
    lspconfig.jsonls.setup({})
    lspconfig.jdtls.setup({})
    lspconfig.ltex.setup({})
    lspconfig.autotools_ls.setup({})
    lspconfig.pylsp.setup({})
    lspconfig.rust_analyzer.setup({})
    lspconfig.terraformls.setup({})

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
end

return {
    {
        "williamboman/mason.nvim",
        config = Basic_setup_mason,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = Basic_setup_mlspconfig,
    },
    {
        "neovim/nvim-lspconfig",
        config = Basic_setup_lsp,
    },
}
