function Basic_setup_sessions()

    local config = require('session_manager.config')
    require("session_manager").setup({
        autoload_mode = config.AutoloadMode.Disabled
    })

end

return {
    "Shatur/neovim-session-manager",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = Basic_setup_sessions,
}
