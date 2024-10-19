return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "http", -- For Rest-nvim
        "graphql", -- For Rest-nvim
        "php",
        "templ",
        "proto",
        "ruby",
        "javascript",
        "typescript",
        "json",
        "yaml",
      },
    },
  },
  { "tpope/vim-rails" },
}
