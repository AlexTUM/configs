function Basic_setup_ntree()

    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
    require("neo-tree").setup({
        close_if_last_window = true,
        sort_case_insensitive = true,
    })

end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = Basic_setup_ntree,
}
