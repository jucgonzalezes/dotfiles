-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.api.nvim_set_keymap("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "i" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Clear search highlight", silent = true })
vim.keymap.set("n", "l", "<cmd>Lazy<cr>", { desc = "lazyvim", silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "lazyvim", silent = true })

-- vim.keymap.set( "n", "<leader>/", "vgc<Esc>", { desc = "Comment/Uncomment" })

-- local wk = require("which-key")
-- wk.add({
--     { "<Esc>", "<cmd>nohlsearch<CR>", desc = "Clear search highlight" }
-- })
--

-- local status_ok, which_key = pcall(require, "which-key")
--
-- local opts = {
--     mode = "n",
--     prefix = "<leader>",
-- }
--
-- local mappings = {
--     { "l", "<cmd>Lazy<CR>", desc = "Lazy Plugin Manager" },
--     { "w", "<cmd>w!", desc = "Bye bye! "},
-- }
--
--
-- which_key.setup()
-- which_key.register(mappings, opts)
