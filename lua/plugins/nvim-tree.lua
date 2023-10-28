-- OR setup with some options
require('nvim-tree').setup({
  -- sort_by = 'case_sensitive',
  sort_by = 'extension',
  actions = {
    open_file = { quit_on_open = false }
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true
  },
  filters = {
    dotfiles = true,
    custom = { '^.git$', '^node_modules$', '*.exe' }
  },
  git = {
    enable = false
  }
})

local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = true, find_file = true, })
end

-- auto open startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- auto close
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
