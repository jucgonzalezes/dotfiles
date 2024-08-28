return {
    {
        "rsh7th/cmp-nvim-lsp",
        event = "VeryLazy",
    },
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        dependencies = { 
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip"
        },
        build = "make install_jsregexp",
        opts = {
            enable_autosnippets = true,
        },
        config = function(_, opts)
            require("luasnip.loaders.from_vscode").lazy_load()
            local ls = require("luasnip")

            ls.setup(opts)
        end,
    },
    {

    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path"
        }, 
        opts = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            local auto_select = true

            return {
                snippet = {
                      expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                      end,
                    },
                window = {
                  completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                  -- { name = 'nvim_lsp' },
                  { name = 'luasnip' },
                }, {
                  { name = 'buffer' },
                })
            }
        end,
    },
} 
