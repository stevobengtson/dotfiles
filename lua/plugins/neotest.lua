return {
  {
    "olimorris/neotest-phpunit",
    "nvim-neotest/neotest-go"
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-phpunit"] = {
          phpunit_cmd = function()
            return "./vendor/bin/phpunit"
          end,
          root_files = { "composer.json", "phpunit.xml.dist", ".gitignore" },
          filter_dirs = { "node_modules", ".git", "vendor" },
          env = { XDEBUG_CONFIG='idekey=neotest' },
        },
        "neotest-go"
      }
    },
  },
}
