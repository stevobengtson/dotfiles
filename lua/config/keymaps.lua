-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 'DBUI',
-- 'DBUIToggle',
-- 'DBUIAddConnection',
-- 'DBUIFindBuffer',

local map = LazyVim.safe_keymap_set

map("n", "<leader>zu", "<cmd>DBUI<cr>", { desc = "Database UI" })
map("n", "<leader>zt", "<cmd>DBUIToggle<cr>", { desc = "Database UI Toggle" })
map("n", "<leader>zc", "<cmd>DBUIAddConnection<cr>", { desc = "Database UI Add connection" })
map("n", "<leader>zf", "<cmd>DBUIFindBuffer<cr>", { desc = "Database UI Find buffer" })

map("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run rest command" })
