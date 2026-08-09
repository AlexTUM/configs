function Basic_setup_null()

    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            -- Changing e.g. if statements to ternary, ...
            null_ls.code_actions.ts_node_action,
            -- Snippet engine
            null_ls.completion.luasnip,
            -- Tags completion
            null_ls.completion.tags,
            -- Assembly code fmt
            null_ls.builtins.formatting.asmfmt,
            -- Bibtex database checker and sorter
            null_ls.builtins.formatting.bibclean,
            -- Lua formatter
            null_ls.builtins.formatting.stylua,
            -- Python formatter
            null_ls.builtins.formatting.black,
            -- Protobuf formatter
            null_ls.builtins.formatting.buf,
            -- Alphabetic import sorter and sectioner for python
            null_ls.builtins.formatting.isort,
            -- Harden Shellscripts (quoting variables etc.)
            null_ls.builtins.formatting.shellharden,
            -- Shell formatter (with bash support)
            null_ls.builtins.formatting.shfmt,
            -- Clang format 
            null_ls.builtins.formatting.clang_format,
            -- Cmake formatter
            null_ls.builtins.formatting.cmake_formant,
            -- Rust formatter
            null_ls.builtins.formatting.dxfmt,
            -- Canonical Terraform format and style
            null_ls.builtins.formatting.terraform_fmt,
            -- Python static code checking
            null_ls.builtins.diagnostics.pylint,
            -- Java codestyle checker
            null_ls.builtins.diagnostics.checkstyle,
            -- validate terraform configurations in directory
            null_ls.builtins.diagnostics.terraform_validate,
            -- Python Docstring signature checking
            null_ls.builtins.diagnostics.pydoclint,
            -- GitHub actions linting
            null_ls.builtins.diagnostics.actionlint,
            -- Linter for ansible
            null_ls.builtins.diagnostics.ansiblelint,
            -- Protobuf linter
            null_ls.builtins.diagnostics.buf,
            -- Make linter
            null_ls.builtins.diagnostics.checkmake,
            -- CMake linter
            null_ls.builtins.diagnostics.cmake_lint,
            -- Git Commit linter
            null_ls.builtins.diagnostics.commitlint,
            -- Cpp static code checker
            null_ls.builtins.diagnostics.cppcheck,
            -- Dockerfile linter + best practices
            null_ls.builtins.diagnostics.hadolint,
            -- Terraform security scanner
            null_ls.builtins.diagnostics.tfsec,
            -- Warnings for todo comments
            null_ls.builtins.diagnostics.todo_comments,
            -- definition for current word under cursor
            null_ls.builtin.hover.dictionary,
            -- show value for current env variable under cursor
            null_ls.builtins.hover.printenv,
        }
    })

    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = "LSP formatting of current file (None-LS)" })

end


return {
    "nvimtools/none-ls.nvim",
    config = Basic_setup_null,
}
