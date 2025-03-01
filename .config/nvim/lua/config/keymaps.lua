-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- copilot
vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { silent = true, noremap = true })

-- Make the leader a noop when not followed by something.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- Keeping the cursor centered.
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
-- vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next result' })
-- vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Indent while remaining in visual mode.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)

-- LazyDocker
vim.keymap.set("n", "<leader>k", ":LazyDocker<cr>", { silent = true, noremap = true })

-- Clear search with <esc>
vim.keymap.set('n', '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- HACK: <C-c> doesn't trigger the insert leave event, so remap it to escape so that it does.
vim.keymap.set('i', '<C-c>', '<esc>')

function _G.set_terminal_keymaps()
  local opts = { buffer = 0, silent = true, noremap = true }
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Kulala
-- vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>lua require('kulala').open()<cr>", { silent = true, noremap = true, desc = "Execute the request" })
-- vim.api.nvim_buf_set_keymap(0, "n", "[", "<cmd>lua require('kulala').jump_prev()<cr>", { silent = true, noremap = true, desc = "Jump to the previous request" })
-- vim.api.nvim_buf_set_keymap(0, "n", "[", "<cmd>lua require('kulala').jump_prev()<cr>", { silent = true, noremap = true, desc = "Jump to the next request" })
