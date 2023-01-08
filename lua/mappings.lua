local helpers = require("helpers")
local map = helpers.map

-- Center the screen after jump on last line of file
map("n", "G", "Gzz")

-- Emmet trigger
map("i", "<A-h>", "<C-y>,", false)

-- Not exiting visual mode after tabulating
map("v", ">", ">gv", false)
map("v", "<", "<gv", false)

-- Autoclose brackets
map("i", '"', '""<left>')
map("i", "'", "''<left>")
map("i", "`", "``<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")

-- Switching between BARBAR tabs
map("n", "<A-,>", ":BufferPrevious<CR>")
map("n", "<A-.>", ":BufferNext<CR>")
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

--[[ TODO:
inoremap <expr> <cr> 
   \   getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O"
   \ : getline(".")[col(".")-2:col(".")-1]=="()" ? "<cr><esc>O<tab>"
   \ : getline(".")[col(".")-2:col(".")-1]=="[]" ? "<cr><esc>O"
   \ : getline(".")[col(".")-2:col(".")-1]=="<>" ? "<cr><esc>O<tab>"
   \ :                                             "<cr>" --]]
