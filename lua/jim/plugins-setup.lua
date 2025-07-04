local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)

  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim") 

  -- lazy git
  use("kdheepak/lazygit.nvim")

  -- one colorscheme
  use("bluz71/vim-nightfly-guicolors")

  -- preferred colorscheme
  use("gruvbox-community/gruvbox")

  -- rose-pine colorscheme
  use("rose-pine/neovim")

  -- buffer surfing that respects history
  use("ton/vim-bufsurf")

  -- black formatter
  use{ "psf/black", branch = 'stable' }

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer")

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- essential plugins
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- Add nvim-treesitter with proper configuration for code highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown", "markdown_inline", "lua", "python", "javascript", "typescript", "json" },
        highlight = { enable = true },
      })
    end,
  })

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  use({
      'MeanderingProgrammer/render-markdown.nvim',
      after = { 'nvim-treesitter' },
      -- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
      -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
      config = function()
          require('render-markdown').setup({
              file_types = { 'markdown', 'copilot-chat' },
          })
      end,
  })

  use {
      'CopilotC-Nvim/CopilotChat.nvim',
      dependencies = {
          { 'github/copilot.vim' }, -- or 'zbirenbaum/copilot.lua' as an alternative
          { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log, and async functions
      },
      build = 'make tiktoken', -- Required for MacOS or Linux to build tiktoken
      opts = {
      },
      config = function(_, opts)
          require('CopilotChat').setup({
              -- Optional configuration (see below for customization)
              model = 'claude-3.7-sonnet-thought',
              debug = false, -- Enable debugging (set to true for troubleshooting)
              show_help = false, -- Show help actions
              context = "buffers",
              window = {
                layout = 'float',
                relative = 'cursor',
                width = 0.5,
                height = 0.5,
                row = 1,
                col = 1,
                border = 'rounded',
              },
              prompts = {
                -- Add custom prompt templates
                Explain = "Explain how this code works in detail:",
                Refactor = "Refactor this code to improve performance and readability:",
                FixBug = "Identify potential bugs in this code and suggest fixes:",
                Optimize = "Optimize this code for better performance:",
                Document = "Write comprehensive documentation for this code:",
              },
              show_user_prompts = true,      -- Show user prompts in chat
              show_system_prompts = false,   -- Hide system prompts
              line_numbers = false,           -- Show line numbers in code blocks
              code_theme = "rose-pine",      -- Match rose-pine theme
              auto_follow_cursor = true,
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
                  insert = nil
                },
              },
              highlight_headers = true,
            }
        )
      end,
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)

