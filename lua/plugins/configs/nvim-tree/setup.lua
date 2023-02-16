local explorer_width = require("helpers").explorer_width

require("nvim-tree").setup({
  filters = {
    dotfiles = false,
    exclude = { "" }
  },
  view = {
    width = explorer_width,
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
      inline_arrows = false,
      icons = {
        corner = "╰",
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
