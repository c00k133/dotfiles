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

-- Make tabs 2 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Finding files
vim.opt.path:append({ "**" })

-- Filetypes
vim.filetype.add({
  extension = {
    j2 = "jinja",
  },
})
