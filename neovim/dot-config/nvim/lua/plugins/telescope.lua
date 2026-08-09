function Basic_setup_telescope()

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files'} )
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep'} )
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find buffer'} )
    vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = 'Telescope previous files'} )
    vim.keymap.set('n', '<leader>fbc', builtin.current_buffer_fuzzy_find,
        { desc = 'Telescope fuzzy current buffer'} )
    vim.keymap.set('n', '<leader>fv', builtin.git_status, { desc = 'Telescope git status'} )
    vim.keymap.set('n', '<leader>fcm', builtin.git_bcommits, { desc = 'Telescope git commit'} )

end

function Basic_setup_tsui()

    require("telescope").setup({
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                }
            },
        },
    })
    require("telescope").load_extension("ui-select")

end

function Setup_fzf_telescope()
    require('telescope').load_extension('fzf')
end

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = Basic_setup_telescope,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = Basic_setup_tsui,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
        config = Setup_fzf_telescope,
    },
}
