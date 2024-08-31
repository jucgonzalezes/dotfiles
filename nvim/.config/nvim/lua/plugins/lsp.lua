return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"isort",
					"black",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" }, -- pylsp
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local on_attach = require("cmp_nvim_lsp").on_attach()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			-- lspconfig.pylsp.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })

            -- stylua: ignore
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition " })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to reference" })
			-- vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" }) -- TDB: Incorporate to the LSP server
			vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
			vim.keymap.set("n", "cr", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		branch = "regexp", -- Use this branch for the new version
		cmd = "VenvSelect",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {
			settings = {
				options = {
					notify_user_on_venv_activation = true,
				},
			},
		},
		--  Call config for python files and load the cached venv automatically
		ft = "python",
		keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
	},
}
