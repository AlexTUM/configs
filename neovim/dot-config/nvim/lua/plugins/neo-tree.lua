function Basic_setup_ntree()

    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', { desc = "Neotree files left" })
    vim.keymap.set('n', '<C-g>', ':Neotree git_status float toggle<CR>', { desc = "Neotree git float" })

    require("neo-tree").setup({
        close_if_last_window = true,
        sort_case_insensitive = true,
        source_selector = {
            winbar = true,
        },
        enable_cursor_hijack = true,
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            "document_symbols",
        },
    })

end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = Basic_setup_ntree,
}
