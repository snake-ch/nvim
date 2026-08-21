return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>ff', '<cmd>FzfLua files<cr>',     desc = 'FzfLua find files', remap = true },
      { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'FzfLua live grep',  remap = true },
      { '<leader>fb', '<cmd>FzfLua buffers<cr>',   desc = 'FzfLua buffers',    remap = true },
      { '<leader>fh', '<cmd>FzfLua helptags<cr>',  desc = 'FzfLua help tags',  remap = true },
      { '<leader>gg', '<cmd>FzfLua git_diff<cr>',  desc = 'FzfLua git diff',   remap = true }

    },
    opts = {
      winopts = {
        preview = {
          scrollbar = false
        }
      },
      keymap = {
        builtin = {
          ['<c-f>'] = 'preview-page-down',
          ['<c-b>'] = 'preview-page-up'
        },
        fzf = {
          ['ctrl-u'] = 'half-page-up',
          ['ctrl-d'] = 'half-page-down',
          ['ctrl-f'] = 'preview-page-down',
          ['ctrl-b'] = 'preview-page-up'
        }
      },
      files = {
        prompt               = 'Files > ',
        cwd_prompt           = false,
        file_ignore_patterns = { 'node_modules/', '.git/' }
      }
    }
  }
}
