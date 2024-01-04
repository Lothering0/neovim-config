local colors = require("themes/init")

function set_CursorLineNr_color(color, bg_color)
  bg = bg_color or colors.contrast
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
            -- return "ﲵ" end
            return "" end
          if mode == "I" then
            set_CursorLineNr_color(colors.green)
            return ""
          end
          if mode == "V" then
            set_CursorLineNr_color(colors.purple, colors.bg)
            return "󰈈" end
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
      },
    },
    lualine_b = {
      'branch',
      {
        'diff',
        colored = true,
        diff_color = {
          added = 'LualineGitAdded',
          modified = 'LualineGitModified',
          removed = 'LualineGitDeleted'
        },
        -- symbols = { added = '  ', modified = '  ', removed = ' 󰆴 ' }
        symbols = { added = '+', modified = '~', removed = '-' }
      },
      'diagnostics'
    },
    lualine_c = {},
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = colors.orange },
      }
    },
    lualine_y = {
      {
        "filetype",
        fmt = function(lang)
          if lang == "html" then return "HTML" end
          if lang == "css" then return "CSS" end
          if lang == "sass" then return "Sass" end
          if lang == "scss" then return "SCSS" end
          if lang == "javascript" then return "JavaScript" end
          if lang == "typescript" then return "TypeScript" end
          if lang == "json" then return "JSON" end
          if lang == "vue" then return "Vue" end
          if lang == "javascriptreact" then return "JS React" end
          if lang == "typescriptreact" then return "TS React" end
          if lang == "lua" then return "Lua" end
          if lang == "python" then return "Python" end
          if lang == "markdown" then return "Markdown" end
          if lang == "cpp" then return "C++" end
          if lang == "c" then return "C" end
          if lang == "php" then return "PHP" end
          if lang == "haskell" then return "Haskell" end
          return lang
        end
      }
    }
  }
}
