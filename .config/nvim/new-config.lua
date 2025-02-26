-- init.lua
-- Neovim configuration using LazyVim for Ruby on Rails and TailwindCSS development

-- Load LazyVim as the base configuration
require("lazy").setup({
  spec = {
    { import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.ruby" },
    { import = "lazyvim.plugins.extras.ui.catppuccin" },
  },
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "catppuccin" },
  },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Additional Plugins
require("lazy").setup({
  -- Ruby and Rails support
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby" },
  },
  {
    "tpope/vim-rails",
    ft = { "ruby" },
  },
  {
    "tpope/vim-bundler",
    ft = { "ruby" },
  },

  -- TailwindCSS support
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "typescriptreact", "vue", "svelte" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "princejoogie/tailwind-highlight.nvim",
    ft = { "html", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte", "php", "erb" },
    config = true,
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("dap-ruby").setup()
    end,
    dependencies = {
      "suketa/nvim-dap-ruby",
      "rcarriga/nvim-dap-ui",
    },
  },

  -- Testing
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#strategy"] = "neovim"
    end,
    ft = { "ruby" },
  },

  -- UI Enhancements
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- LSP and Autocompletion
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").solargraph.setup({})
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
})

-- Additional Configuration
-- Enable Treesitter for syntax highlighting and autotagging
require("nvim-treesitter.configs").setup({
  ensure_installed = { "ruby", "javascript", "html", "css" },
  highlight = {
    enable = true,
  },
})

require("devcontainer").setup{}

-- Keybindings for Testing and Debugging
vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":TestSuite<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })
