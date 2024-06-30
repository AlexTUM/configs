function basic_setup() 

    vim.cmd.colorscheme "catppuccin"
    require("catppuccin").setup({
        flavour = "macchiato",
        styles = {
            conditionals = { "italic" },
            loops = { "italic" },
            keywords = { "bold" },
        },
        integrations = {
            neotree = true,
            telescope = {
                enabled = true,
            },
        },
    })

end

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catpuccin",
    priority = 1000,
    config = basic_setup
}

