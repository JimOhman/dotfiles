vim.g.mapleader = " "

local keymap = vim.keymap
local api = vim.api
local fn = vim.fn
local telescope = require("telescope.builtin")

-- Helper function to get the first subrepo Git root directory
local function get_first_subrepo_git_root()
  local cwd = fn.getcwd()
  local dirs = vim.fn.globpath(cwd, "*/.git", 0, 1)
  if #dirs > 0 then
    return fn.fnamemodify(dirs[1], ":h")
  end
  return cwd -- fallback to current working directory if no subrepo found
end

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>pf", function()
  telescope.find_files({ cwd = get_first_subrepo_git_root() })
end, { desc = "Find files in first subrepo" })
keymap.set("n", "<leader>ps", function()
  telescope.live_grep({ cwd = get_first_subrepo_git_root() })
end, { desc = "Live grep in first subrepo" })
keymap.set("n", "<leader>pw", function()
  telescope.grep_string({ cwd = get_first_subrepo_git_root() })
end, { desc = "Grep string in first subrepo" })

-- lazygit
keymap.set("n", "<leader>gg", ":LazyGit<cr>")

-- copy to clipboard
keymap.set("v", "y", '"+y')
keymap.set("v", "Y", '"+Y')
keymap.set("n", "p", '"+p')
keymap.set("n", "P", '"+P')

-- bufsurf
keymap.set("n", "<leader>l", ":BufSurfForward<CR>")
keymap.set("n", "<leader>h", ":BufSurfBack<CR>")

keymap.set("x", "p", '"_dP', { noremap = true })
keymap.set("x", "P", '"_dP', { noremap = true })

keymap.set('n', '<leader>/', '/\\<\\><Left><Left>')

keymap.set("n", "<leader>o", function()
  if vim.o.hls and vim.v.hlsearch == 1 then
    return ":nohls<CR>"
  else
    return ":set hls<CR>"
  end
end, { expr = true, silent = true })

-- surrounding doubles
api.nvim_set_keymap('i', '"', '""<left>', { noremap = true })
api.nvim_set_keymap("i", "'", "''<left>", { noremap = true })
api.nvim_set_keymap("i", "(", "()<left>", { noremap = true })
api.nvim_set_keymap("i", "[", "[]<left>", { noremap = true })
api.nvim_set_keymap("i", "{", "{}<left>", { noremap = true })


-- when your lsp and lspsaga is configured
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line

-- Copilot keymaps
keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
keymap.set("n", "<leader>cs", ":CopilotChatStop<CR>", { desc = "Stop Copilot Chat" })
keymap.set("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Copilot Explain Selected" })
keymap.set("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Copilot Review Selected" })
keymap.set("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Copilot Generate Docs" })


vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
