local default_offset = require("helpers").explorer_width

local function set_offset(offset)
  if offset == 0 then
    return function()
      if vim.fn.expand('<afile>'):match('NvimTree') then
        require'bufferline.api'.set_offset(0)
      end
    end
  end

  return function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(offset, 'FileTree')
    end
  end
end

-- Default offset for tabs
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = set_offset(default_offset)
})

-- Offset for tabs if NvimTree is toggled
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = set_offset(default_offset)
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = set_offset(0)
})
