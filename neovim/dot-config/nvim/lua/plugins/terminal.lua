-- terminal window management
-- keybinds to open tabbed, floating and split terminals

local function set_term_keymaps(term)
    vim.keymap.set("t", "<Esc>", function() term:toggle() end, {
        buffer = term.bufnr,
        silent = true,
        desc = "Hide terminal",
    })
end

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    cmd = { "ToggleTerm", "ToggleTermToggleAll" },
    keys = {
        {
            "<C-t>",
            function()
                require("toggleterm").toggle(1, 10, vim.loop.cwd(), "horizontal")
            end,
            desc = "Toggle terminal at bottom",
        },
        {
            "<leader>tt",
            function()
                local count = vim.v.count1 + 1
                require("toggleterm").toggle(count, 100, vim.loop.cwd(), "tab", "tab-term-" .. count)
            end,
            desc = "Toggleterm tab",
        },
        {
            "<leader>tf",
            function()
                require("toggleterm").toggle(0, 0, vim.loop.cwd(), "float")
            end,
            desc = "ToggleTerm float",
        },
    },
    opts = {
        open_mapping = false,
        on_open = set_term_keymaps,
        hide_numbers = true,
        shade_filetypes = {},
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        float_opts = {
            border = "curved",
        },
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        dir = vim.uv.cwd(),
    },
}
