-- Add Ruby_lsp and rubocop for debugging and linting
local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Useful for debugging formatter issues
      format_notify = true,
      inlay_hints = { enabled = false },
      servers = {
        bashls = {
          filetypes = { "sh", "zsh" },
        },
        denols = {},
        diagnosticls = {},
        dockerls = {},
        helm_ls = {},
        jsonls = {},
        jsonnet_ls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        marksman = {},
        -- regols is not maanged by Mason. i install it with `brew install kitagry/tap/regols`.
        -- See: https://github.com/kitagry/regols
        regols = {},
        ruby_lsp = {
          -- cmd = { "bundle", "exec", "ruby-lsp" },
          -- init_options = {
          --   formatter = "auto",
          -- },
        },
        rubocop = {
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
        sqlls = {},
        terraformls = {},
        tsserver = {},
        yamlls = {},
      },
    },
  },
}

