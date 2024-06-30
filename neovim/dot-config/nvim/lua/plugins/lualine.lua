function basic_config() 
    
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
    config = basic_config,
}
