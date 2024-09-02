local builtin = require("telescope.builtin")

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" }),
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" }),
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" }),
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find tags" }),
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols" }),
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word" }),
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find old files" }),
		},
	},
}
