-- If lost, check :h rtp
-- That is, help for the runtime path
--
-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set open splits panes
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

-- Set indentation and tabexpand
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Turn on clipboard sharing with system
vim.opt.clipboard = "unnamedplus"

-- Opens a small popup window showing the substitutions
vim.opt.inccommand = "split"

-- Use GUI colors
vim.opt.termguicolors = true
