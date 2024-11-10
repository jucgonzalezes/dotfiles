return {
	{
		"rsh7th/cmp-nvim-lsp",
		event = "VeryLazy",
	},
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		version = "v2.3", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		build = "make install_jsregexp",
		opts = {
			enable_autosnippets = true,
		},
		-- Loads friendly snippets
		config = function(_, opts)
			require("luasnip.loaders.from_vscode").lazy_load()
			local ls = require("luasnip")

			ls.setup(opts)
		end,
	},
	{},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp support
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for filesystem paths
			"L3MON4D3/LuaSnip", -- Snippets engine
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			-- local defaults = require("cmp.config.default")()
			-- local auto_select = true
			local luasnip = require("luasnip")

			return {
				-- Sets LuaSnip to expand completions
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				-- Add borders to the cmp window.
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
					hover = cmp.config.window.bordered(),
				},
				-- Adds symbols to the left of the menu to facilitate snippet recognition.
				formatting = {
					fields = { "menu", "abbr", "kind" },
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = "λ",
							luasnip = "⋗",
							buffer = "Ω",
							path = "",
						}

						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
				-- Add keymaps for the snippets functionality
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			}
		end,
	},
}
