local helpers = require("helpers")
local g = helpers.g
local c = helpers.c

g.coc_global_extensions = { 'coc-tsserver' }
c [[autocmd CursorHold * silent call CocActionAsync('highlight')]]
