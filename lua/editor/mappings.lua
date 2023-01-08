local helpers = require("helpers")
local map = helpers.map

-- Center the screen after jump on last line of file
map("n", "G", "Gzz")

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

local condition1 = 'getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O"'
local condition2 = 'getline(".")[col(".")-2:col(".")-1]=="()" ? "<cr><esc>O<tab>"'
local condition3 = 'getline(".")[col(".")-2:col(".")-1]=="[]" ? "<cr><esc>O"'
local condition4 = 'getline(".")[col(".")-2:col(".")-1]=="<>" ? "<cr><esc>O<tab>"'
local conditions = condition1 .. ' : ' .. condition2 .. ' : ' .. condition3 .. ' : ' .. condition4
local expression = conditions .. ' : "<cr>"'
map("i", "<CR>", expression, true, true)
