return {
  "kaka-ruto/nvim-ruby-debugger",
  requires = {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    require('nvim-ruby-debugger').setup({
      rails_port = 38698,
      worker_port = 38699,
      minitest_port = 38700,
      host = "127.0.0.1",
    })
  end
}
