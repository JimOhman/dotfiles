local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  return
end


-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
vim.cmd([[ highlight NvimTreeFolderIcon guifg=#50d789 ]])

nvimtree.setup({
  -- change folder arrow icons
  renderer = {
    icons = {
      glyphs = {
        folder = {
           -- arrow_closed = "", -- arrow when folder is closed
           -- arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  -- 	git = {
  -- 		ignore = false,
  -- 	},
  view = {
      side = 'right',
      signcolumn = 'no',
      width = 40,
  },
  filters = {
      exclude = {'.DS_Store'},
  }
})
