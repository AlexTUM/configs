-- colorscheme: catppuccin macchiato

local function setup_cat()
    require("catppuccin").setup({
        flavour = "macchiato",
        styles = {
            conditionals = { "italic" },
            loops = { "italic" },
            keywords = { "bold" },
        },
        integrations = {
            lualine = true,
            mini = true,
            alpha = true,
            fzf = true,
            treesitter_context = true,
            neotree = true,
            telescope = {
                enabled = true,
            },
        },
        custom_highlights = function(colors)
            return {
                CmpPmenu = {
                    bg = colors.mantle,
                    fg = colors.text,
                },

                CmpPmenuBorder = {
                    bg = colors.mantle,
                    fg = colors.surface2,
                },

                CmpSel = {
                    bg = colors.surface1,
                    fg = colors.text,
                },
            }
        end,
    })

    vim.cmd.colorscheme "catppuccin-nvim"
end

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = setup_cat
}
