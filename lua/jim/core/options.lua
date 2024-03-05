local opt = vim.opt

opt.scrolloff = 8
-- opt.autochdir = true
opt.swapfile = false
opt.backup = false
opt.errorbells = false


-- line numbers
opt.relativenumber = true
opt.number = true


-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.updatetime = 50


-- line wrapping
opt.wrap = false


-- search settings
opt.ignorecase = true
opt.smartcase = true


-- cursor line
opt.cursorline = false


-- apparence
opt.termguicolors = false
-- opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "90"

-- backspace
opt.backspace = "indent,eol,start"


-- clipboard
opt.clipboard:append("unnamedplus")


-- slip windows
opt.splitright = true
opt.splitbelow = true


-- ex. delete word include -
-- opt.iskeyword:append("-")

-- undodir
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
opt.undofile = true

