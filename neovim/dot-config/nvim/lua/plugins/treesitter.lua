-- treesitter: parser generator. Parses languages into trees for highlighting,indenting and selection
-- Two modules loaded: nvim-treesitter, treesitter-modules
-- Requires: tree-sitter-cli

local function basic_setup_sitter()
	local parsers = {
		"lua",
		"rust",
		"c",
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
		"latex",
		"make",
		"markdown",
		"python",
		"terraform",
		"toml",
		"yaml",
		"regex",
	}

	local treesitter = require("nvim-treesitter")

	treesitter.setup({
		install_dir = vim.fn.stdpath("data") .. "/site",
	})

	treesitter.install(parsers)
end

local function setup_incremental_selection_keymaps()
	local incremental_selection = require("treesitter-modules")

	vim.keymap.set("n", "tnn", incremental_selection.init_selection, {
		desc = "Start Tree-sitter incremental selection",
	})

	vim.keymap.set({ "x", "o" }, "trn", incremental_selection.node_incremental, {
		desc = "Expand selection to the next syntax node",
	})

	vim.keymap.set({ "x", "o" }, "trc", incremental_selection.scope_incremental, {
		desc = "Expand selection to the enclosing scope",
	})

	vim.keymap.set({ "x", "o" }, "trm", incremental_selection.node_decremental, {
		desc = "Shrink Tree-sitter selection",
	})
end


local function basic_setup_treesitter_modules()
	require("treesitter-modules").setup({
		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},
	})

    setup_incremental_selection_keymaps()
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = basic_setup_sitter,
	},

	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = basic_setup_treesitter_modules,
	},
}

