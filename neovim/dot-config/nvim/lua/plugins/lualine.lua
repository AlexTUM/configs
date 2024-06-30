function Basic_config_ll()

    require("lualine").setup({
        options = {
            theme = "catppuccin",
            extensions = { 'neo-tree' },
        }
    })

end


return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = Basic_config_ll,
}
