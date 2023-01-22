local helpers = require("helpers")
local map = helpers.map

-- Switching between BARBAR tabs
map("n", "H", ":BufferPrevious<CR>")
map("n", "L", ":BufferNext<CR>")
map("n", "<A-w>", ":BufferClose<CR>")    -- Close BARBAR tab
-- Move BARBAR tabs
map("n", "<C-H>", ":BufferMovePrevious<CR>")
map("n", "<C-L>", ":BufferMoveNext<CR>")
