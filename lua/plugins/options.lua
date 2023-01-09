local helpers = require("helpers")
local g = helpers.g
local o = helpers.o
local c = helpers.c

g.vim_json_conceal = 0

g.material_style = "deep ocean" -- darker / lighter / oceanic / palenight / deep ocean
-- o.colorscheme = "material"
c "colorscheme material"

-- Neovide
c "set guifont=JetBrainsMonoNL\\ Nerd\\ Font:h11"
g.neovide_hide_mouse_when_typing = true
g.neovide_remember_window_size = true
g.neovide_cursor_trail_size = 0
g.neovide_scroll_animation_length = 0.2

g.EasyMotion_keys = "aoeidtn',.pyfgcrl;qjkxbmuh-"
