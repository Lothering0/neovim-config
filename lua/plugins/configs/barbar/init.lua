local helpers = require("helpers")
local get_path_to = helpers.get_config_path("barbar")

require(get_path_to "setup")
require(get_path_to "autocmds")
