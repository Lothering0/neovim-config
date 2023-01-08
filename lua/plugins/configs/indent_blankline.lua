local helpers = require("helpers")
local o = helpers.o
local g = helpers.g

o.listchars:append "eol:↴"
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  --[[ char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3"
  } --]]
}

-- Scopes for indentations highlighter
g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  '^while',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments'
}

g.indent_blankline_use_treesitter = true
g.indent_blankline_char_list = { '│', '╎', '┆', '┊' }
-- From description: Turn this off if you want to use background highlighting instead of chars
g.indent_blankline_show_trailing_blankline_indent = false
