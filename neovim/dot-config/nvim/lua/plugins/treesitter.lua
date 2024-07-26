function Basic_setup_sitter()
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
			"regex",
		},
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = Basic_setup_sitter,
}
