local map = vim.keymap.set
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

-- NvimTree
local nvim_tree = require('nvim-tree.api').tree
map('n', '<leader>n', function()
  nvim_tree.toggle(true, true, fn.getcwd(-1, 0))
end, { noremap = true, silent = true, desc = 'NvimTree: Toggle fo current scope (globl/tab/window)' })
