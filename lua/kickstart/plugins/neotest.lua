return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'fredrikaverpil/neotest-golang', -- Installation
    },
    config = function()
      require('neotest').setup {
        log_level = 0,
        adapters = {
          require 'neotest-golang',
        },
      }
    end,
  },
}
