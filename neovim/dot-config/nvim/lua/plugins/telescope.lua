-- file finder and picker
-- works to find files by name, grep, commits; finds keymaps, references, commands in history etc.
-- keybinds to open UI in different modes

local function setup_telescope()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    telescope.setup({
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                }
            },
        },
        defaults = {
            mappings = {
                i = {
                    ["<Esc>"] = actions.close,
                },
            },
        },
    })
    telescope.load_extension("ui-select")

    pcall(telescope.load_extension, "fzf")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files", })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Fuzzy live grep", })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers", })
    vim.keymap.set('n', '<leader>fco', builtin.oldfiles, { desc = "Find recent files", })
    vim.keymap.set('n', '<leader>fcb', builtin.current_buffer_fuzzy_find, { desc = "Search current buffer", })
    vim.keymap.set('n', '<leader>fv', builtin.git_status, { desc = "Git status", })
    vim.keymap.set('n', '<leader>fcm', builtin.git_bcommits, { desc = "Buffer commits", })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search keymaps", })
    vim.keymap.set("n", "<leader>fcd", builtin.diagnostics, { desc = "Search diagnostics", })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Search references", })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Search definition", })
    vim.keymap.set("n", "<leader>fcg", builtin.grep_string, { desc = "Grep word under cursor", })
    vim.keymap.set("n", "<leader>fh", builtin.command_history, { desc = "Search command history", })
end

return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-ui-select.nvim",
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
            },
        },
        config = setup_telescope,
    },
}
