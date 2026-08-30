-- neo tree: file tree and git UI
-- keymaps to toggle

local function setup_ntree()
    local neo_tree = require("neo-tree")

    neo_tree.setup({
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
    cmd = {
        "Neotree",
    },
    keys = {
        {
            "<C-n>",
            function()
                vim.cmd("Neotree filesystem reveal left")
            end,
            desc = "Neo-tree: Filesystem",
        },

        {
            "<C-g>",
            function()
                vim.cmd("Neotree git_status float toggle")
            end,
            desc = "Neo-tree: Git status",
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = setup_ntree,
}
