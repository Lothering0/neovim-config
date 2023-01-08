local g = vim.g
local o = vim.opt
local c = vim.cmd

function map(mode, key, v, noremap, expr)
  local noremap = noremap or true
  vim.api.nvim_set_keymap(mode, key, v, {
    silent = true,
    noremap = noremap,
    expr = expr
  })
end

augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
autocmd = vim.api.nvim_create_autocmd -- Create autocommand

return {
  map = map,
  augroup = augroup,
  autocmd = autocmd,
  g = g,
  o = o,
  c = c
}
