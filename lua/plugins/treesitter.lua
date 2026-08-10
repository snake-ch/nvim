return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install { 'lua' }

    -- Auto-enable Treesitter features for any file type that has a parser installed
    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function()
        local lang = vim.bo.filetype
        if not lang or lang == '' then return end

        local installed_parsers = require('nvim-treesitter').get_installed('parsers')
        if not vim.tbl_contains(installed_parsers, lang) then
          return
        end

        -- Syntax highlighting (provided by Neovim)
        vim.treesitter.start()

        -- Code folding (provided by Neovim)
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'

        -- Smart indentation (provided by nvim-treesitter)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    })

    -- (Optional) Global setting to always keep Vim regex highlighting as a supplement
    -- vim.g.treesitter_additional_vim_regex_highlighting = true
  end
}

