-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- C++
keymap("n", "<F5>", function()
  local file = vim.fn.expand('%:p')
  local dir = vim.fn.expand('%:p:h')
  local name = vim.fn.expand('%:t:r')
  local cmd = string.format(
      'g++ "%s" -o "%s/%s" && alacritty -e bash -c \'"%s/%s"; echo; echo "Program finished. Press Ctrl+C to exit."; while true; do sleep 1; done\'',
      file, dir, name, dir, name
  )
  vim.cmd('write')
  vim.fn.system(cmd)
end, opts)