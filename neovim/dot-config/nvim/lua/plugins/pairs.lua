-- manage delimiters
-- keybinds for managing surrounding delimiters

return {
    -- Add, delete, and change surrounding delimiters
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = true,
    },
    -- auto insert and manage closing delimiters
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
}
