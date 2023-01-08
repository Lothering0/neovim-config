local colors = require("themes/init")

function set_CursorLineNr_color(color, bg_color)
  bg = bg_color or colors.bg_alt
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = color, bg = bg, bold = true })
end

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
