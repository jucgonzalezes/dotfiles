return {
	{
		-- Plugin Manager for LSP, DAP, linters, and formatters
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"isort",
					"black",
					"mypy",
					"ruff",
				},
			})
		end,
	},
	{
		-- Bridge mason and lspconfig
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" }, -- pylsp
			})
		end,
	},
	{
		-- Configs for the Nvim LSP client
		"neovim/nvim-lspconfig",
		config = function()
			-- local cmp_on_attach = require("cmp_nvim_lsp").on_attach()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local conda_python_path = vim.fn.system("which python")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			-- lspconfig.pylsp.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({
				capabilities = capabilities,
				root_dir = function(fname)
					return require("lspconfig").util.find_git_ancestor(fname)
						or require("lspconfig").util.path.dirname(fname)
				end,
				settings = {
					python = {
						analysis = {
							extraPath = conda_python_path,
							typeCheckingMode = "off",
							useLibraryCodeForTypes = true,
							autoSearchPaths = true,
							reportUnusedVariable = "none",
						},
					},
				},
				on_attach = function(client, bufnr)
					-- cmp_on_attach(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false -- disable formatting
					client.server_capabilities.documentRangeFormattingProvider = false
					client.handlers["textDocument/publishDiagnostics"] = function() end -- disables diagnostics
					-- Set custom appeareance for the hover box
					client.handlers["textDocument/hover"] =
						vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", max_width = 70, max_height = 15 })

					-- vim.api.nvim_buf_set_keymapa
					-- 	bufnr,
					-- 	"n",
					-- 	"<C-u>",
					-- 	"<cmd>lua vim.lsp.buf.hover()<CR><C-w>j<CR>",
					-- 	{ noremap = true, silent = true }
					-- )
				end,
			})

            -- stylua: ignore
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition " })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to reference" })
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Go to reference" })
			-- vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" }) -- TDB: Incorporate to the LSP server
			vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
			vim.keymap.set("n", "cr", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
	{
		-- Select the virtual environmnet
		"linux-cultist/venv-selector.nvim",
		branch = "regexp", -- Use this branch for the new version
		cmd = "VenvSelect",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {
			settings = {
				options = {
					notify_user_on_venv_activation = false,
				},
			},
		},
		--  Call config for python files and load the cached venv automatically
		ft = "python",
		keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
	},
}
