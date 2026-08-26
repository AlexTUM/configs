local function Basic_config_ll()
    local colors = require("catppuccin.palettes").get_palette("macchiato")

    local theme = {
        normal = {
          a = { fg = colors.base, bg = colors.blue, gui = "bold" },
          b = { fg = colors.text, bg = colors.surface0 },
          c = { fg = colors.text, bg = colors.base },
        },
        insert = {
          a = { fg = colors.base, bg = colors.green, gui = "bold" },
        },
        visual = {
          a = { fg = colors.base, bg = colors.mauve, gui = "bold" },
        },
        replace = {
          a = { fg = colors.base, bg = colors.red, gui = "bold" },
        },
        command = {
          a = { fg = colors.base, bg = colors.peach, gui = "bold" },
        },
        inactive = {
          a = { fg = colors.overlay0, bg = colors.base },
          b = { fg = colors.overlay0, bg = colors.base },
          c = { fg = colors.overlay0, bg = colors.base },
        },
    }

    require("lualine").setup({
        options = {
            theme = theme,
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
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        {
            "catppuccin/nvim",
            name = "catppuccin",
        },
    },
    config = Basic_config_ll,
}
