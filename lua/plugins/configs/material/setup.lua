local constants = require("constants")
local IS_CONTRAST = constants.IS_CONTRAST
local ALWAYS_SHOW_NON_TEXT = constants.ALWAYS_SHOW_NON_TEXT

local ternary = require("helpers").ternary
local colors = require("themes/init")

require('material').setup({
  contrast = {
    sidebars = IS_CONTRAST,
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
  custom_colors = function(clrs)
    if colors.meta.name == "material" then return end

    clrs.editor.bg = colors.bg

    clrs.backgrounds.sidebars = colors.bg
    clrs.backgrounds.floating_windows = colors.bg
    clrs.backgrounds.non_current_windows = colors.bg
    clrs.backgrounds.cursor_line = colors.bg_alt

    clrs.git.added = colors.darkgreen

    for key, value in pairs(clrs.main) do
      clrs.main[key] = colors[key]
    end

    for key, value in pairs(clrs.editor) do
      clrs.editor[key] = colors[key]
    end
  end,
  custom_highlights = {
    -- TreeSitter
    ["@number"] = { fg = colors.pink },
    ["@boolean"] = { fg = colors.pink },
    ["@conditional"] = { fg = colors.purple },
    ["@function"] = { fg = colors["function"] or colors.darkblue },
    ["@method"] = { fg = colors["function"] or colors.darkblue },
    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.yellow },
    ["@constant.builtin"] = { fg = colors.pink },
    ["@variable.builtin"] = { fg = colors.error },
    ["@variable"] = { fg = colors.variable or colors.fg },
    ["@keyword"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors["keyword.operator"] or colors.cyan },
    ["@exception"] = { fg = colors.purple },
    ["@parameter"] = { fg = colors.orange },
    ["@parameter.reference"] = { fg = colors.orange },
    ["@repeat"] = { fg = colors.purple },
    ["@string"] = { fg = colors.darkgreen },
    ["@include"] = { fg = colors.purple },
    ["@property"] = { fg = colors.property or colors.gray },
    ["@type.qualifier"] = { fg = colors.purple },
    ["@operator"] = { fg = colors.operator or colors.cyan },
    ["@punctuation"] = { fg = colors.punctuation or colors.yellow },
    ["@punctuation.delimiter"] = { fg = colors.operator or colors.cyan },
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
    NvimTreeNormal = { bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg) },
    NvimTreeFolderName = { fg = colors.folder or colors.accent },
    NvimTreeOpenedFolderName = { fg = colors.folder or colors.accent },
    NvimTreeCursorLine = {
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
    },
    NvimTreeCursorLineNr = {
      fg = colors.cyan,
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
    },
    NvimTreeIndentMarker = { fg = colors.border },

    -- Telescope
    TelescopeSelectionCaret = { fg = colors.accent },
    TelescopeSelection = { fg = colors.accent, bg = colors.selection },

    -- IndentBlankLine
    IndentBlanklineChar = { fg = colors.active, nocombine = true },
    IndentBlanklineContextChar = { fg = colors.fg, nocombine = true },
    IndentBlanklineSpaceChar = { fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg), nocombine = true },
    IndentBlanklineContextSpaceChar = {
      fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg),
      nocombine = true
    },

    -- Other
    -- MatchParen = { bg = colors.selection, bold = true }
    MatchParen = { bg = colors.selection },
    ColorColumn = { bg = colors.bg },
    VirtColumn = { fg = colors.virt_column or colors.active },
    Whitespace = { fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg) },
    NonText = { fg = ternary(ALWAYS_SHOW_NON_TEXT, colors.active, colors.bg) },
    YankedText = { fg = colors.bg, bg = colors.yellow },

    -- CoC Server
    CocFloating = { bg = colors.floating_window or colors.selection },
    FgCocErrorFloatBgCocFloating = { fg = colors.error },
    CocPumSearch = { fg = colors.accent },
    CocPumVirtualText = { fg = colors.comments },
    -- CocFloatActive = { fg = colors.orange },
    CocFloatActive = { fg = colors.accent },
    CocMenuSel = { bg = colors.floating_window_current_line or colors.visual },
    CocFloatThumb = { bg = colors.fg },
    CocHighlightText = { bg = colors.selection },

    -- GitGutter highlights
    GitGutterAdd = { fg = colors.git.added },
    GitGutterChange = { fg = colors.git.modified },
    GitGutterDelete = { fg = colors.git.removed },

    -- Lualine git highlights 
    LualineGitAdded = { fg = colors.git.added, bg = colors.contrast, bold = true },
    LualineGitModified = { fg = colors.git.modified, bg = colors.contrast, bold = true },
    LualineGitDeleted = { fg = colors.git.removed, bg = colors.contrast, bold = true },

    -- BARBAR
    BufferCurrentSign = {
      fg = ternary(IS_CONTRAST, colors.bg, colors.accent),
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
    },
    BufferCurrentMod = { fg = colors.yellow, bg = colors.bg },
    BufferInactiveSign = { fg = colors.bg, bg = colors.bg },
    BufferTabpageFill = {
      fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
    },
    BufferCurrent = { fg = colors.accent },
    BufferInactive = {
      bg = colors.bg,
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
    },
    BufferInactiveMod = { bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg), fg = colors.yellow },
    BufferInactiveSign = {
      fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
    },
    BufferOffset = {
      fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
    },
    BufferVisible = { fg = colors.accent },
    BufferVisibleSign = {
      fg = ternary(IS_CONTRAST, colors.bg, colors.accent),
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
    },
    BufferVisibleMod = { fg = colors.yellow },
    BufferInactiveCHANGED = { fg = 'red' },

    -- EasyMotion
    -- EasyMotionTarget = { fg = colors.error, bold = true },
    -- EasyMotionTarget2First = { fg = colors.cursor, bold = true },
    -- EasyMotionTarget2Second = { fg = colors.darkyellow }

    -- Noice
    NoiceCmdlinePopupBorder = { fg = colors.border },
    -- NoiceCmdlineIcon = { fg = colors.cyan },
    NoiceCmdlinePopupBorderSearch = { fg = colors.darkyellow },
    NoiceCmdlineIconSearch = { fg = colors.darkyellow },
  }
})
