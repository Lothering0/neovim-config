local helpers = require("helpers")
local get_path_to = helpers.get_config_path("nvim-tree")

require(get_path_to "setup")
require(get_path_to "autocmds")
require(get_path_to "mappings")
