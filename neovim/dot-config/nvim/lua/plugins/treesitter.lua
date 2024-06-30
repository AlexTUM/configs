function basic_setup() 

    local config = require("nvim-treesitter.configs")
    config.setup({
        ensure_installed = {
            "lua",
            "rust",
            "c",
            "asm",
            "bash",
            "cpp",
            "diff",
            "dockerfile",
            "git_config",
            "git_rebase",
            "gitcommit",
            "gitignore",
            "java",
            "json",
            "json5",
            "kconfig",
            "latex",
            "linkerscript",
            "make",
            "markdown",
            "python",
            "ssh_config",
            "terraform",
            "tmux",
            "toml",
            "yaml",
            "regex"
        },
        highlight = { enable = true },
        indent = { enable = true },
    })

end


return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = basic_setup,
}
