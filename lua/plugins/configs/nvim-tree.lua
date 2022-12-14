require("nvim-tree").setup({
  open_on_setup = true,
  open_on_setup_file = true,
  filters = {
    dotfiles = false,
    exclude = { "" }
  },
  view = {
    width = 20,
    hide_root_folder = true,
    mappings = {
      list = {
        { key = "-", action = "" },
      }
    }
  },
  renderer = {
    --[[ indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = "│",
      },
    }, --]]
    highlight_git = true,
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "",
        edge = "",
        item = "",
        bottom = "",
        none = "",
      },
    },
    special_files = {
      "tsconfig.json",
      "package.json",
      "Cargo.toml",
      "Makefile",
      "README.md",
      "readme.md"
    },
    icons = {
      -- use one space as value if current font is full mono
      padding = "  ",
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
})

-- NvimTree autoclose. WARNING: it can be cause of errors!
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
