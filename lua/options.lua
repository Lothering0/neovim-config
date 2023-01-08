local helpers = require("helpers")
local g = helpers.g
local o = helpers.o
local c = helpers.c

-- g.mapleader = " "
o.number = true
o.scrolloff = 10
o.autoindent = true
o.tabstop = 2
o.shiftwidth = 2
-- o.smarttab
o.softtabstop = 2
o.mouse = a
o.cursorline = true
o.wrap = true
o.breakindent = true
o.listchars:append({ space = "·" })
o.list = true
o.termguicolors = true
o.encoding = "utf-8"
c "set noswapfile"
-- Hide empty lines ~
o.fillchars = "eob: "
-- Hide current mode (-- INSERT --/-- VISUAL -- etc)
c "set noshowmode"
-- o.nocompatible = true
-- Hide separator line
o.fillchars:append({ vert = " " })
o.updatetime = 300
