return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
		config = function(_, opts)
			local mp = require("mini.pairs")

			mp.setup(opts)
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		config = function(_, opts)
			local comment = require("Comment")

			comment.setup(opts)
		end,
	},
}
