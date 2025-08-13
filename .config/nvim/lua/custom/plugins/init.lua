-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'simonmclean/triptych.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'nvim-tree/nvim-web-devicons', -- optional for icons
      'antosha417/nvim-lsp-file-operations', -- optional LSP integration
    },
    opts = {
      extension_mappings = {
        ['<c-f>'] = {
          mode = 'n',
          fn = function(target, _)
            require('telescope.builtin').live_grep {
              search_dirs = { target.path },
            }
          end,
        },
      },
    }, -- config options here
    keys = {
      { '<leader>nt', ':Triptych<CR>' },
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    'giuxtaposition/blink-cmp-copilot',
  },
}
