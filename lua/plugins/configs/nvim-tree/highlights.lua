local ternary = require("helpers").ternary
local IS_CONTRAST = constants.IS_CONTRAST

return {
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
  NvimTreeGitIgnored = { fg = colors.git.ignored or nil },
}
