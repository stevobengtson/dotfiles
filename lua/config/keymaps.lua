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

map("n", "<leader>ck", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature help" })
map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                        Change window size                         │
--     ╰───────────────────────────────────────────────────────────────────╯
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                     Move to tabs convienently                     │
--     ╰───────────────────────────────────────────────────────────────────╯
map("n", "<leader>1", "1gt", { desc = "Move to tab 1" })
map("n", "<leader>2", "2gt", { desc = "Move to tab 2" })
map("n", "<leader>3", "3gt", { desc = "Move to tab 3" })
map("n", "<leader>4", "4gt", { desc = "Move to tab 4" })
map("n", "<leader>5", "5gt", { desc = "Move to tab 5" })
map("n", "<leader>6", "6gt", { desc = "Move to tab 6" })
map("n", "<leader>7", "7gt", { desc = "Move to tab 7" })
map("n", "<leader>8", "8gt", { desc = "Move to tab 8" })
map("n", "<leader>9", "9gt", { desc = "Move to tab 9" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                        vim-tmux-navigator                         │
--     ╰───────────────────────────────────────────────────────────────────╯
if os.getenv("TMUX") then
  map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                           Open scratch                            │
--     ╰───────────────────────────────────────────────────────────────────╯
map("n", "<leader>S", function()
  require("dpetka2001.scratch").launch_notepad()
end, { silent = true, desc = "Open Scratch" })

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                         Harpoon mappings                          │
--     ╰───────────────────────────────────────────────────────────────────╯
-- stylua: ignore
if vim.bo["filetype"] ~= "rnvimr" then
  map("n", "<M-1>", function() require("harpoon.ui").nav_file(1) end, { desc = "Harpoon 1" })
  map("n", "<M-2>", function() require("harpoon.ui").nav_file(2) end, { desc = "Harpoon 2" })
  map("n", "<M-3>", function() require("harpoon.ui").nav_file(3) end, { desc = "Harpoon 3" })
  map("n", "<M-4>", function() require("harpoon.ui").nav_file(4) end, { desc = "Harpoon 4" })
  map("n", "<M-5>", function() require("harpoon.ui").nav_file(5) end, { desc = "Harpoon 5" })
  map("n", "<M-6>", function() require("harpoon.ui").nav_file(6) end, { desc = "Harpoon 6" })
  map("n", "<M-7>", function() require("harpoon.ui").nav_file(7) end, { desc = "Harpoon 7" })
  map("n", "<M-8>", function() require("harpoon.ui").nav_file(8) end, { desc = "Harpoon 8" })
  map("n", "<M-9>", function() require("harpoon.ui").nav_file(9) end, { desc = "Harpoon 9" })
  map("n", "<M-0>", function() require("harpoon.ui").nav_file(0) end, { desc = "Harpoon 0" })
end
