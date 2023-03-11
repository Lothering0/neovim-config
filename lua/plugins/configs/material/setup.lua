local colors = require("themes/init")

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
    NvimTreeFolderName = { fg = colors.folder or colors.accent },
    NvimTreeOpenedFolderName = { fg = colors.folder or colors.accent },
    NvimTreeCursorLine = { bg = colors.bg },
    NvimTreeIndentMarker = { fg = colors.border },

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
    VirtColumn = { fg = colors.virt_column or colors.active },
    Whitespace = { fg = colors.active },
    NonText = { fg = colors.active },
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

    -- Noice
    NoiceCmdlinePopupBorder = { fg = colors.border },
    -- NoiceCmdlineIcon = { fg = colors.cyan },
    NoiceCmdlinePopupBorderSearch = { fg = colors.darkyellow },
    NoiceCmdlineIconSearch = { fg = colors.darkyellow }
  }
})
