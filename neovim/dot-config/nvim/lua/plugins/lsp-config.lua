-- lsp servers for diagnostics etc.
-- Requirements: npm, docker, cmake, gcc (others probably)

local function setup_mason()
	require("mason").setup({
		max_concurrent_installers = 6,
	})
end

local function setup_mlspconfig()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"typos_lsp",
			"bashls",
			"clangd",
			"neocmake",
			"dockerls",
			"docker_compose_language_service",
			"jsonls",
			"jdtls",
			"ltex",
			"autotools_ls",
			"pylsp",
			"rust_analyzer",
			"terraformls",
		},
	})
end

local function setup_lsp()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local servers = {
		"lua_ls",
		"typos_lsp",
		"bashls",
		"clangd",
		"neocmake",
		"dockerls",
		"docker_compose_language_service",
		"jsonls",
		"jdtls",
		"ltex",
		"autotools_ls",
		"pylsp",
		"rust_analyzer",
		"terraformls",
	}
	-- common options for all servers
	for _, server in ipairs(servers) do
		vim.lsp.config(server, {
			capabilities = capabilities,
		})
	end

	-- rustfmt via rust-analyzer
	vim.lsp.config("rust_analyzer", {
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				rustfmt = {
					enable = true,
					-- overrideCommand = {
					--     "/usr/bin/rustfmt",
					--     "--emit",
					--     "stdout",
					-- },
				},
			},
		},
	})

	-- latex specific options
	vim.lsp.config("ltex", {
		capabilities = capabilities,
		cmd_env = {
			JAVA_TOOL_OPTIONS = "-Djdk.xml.totalEntitySizeLimit=200000",
		},
		on_attach = function()
			require("ltex_extra").setup({
				load_langs = { "en-US" },
			})
		end,
	})

	-- enable servers
	vim.lsp.enable(servers)

	-- Buffer-local keymaps are better installed when an LSP attaches.
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(event)
			local buffer = event.buf
			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, {
					buffer = buffer,
					silent = true,
					desc = "LSP: " .. desc,
				})
			end
			-- Remove Neovim's automatic LSP mappings.
			local function unmap(mode, lhs)
				pcall(vim.keymap.del, mode, lhs, { buffer = buffer })
			end

			unmap("n", "K")
			unmap("n", "grn")
			unmap({ "n", "v" }, "gra")
			unmap("n", "grr")
			unmap("n", "gri")
			unmap("n", "gO")
			unmap({ "i", "s" }, "<C-s>")

			map("n", "K", vim.lsp.buf.hover, "hover documentation")
			map("n", "gd", vim.lsp.buf.definition, "Go to definition")
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
			map("n", "grr", vim.lsp.buf.references, "Find references")
			map("n", "gri", vim.lsp.buf.implementation, "Go to implementation")
			map("n", "gO", vim.lsp.buf.document_symbol, "Document symbols")
			map({ "i", "s" }, "<C-s>", vim.lsp.buf.signature_help, "Signature help")
		end,
	})
end

return {
	{
		"barreiroleo/ltex_extra.nvim",
		lazy = false,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = setup_mason,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = setup_mlspconfig,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"barreiroleo/ltex_extra.nvim",
		},
		config = setup_lsp,
	},
}
