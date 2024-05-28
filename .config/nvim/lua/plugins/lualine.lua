return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {
          {
            function()
              return os.date("%a, %b %d - %I:%M %p")
            end,
          },
        },
      },
    },
  },
}
