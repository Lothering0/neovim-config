local helpers = require("helpers")
local map = helpers.map
local c = helpers.c

-- Emmet trigger
c "imap <A-h> <C-y>,"
-- map("i", "<A-h>", "<C-y>,", false, false)

-- Switching between BARBAR tabs
map("n", "H", ":BufferPrevious<CR>")
map("n", "L", ":BufferNext<CR>")
map("n", "<A-w>", ":BufferClose<CR>")    -- Close BARBAR tab

-- Find files using Telescope command-line sugar.
-- By file name
map("n", "<A-f>", "<cmd>Telescope find_files hidden=true<cr>")
-- By plain text
map("n", "<A-r>", "<cmd>Telescope live_grep<cr>")

-- EasyMotion trigger
map("", "-", "<Plug>(easymotion-s)")

-- COC TS-Server keymaps
-- Jump to type definition
map("n", "<A-t>", "<Plug>(coc-type-definition)")
-- Jump to definition
map("n", "<A-d>", "<Plug>(coc-definition)")
-- Show suggestion window
map("i", "<c-space>", "coc#refresh()", true, true)
-- Confirm on enter
map("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : \"\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>\"", true, true)
