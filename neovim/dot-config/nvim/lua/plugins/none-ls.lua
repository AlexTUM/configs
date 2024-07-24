function Basic_setup_null()

    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.bibclean,
            null_ls.builtins.formatting.terraform_fmt,
            null_ls.builtins.formatting.usort,
            null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.diagnostics.cppcheck,
            null_ls.builtins.diagnostics.checkmake,
            null_ls.builtins.diagnostics.checkstyle,
            null_ls.builtins.diagnostics.commitlint,
            null_ls.builtins.diagnostics.hadolint,
            null_ls.builtins.diagnostics.terraform_validate,
            null_ls.builtins.diagnostics.tfsec,
            null_ls.builtins.hover.printenv,
        }
    })

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})

end


return {
    "nvimtools/none-ls.nvim",
    config = Basic_setup_null,
}
