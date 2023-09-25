local constants = require("constants")
local ternary = require("helpers").ternary
local IS_CONTRAST = constants.IS_CONTRAST

local function get_highlights(colors)
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
end

return { get_highlights = get_highlights }
