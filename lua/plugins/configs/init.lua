local function get_path(plugin)
  return "plugins/configs/" .. plugin .. "/init"
end

require(get_path "colorizer")
require(get_path "lualine")
require(get_path "material")
require(get_path "treesitter")
require(get_path "telescope")
require(get_path "nvim-tree")
require(get_path "virt-column")
require(get_path "indent_blankline")
require(get_path "barbar")
require(get_path "noice")
require(get_path "vim-visual-multi")
require(get_path "gitgutter")
require(get_path "coc")
require(get_path "hop")
require(get_path "emmet")
