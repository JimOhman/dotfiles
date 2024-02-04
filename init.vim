syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set scrolloff=8
set autochdir

set updatetime=50

set colorcolumn=88
highlight ColorColumn ctermbg=0 guibg=lightgrey

set signcolumn=yes

call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'nvie/vim-flake8'
Plug 'ton/vim-bufsurf'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sindrets/diffview.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'iamcco/markdown-preview.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'psf/black', { 'branch': 'stable' }
call plug#end()

colorscheme gruvbox

let mapleader = " "
let g:python_recommended_style = 0
highlight Normal guibg=none

inoremap jk <ESC>

nnoremap <leader><leader>h :wincmd h<CR>
nnoremap <leader><leader>j :wincmd j<CR>
nnoremap <leader><leader>k :wincmd k<CR>
nnoremap <leader><leader>l :wincmd l<CR>
nnoremap <leader>/ /\<\><left><left>

nnoremap <leader>l :BufSurfForward<CR>
nnoremap <leader>h :BufSurfBack<CR>

nnoremap <leader>d :DiffviewOpen -uno<CR>
nnoremap <leader>D :DiffviewClose<CR>

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files{hidden=true, cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1], file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip"} }<cr>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep{hidden=true, cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1], file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip"} }<cr>
nnoremap <leader>bf <cmd>lua require('telescope.builtin').file_browser{hidden=true, cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]}<cr>

vnoremap p "_dP
vnoremap <leader>t cimport time<CR>old_time=time.time()<ESC>gpOprint("{}s".format(time.time()-old_time))<ESC>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap Y "+y
vnoremap Y "+y

lua require("nvim-tree").setup{disable_netrw=true, view={side='right', signcolumn='no', width=50}, update_focused_file={enable=true}}

nnoremap <leader>ff :NvimTreeToggle<CR>
nnoremap <leader>qq :bd<CR>

autocmd BufWritePost *.py execute ':Black'

let g:black_quiet = 1

