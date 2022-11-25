function map(mode, key, v, noremap, expr)
  local noremap = noremap or true
  vim.api.nvim_set_keymap(mode, key, v, {
    silent = true,
    noremap = noremap,
    expr = expr
  })
end

return {
  map = map
}
