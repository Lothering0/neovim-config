local constants = require("constants")
local ternary = require("helpers").ternary
local IS_CONTRAST = constants.IS_CONTRAST

require("bufferline").setup({
  icons = {
    modified = {
      button = '•'
    },
    separator = ternary(IS_CONTRAST, { left = '', right = '' }, { left = '▎', right = '' }),
    inactive = {
      separator = ternary(IS_CONTRAST, { left = '', right = '' }, { left = '▎', right = '' }),
    },
    -- ???
    default = {
      separator = ternary(IS_CONTRAST, { left = '', right = '' }, { left = '▎', right = '' })
    },
  },
  offsets = {
    {
      filetype = "NvimTree",
      text = "File Explorer",
      text_align = "center"
    }
  }
})
