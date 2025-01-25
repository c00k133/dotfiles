-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "

--- LazyVim settings
vim.g.snacks_animate = false

--- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Highlight search text
vim.opt.hlsearch = true

-- Make tabs 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Finding files
vim.opt.path:append({ "**" })
