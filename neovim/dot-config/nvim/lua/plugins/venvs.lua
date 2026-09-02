-- Select python venv
-- keybinds to select

return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
		"mfussenegger/nvim-dap",
	},
	opts = {
		dap_enabled = true,
		name = { "venv", ".venv" },
	},
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Venv" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Venv from Cache" },
	},
}

-- One potential issue: lsp might not pick up the current venv after selection
-- -> restart with :LspRestart -> ?can the config execute that after switch automatically?
