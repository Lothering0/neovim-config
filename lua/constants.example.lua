-- Current theme. Full list of available themes you can find in lua/themes
local THEME = "material_deep_ocean"
-- Width of the sidebar (directiories tree)
local EXPLORER_WIDTH = 32
-- Show line numbers in explorer
local EXPLORER_NUMBER = true
-- Number of column where should be vertical rule
local VIRT_COLUMN = 121
-- If true, editor has contrast elements (especially, sidebars)
local IS_CONTRAST = true
-- Determines is non-text (like whitespaces and linebreaks) should always be visible or only when selected or is current line
local ALWAYS_SHOW_NON_TEXT = false

return {
  THEME = THEME,
  EXPLORER_WIDTH = EXPLORER_WIDTH,
  EXPLORER_NUMBER = EXPLORER_NUMBER,
  VIRT_COLUMN = VIRT_COLUMN,
  IS_CONTRAST = IS_CONTRAST,
  ALWAYS_SHOW_NON_TEXT = ALWAYS_SHOW_NON_TEXT
}
