return {
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
    opts = {
      lang = {
        php = {
          coverage_file = "./coverage.xml",
        },
      },
    },
    keys = {
      { "<leader>cx", "<cmd>Coverage<cr>", desc = "Load Code Coverage" },
      { "<leader>cz", "<cmd>CoverageSummary<cr>", desc = "Load Code Coverage Summary" },
    },
  },
}
