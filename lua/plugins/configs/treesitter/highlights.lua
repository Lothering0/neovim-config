local ternary = require("helpers").ternary
local constants = require("constants")
local HAS_STRING_BACKGROUND = constants.HAS_STRING_BACKGROUND

local function get_highlights(colors)
  return {
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
    ["@string"] = { fg = colors.darkgreen, bg = ternary(HAS_STRING_BACKGROUND, colors.string_bg, nil) },
    ["@include"] = { fg = colors.purple },
    ["@property"] = { fg = colors.property or colors.gray },
    ["@type.qualifier"] = { fg = colors.purple },
    ["@operator"] = { fg = colors.operator or colors.cyan },
    ["@punctuation"] = { fg = colors.punctuation or colors.yellow },
    ["@punctuation.delimiter"] = { fg = colors["punctuation.delimiter"] or colors.operator or colors.cyan },
    ["@tag.delimiter"] = { fg = colors["tag.delimiter"] or colors.cyan },
    jsonNumber = { link = "@number" },
    jsonBoolean = { link = "@boolean" },
    jsonString = { link = "@string" },
    jsonNull = { link = "@constant.builtin" },
    jsonKeyword = { link = "@property" },
    jsonBraces = { link = "@punctuation" },
    Number = { link = "@number" },
    String = { link = "@string" },
    Function = { link = "@function" },
    Repeat = { link = "@repeat" },
    Operator = { link = "@operator" },
    Exception = { link = "@exception" },
    Conditional = { link = "@conditional" },
    Statement = { link = "@keyword" },
    Comment = { fg = colors.comments },
    --[[Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.purple },
    Exception = { fg = colors.cyan },
    Special = { fg = colors.purple },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = '#FF0000' },
    Function = { fg = colors.purple }--]]
  }
end

return { get_highlights = get_highlights }
