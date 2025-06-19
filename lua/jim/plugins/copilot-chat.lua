require("CopilotChat").setup {
  mappings = {
    -- Override close to use <Esc> in normal mode and disable in insert mode
    close = {},
    -- Keep some defaults unchanged (e.g., reset)
    reset = {
      normal = '<C-r>',
      insert = nil,
    },
    -- Add or modify other mappings as needed
    complete = {
      insert = '<C-a>',
    },
  },
}
