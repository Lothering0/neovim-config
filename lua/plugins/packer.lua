vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- You add plugins here  
  use { "nvim-lualine/lualine.nvim" }                    -- Bottom line
  use { "ryanoasis/vim-devicons" }                       -- Icons
  use { "kyazdani42/nvim-web-devicons" }                 -- Another icons
  use { "kyazdani42/nvim-tree.lua" }                     -- Explorer
  use { "romgrk/barbar.nvim" }                           -- Tabs
  use { "easymotion/vim-easymotion" } -- EasyMotion
  use { "mg979/vim-visual-multi", branch = "master" } -- Multi cursor
  use { "marko-cerovac/material.nvim" }                  -- FIRST Material theme
  use { "norcalli/nvim-colorizer.lua" }                  -- Color (hex/rgb) highlight
  use { "lukas-reineke/indent-blankline.nvim" }          -- Highlight indentations
  use { "lukas-reineke/virt-column.nvim" }               -- Set symbol on certain column
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "p00f/nvim-ts-rainbow" }           -- TreeSitter brackets pair colorizer
  use { "mattn/emmet-vim" }                -- Emmet
  use { "nvim-lua/plenary.nvim" }          -- Required by Telescope
  use { "nvim-telescope/telescope.nvim" }  -- Telescope (git, explorer)
  use { "airblade/vim-gitgutter" }         -- Git changes file
  use {
    "neoclide/coc.nvim",
    branch = "release",
    run = ":CocInstall coc-highlight coc-prettier"
  }
  use { "folke/noice.nvim" }               -- Plugin which replace native Neovim command line
  use { "MunifTanjim/nui.nvim" }           -- Required by Noice
end)
