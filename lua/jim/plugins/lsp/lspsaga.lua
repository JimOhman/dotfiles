-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- -- keybinds for navigation in lspsaga window
  -- scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- -- use enter to open file with definition preview
  -- definition = {
  --   edit = "<CR>",
  -- },
  -- ui = {
  --   colors = {
  --     normal_bg = "#0f0f0f",
  --   },
  -- },
  lightbulb = {
    enable = false,
  },
  finder = {
    max_height = 0.6,
    keys = {
        open = '<CR>',
    },
  },
  rename = {
      -- auto_save = true,
  }
  -- move_in_saga = { prev = "<C-k>", next = "<C-j>"},
  -- finder_action_keys = {
  --     open = '<CR>',
  -- },
  -- definition_action_keys = {
  --     edit = '<CR>',
  -- },
})
