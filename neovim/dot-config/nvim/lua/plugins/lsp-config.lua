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

    local servers = {
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
    }
    -- common options for all servers
    for _, server in ipairs(servers) do
        vim.lsp.config(server, {
            capabilities = capabilities,
        })
    end

    -- latex specific options
    vim.lsp.config("ltex", {
        capabilities = capabilities,
        on_attach = function()
            require("ltex_extra").setup({
                load_langs = { "en-US" },
            })
        end,
    })

    -- enable servers
    vim.lsp.enable(servers)

    -- Buffer-local keymaps are better installed when an LSP attaches.
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local opts = { buffer = event.buf, silent = true }

            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
    })
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
