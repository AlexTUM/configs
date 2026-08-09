function Basic_config_ll()

    require("lualine").setup({
        options = {
            theme = "catppuccin",
            extensions = { 'neo-tree', 'toggleterm', 'man', 'lazy', 'fzf' },
            -- tabline = {
            --     lualine_a = {
            --         'tabs',
            --         cond = function()
            --             return #vim.fn.gettabinfo() > 1
            --         end,
            --     },
            --     lualine_b = {},
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = { 'buffers' },
            -- },
        },
    })

end


return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = Basic_config_ll,
}
