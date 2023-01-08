local colors = {
  -- Common colors

  white =    '#EEFFFF',
  gray =     '#717CB4',
  black =    '#000000',
  red =      '#F07178',
  green =    '#C3E88D',
  yellow =   '#FFCB6B',
  blue =     '#82AAFF',
  paleblue = '#B0C9FF',
  cyan =     '#89DDFF',
  purple =   '#C792EA',
  orange =   '#F78C6C',
  pink =     '#FF9CAC',

  -- Dark colors
  darkred =    '#DC6068',
  darkgreen =  '#ABCF76',
  darkyellow = '#E6B455',
  darkblue =   '#6E98EB',
  darkcyan =   '#71C6E7',
  darkpurple = '#B480D6',
  darkorange = '#E2795B',

  error =  '#FF5370',
  link =   '#80CBC4',
  cursor = '#FFCC00',
  title =  '#EEFFFF',

  none =         'NONE',
  bg =           '#0F111A',
  bg_alt =       '#090B10',
  fg =           '#A6ACCD',
  text =         '#717CB4',
  comments =     '#464B5D',
  selection =    '#1F2233',
  contrast =     '#090B10',
  active =       '#1A1C25',
  border =       '#232637',
  line_numbers = '#3B3F51',
  highlight =    '#1F2233',
  disabled =     '#464B5D',
  accent =       '#84FFFF',
  visual =       '#2d324a'
}

function set_CursorLineNr_color(color, bg_color)
  bg = bg_color or colors.bg_alt
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = color, bg = bg, bold = true })
end

require'colorizer'.setup()
require('lualine').setup {
  icons_enabled = false,
  options = { globalstatus = true },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          local mode = str:sub(1,1)
          if mode == "N" then
            set_CursorLineNr_color(colors.cyan)
            return "ﲵ" end
          if mode == "I" then
            set_CursorLineNr_color(colors.green)
            return ""
          end
          if mode == "V" then
            set_CursorLineNr_color(colors.purple, colors.bg)
            return "" end
          if mode == "R" then
            set_CursorLineNr_color(colors.red)
            return "" end
          if mode == "O" then
            set_CursorLineNr_color(colors.accent)
            return "ﲊ" end
          if mode == "C" then
            set_CursorLineNr_color(colors.darkyellow)
            return "" end
          return mode
        end
      }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype'}
  }
}

require('material').setup({
  contrast = {
    -- sidebars = true,
    -- floating_windows = true,
    -- non_current_windows = true,
    cursor_line = true,
    popup_menu = true
  },
  lualine_style = "stealth", -- can be "stealth" or "default"
  plugins = {
    "nvim-tree",
    "telescope",
    "gitsigns",
    "indent-blankline",
    "nvim-web-devicons"
  },
  custom_highlights = {
    -- TreeSitter
    ["@number"] = { fg = colors.pink },
    ["@boolean"] = { fg = colors.pink },
    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.yellow },
    ["@constant.builtin"] = { fg = colors.pink },
    ["@variable.builtin"] = { fg = colors.error },
    ["@keyword"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors.cyan },
    ["@exception"] = { fg = colors.purple },
    ["@parameter"] = { fg = colors.orange },
    ["@parameter.reference"] = { fg = colors.orange },
    ["@include"] = { fg = colors.purple },
    ["@property"] = { fg = colors.gray },
    ["@type.qualifier"] = { fg = colors.purple },
    -- CursorLineNr = { fg = colors.accent, bg = colors.bg_alt },
    CursorLineNr = { fg = colors.text, bg = colors.bg_alt },
    -- Cursor = { fg = colors.bg, bg = colors.cursor },
    Visual = { fg = colors.none, bg = colors.visual },
    --[[Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.purple },
    Exception = { fg = colors.cyan },
    Special = { fg = colors.purple },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = '#FF0000' },
    Function = { fg = colors.purple }--]]

    -- NvimTree
    NvimTreeFolderName = { fg = colors.accent },
    NvimTreeOpenedFolderName = { fg = colors.accent },
    NvimTreeCursorLine = { bg = colors.bg },

    -- Telescope
    TelescopeSelectionCaret = { fg = colors.accent },
    TelescopeSelection = { fg = colors.accent, bg = colors.selection },

    -- IndentBlankLine
    IndentBlanklineChar = { fg = colors.active },
    IndentBlanklineContextChar = { fg = colors.fg },
    IndentBlanklineSpaceChar = { fg = colors.active, nocombine = true },
    IndentBlanklineContextSpaceChar = { fg = colors.active, nocombine = true },

    -- Other
    -- MatchParen = { bg = colors.selection, bold = true }
    MatchParen = { bg = colors.selection },
    ColorColumn = { bg = colors.bg },
    VirtColumn = { fg = colors.active },
    Whitespace = { fg = colors.active },
    NonText = { fg = colors.active },
    YankedText = { fg = colors.bg, bg = colors.yellow },

    -- CoC Server
    CocFloating = { bg = colors.selection },
    FgCocErrorFloatBgCocFloating = { fg = colors.error },
    CocPumSearch = { fg = colors.accent },
    CocPumVirtualText = { fg = colors.comments },
    -- CocFloatActive = { fg = colors.orange },
    CocFloatActive = { fg = colors.accent },
    CocMenuSel = { bg = colors.visual },
    CocFloatThumb = { bg = colors.fg },
    CocHighlightText = { bg = colors.selection },

    -- GitGutter highlights
    GitGutterAdd = { fg = colors.darkgreen },
    GitGutterChange = { fg = colors.darkblue },
    GitGutterDelete = { fg = colors.darkred },

    -- BARBAR
    -- BufferCurrentSign = { fg = colors.accent },
    BufferCurrentSign = { fg = colors.accent },
    BufferInactiveSign = { fg = colors.bg, bg = colors.bg },
    -- BufferTabpageFill = { fg = #1a1c25 },
    BufferTabpageFill = { fg = colors.bg, bg = colors.bg },
    -- BufferTabpageFill = { fg = colors.bg, bg = colors.selection },
    BufferCurrent = { fg = colors.accent },
    BufferInactive = { bg = colors.bg },
    BufferInactiveMod = { bg = colors.bg, fg = colors.yellow },
    BufferOffset = { fg = colors.bg, bg = colors.bg },
    BufferVisible = { fg = colors.accent },
    BufferVisibleSign = { fg = colors.accent, bg = colors.bg },
    BufferVisibleMod = { fg = colors.yellow },

    -- EasyMotion
    -- EasyMotionTarget = { fg = colors.error, bold = true },
    -- EasyMotionTarget2First = { fg = colors.cursor, bold = true },
    -- EasyMotionTarget2Second = { fg = colors.darkyellow }
  }
})

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = false,
    extended_mode = false,
    disable = { "typescript" },
    colors = { colors.yellow, colors.purple, colors.cyan }
  }
}

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "dist", ".git/" },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top"
      }
    }
  }
}

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

-- vim.opt.colorcolumn = { 81 }
require("virt-column").setup({
  char = "│",
  virtcolumn = "81"
})

vim.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  --[[ char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3"
  } --]]
}

require("bufferline").setup({
  icon_close_tab_modified = '•',
  icon_custom_colors = false,
  offsets = {
    {filetype = "NvimTree", text = "File Explorer", text_align = "center"}
  },
})

-- Scopes for indentations highlighter
vim.g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  '^while',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments'
}

-- BARBAR plugin, offset for tabs to 20 symbols if NvimTree is toggled
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(20, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.api'.set_offset(0)
    end
  end
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

require("noice").setup()
