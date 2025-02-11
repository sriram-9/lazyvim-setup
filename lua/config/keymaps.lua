-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

-- Open terminal in bottom split
vim.keymap.set("n", "<leader>ft", function()
  -- Open terminal in horizontal split
  vim.cmd("split | terminal")
  vim.cmd("startinsert")
end, { desc = "Open terminal in bottom split" })

-- Close terminal with Esc
vim.keymap.set("t", "<Esc>", function()
  -- Close the terminal window
  vim.cmd("close")
end, { desc = "Close terminal" })
