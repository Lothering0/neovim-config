local helpers = require("helpers")
local map = helpers.map
local is_surrounded = helpers.is_surrounded

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

-- Enter
local enter_map_condition_1 = is_surrounded("{}") .. ' ? "<cr><esc>O"'
local enter_map_condition_2 = is_surrounded("()") .. ' ? "<cr><esc>O<tab>"'
local enter_map_condition_3 = is_surrounded("[]") .. ' ? "<cr><esc>O"'
local enter_map_condition_4 = is_surrounded("<>") .. ' ? "<cr><esc>O<tab>"'
local enter_map_conditions = table.concat({
  enter_map_condition_1,
  enter_map_condition_2,
  enter_map_condition_3,
  enter_map_condition_4
}, " : ")
local enter_map_expression = enter_map_conditions .. ' : "<cr>"'
map("i", "<CR>", enter_map_expression, true, true)

-- Space
local space_map_condition_1 = is_surrounded("{}") .. ' ? "<Space><Space><Left>"'
local space_map_condition_2 = is_surrounded("[]") .. ' ? "<Space><Space><Left>"'
local space_map_condition_3 = is_surrounded("()") .. ' ? "<Space><Space><Left>"'
local space_map_condition_4 = is_surrounded("<>") .. ' ? "<Space><Space><Left>"'
local space_map_conditions = table.concat({
  space_map_condition_1,
  space_map_condition_2,
  space_map_condition_3,
  space_map_condition_4
}, " : ")
local space_map_expression = space_map_conditions .. ' : "<Space>"'
map("i", "<Space>", space_map_expression, true, true)
