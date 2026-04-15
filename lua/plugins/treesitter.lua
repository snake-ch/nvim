return {
  'romus204/tree-sitter-manager.nvim',
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require('tree-sitter-manager').setup({
      border = 'rounded',
      auto_install = true
    })
  end
}
