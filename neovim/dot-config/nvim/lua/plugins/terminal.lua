-- function BasicTermSetup()
--     require("toggleterm").setup({
--         open_mapping=[[<leader>td]],
--         direction="float",
--         start_in_insert=true,
--         shade_filetypes={},
--         shell=vim.o.shell,
--         size=20,
--     })
-- end

function Set_term_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<c-\><c-n>]], opts)
end

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    cmd = { "ToggleTerm" },
    keys = {
        {
            "<leader>Tt",
            function()
                require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
            end,
            desc = "Toggleterm tab",
        },
        {
            "<leader>Tf",
            function()
                local count = vim.v.count1
                require("toggleterm").toggle(count, 0, vim.loop.cwd(), "float")
            end,
            desc = "ToggleTerm float",
        },
    },
    opts = {
        open_mapping = [[<c-t>]],
        on_open = Set_term_keymaps,
        hide_numbers = true,
        shade_filetypes = {},
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "window" or "float",
        close_on_exit = true,
    },
}
