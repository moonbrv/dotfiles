return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = {
      {
        'echasnovski/mini.icons',
        opts = {},
        config = function()
          require('mini.icons').setup {
            style = 'ascii',
          }
        end,
      },
    },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
