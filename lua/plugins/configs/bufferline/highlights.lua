local constants = require("constants")
local ternary = require("helpers").ternary
local IS_CONTRAST = constants.IS_CONTRAST

local function get_highlights(colors)
  return {
    BufferLineOffset = {
      fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
    },
    BufferLineFill = {
      fg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg),
      bg = ternary(IS_CONTRAST, colors.bg_alt, colors.bg)
    },
  }
end

return { get_highlights = get_highlights }
