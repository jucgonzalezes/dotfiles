return {
    -- Opens a pop-up window with keybinding hints
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts_extend = { "spec" }, 
        opts = {
            defaults = {},
            spec = {
                {
                    mode = { "n", "v" },
                    { "<leader><tab>", group = "tabs" },
                    { "<leader>c", group = "code" },
                    { "<leader>f", group = "file" },
                    { "<leader>n", group = "Plop!"},
                    { "g", group = "Go to definition" },
                },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
            {
                "<leader><space>",
                function()
                    require("which-key").show({ keys = "<c-w>", loop = true})
                end,
                desc = "Window Hydra Mode (which-key),"
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute({ toggle = true })
                end,
                desc = "Open/Toggle NeoTree" ,
            },
            {"<leader>e", "<leader>fe", desc = "Open/Toggle NeoTree", remap = true},
        },
        deactivate = function()
            vim.cmd([[Neotree close]])
        end,
    },
}
