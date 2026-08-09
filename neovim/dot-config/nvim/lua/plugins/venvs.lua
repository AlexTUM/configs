return {
	"linux-cultist/venv-selector.nvim",
    branch = "regexp",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python", "microsoft/debugpy", "mfussenegger/nvim-dap" },
	opts = {
		dap_enabled = true,
		name = { "venv", ".venv" },
	},
    event = "VeryLazy",
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" , { desc = "Select Venv" }},
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Select Venv from Cache" }},
	},
}
