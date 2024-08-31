return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash",
					"bibtex",
					"latex",
					"csv",
					"diff",
					"gitignore",
					"dockerfile",
					"dot",
					"gnuplot",
					"json",
					"yaml",
					"toml",
					"lua",
					"luadoc",
					"vim",
					"vimdoc",
					"markdown",
					"markdown_inline",
					"python",
				},
				sync_install = false,
				highlight = { enable = true },
				indend = { enable = true },
			})
		end,
	},
}
