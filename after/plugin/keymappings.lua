local map = vim.keymap.set
local api = vim.api
local cmd = vim.cmd
local fn = vim.fn

-- NvimTree
local nvim_tree = require('nvim-tree.api').tree
map('n', '<leader>n', function()
  nvim_tree.toggle(true, true, fn.getcwd(-1, 0))
end, { noremap = true, silent = true, desc = 'NvimTree: Toggle fo current scope (globl/tab/window)' })
-- floaterm
-- local toggleterm = require("toggleterm")
--local terms = require('custom.configs.toggleterm').terms
local term = require('toggleterm.terminal').Terminal:new {
  direction = 'float',
  on_create = function()
    cmd 'startinsert!'
  end,
  on_open = function()
    cmd 'startinsert!'
  end,
}
local term_direction = nil
local function toggleterm(size, direction)
  direction = vim.F.if_nil(direction, term_direction, 'horizontal')
  if not term:is_open() then
    term:open(size or 25, direction)
  else
    if term:is_focused() then
      term:close()
      if
        term_direction ~= direction and term_direction ~= 'float' -- always close float
      then
        term:open(size, direction)
      end
    else
      term:focus()
    end
  end
  term_direction = direction
end
map({ 'n', 't' }, '<F1>', function()
  toggleterm(nil, 'horizontal')
end, { noremap = true, silent = true })
map({ 'n', 't' }, '<F25>', function()
  toggleterm(nil, 'tab')
end, { noremap = true, silent = true })
