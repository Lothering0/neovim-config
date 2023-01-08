require("bufferline").setup({
  icon_close_tab_modified = '•',
  icon_custom_colors = false,
  offsets = {
    {filetype = "NvimTree", text = "File Explorer", text_align = "center"}
  },
})

-- BARBAR plugin, offset for tabs to 20 symbols if NvimTree is toggled
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(20, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.api'.set_offset(0)
    end
  end
})
