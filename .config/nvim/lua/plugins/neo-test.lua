-- Add RSpec Testing
return {
  'nvim-neotest/neotest',
  optional = true,
  dependencies = {
    'olimorris/neotest-rspec',
    'zidhuss/neotest-minitest',
  },
  config = function()
    ---@diagnostic disable-next-line missing-fields
    require('neotest').setup({
      adapters = {
        require('neotest-rspec'),
        require('neotest-minitest'),
      },
    })
  end,

  opts = {
    adapters = {
      ['neotest-minitest'] = {
        -- NOTE: By default neotest-minitest uses the system wide minitest gem instead of the one through bundler
        minitest_cmd = function()
          return {
            'bundle',
            'exec',
            'rails',
            'test',
          }
        end,
      },
      ['neotest-rspec'] = {
        -- NOTE: By default neotest-rspec uses the system wide rspec gem instead of the one through bundler
        rspec_cmd = function()
          return {
            'bundle',
            'exec',
            'rspec',
          }
        end,
      },
    },
  },
}
