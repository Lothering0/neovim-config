-- Width of the sidebar (directiories tree)
local EXPLORER_WIDTH = 32
-- Show line numbers in explorer
local EXPLORER_NUMBER = true
-- Number of column where should be vertical rule
local VIRT_COLUMN = 121
-- If true, editor has contrast elements (especially, sidebars)
local IS_CONTRAST = false
-- Determines is non-text (like whitespaces and linebreaks) should always be visible or only when selected or is current line
local ALWAYS_SHOW_NON_TEXT = false

return {
  EXPLORER_WIDTH = EXPLORER_WIDTH,
  EXPLORER_NUMBER = EXPLORER_NUMBER,
  VIRT_COLUMN = VIRT_COLUMN,
  IS_CONTRAST = IS_CONTRAST,
  ALWAYS_SHOW_NON_TEXT = ALWAYS_SHOW_NON_TEXT
}
