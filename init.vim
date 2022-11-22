set scrolloff=10
set number
set autoindent
set tabstop=2 expandtab
set shiftwidth=2 expandtab
" set smarttab
set softtabstop=2
set mouse=a
set cursorline
set wrap linebreak
set breakindent

" Highlight whitespaces
set listchars+=space:·
set list

set termguicolors
set encoding=utf-8
set noswapfile

" Hide empty lines ~
set fillchars=eob:\ 

" Hide current mode (-- INSERT --/-- VISUAL -- etc)
set noshowmode

" Hide separator line
set fillchars+=vert:\ 

set nocompatible

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" lightline
let g:lightline = {}
" let g:lightline.colorscheme = 'horizon'

" Highlight yank
" augroup highlight_yank
"     autocmd!
"     autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
" augroup END
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="YankedText", timeout=150}
augroup END

call plug#begin()

" Plug 'https://github.com/vim-airline/vim-airline' " Bottom line
Plug 'nvim-lualine/lualine.nvim'                    " Bottom line
Plug 'ryanoasis/vim-devicons'                       " Icons
Plug 'kyazdani42/nvim-web-devicons'                 " Another icons
Plug 'kyazdani42/nvim-tree.lua'                     " Explorer
Plug 'romgrk/barbar.nvim'                           " Tabs
Plug 'https://github.com/easymotion/vim-easymotion' " EasyMotion
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " Multi cursor
Plug 'marko-cerovac/material.nvim'                  " FIRST Material theme
Plug 'norcalli/nvim-colorizer.lua'                  " Color (hex/rgb) highlight
Plug 'lukas-reineke/indent-blankline.nvim'          " Highlight indentations
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/emmet-vim'                " Emmet
Plug 'nvim-lua/plenary.nvim'          " Required by Telescope
Plug 'nvim-telescope/telescope.nvim'  " Telescope (git, explorer)
Plug 'airblade/vim-gitgutter'         " Git changes file
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" lua require('colorizer').setup()

lua << END
require'colorizer'.setup()
require('lualine').setup {
  icons_enabled = false,
  options = { globalstatus = true },
  sections = {
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype'}
  }
}
--FIRST Material
local colors = {
  -- Common colors

  white =    '#EEFFFF',
  gray =     '#717CB4',
  black =    '#000000',
  red =      '#F07178',
  green =    '#C3E88D',
  yellow =   '#FFCB6B',
  blue =     '#82AAFF',
  paleblue = '#B0C9FF',
  cyan =     '#89DDFF',
  purple =   '#C792EA',
  orange =   '#F78C6C',
  pink =     '#FF9CAC',

  -- Dark colors
  darkred =    '#DC6068',
  darkgreen =  '#ABCF76',
  darkyellow = '#E6B455',
  darkblue =   '#6E98EB',
  darkcyan =   '#71C6E7',
  darkpurple = '#B480D6',
  darkorange = '#E2795B',

  error =  '#FF5370',
  link =   '#80CBC4',
  cursor = '#FFCC00',
  title =  '#EEFFFF',

  none =         'NONE',
  bg =           '#0F111A',
  bg_alt =       '#090B10',
  fg =           '#A6ACCD',
  text =         '#717CB4',
  comments =     '#464B5D',
  selection =    '#1F2233',
  contrast =     '#090B10',
  active =       '#1A1C25',
  border =       '#232637',
  line_numbers = '#3B3F51',
  highlight =    '#1F2233',
  disabled =     '#464B5D',
  accent =       '#84FFFF'
}

require('material').setup({
  contrast = {
    sidebars = true,
    floating_windows = true,
    non_current_windows = true,
    cursor_line = true,
    popup_menu = true
  },
  lualine_style = "default", -- can be "stealth" or "default"
  plugins = {
    "nvim-tree",
    "telescope",
    "gitsigns",
    "indent-blankline"
  },
  custom_highlights = {
    ["@number"] = { fg = colors.pink },
    ["@boolean"] = { fg = colors.pink },
    ["@type"] = { fg = colors.yellow },
    ["@type.builtin"] = { fg = colors.yellow },
    ["@constant.builtin"] = { fg = colors.pink },
    ["@variable.builtin"] = { fg = colors.error },
    ["@keyword"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors.cyan },
    ["@exception"] = { fg = colors.purple },
    ["@parameter"] = { fg = colors.orange },
    ["@parameter.reference"] = { fg = colors.orange },
    ["@include"] = { fg = colors.purple },
    ["@property"] = { fg = colors.gray },
    -- CursorLineNr = { fg = colors.accent, bg = colors.bg_alt },
    CursorLineNr = { fg = colors.text, bg = colors.bg_alt },
    -- Cursor = { fg = colors.bg, bg = colors.cursor },
    Visual = { fg = colors.none, bg = "#2d324a" },
    --[[Type = { fg = colors.yellow },
    StorageClass = { fg = colors.yellow },
    Structure = { fg = colors.purple },
    Exception = { fg = colors.cyan },
    Special = { fg = colors.purple },
    SpecialChar = { fg = colors.cyan },
    Tag = { fg = '#FF0000' },
    Function = { fg = colors.purple }--]]

    NvimTreeFolderName = { fg = colors.accent },
    NvimTreeOpenedFolderName = { fg = colors.accent },

    TelescopeSelectionCaret = { fg = colors.accent },
    TelescopeSelection = { fg = colors.accent, bg = colors.selection },

    IndentBlanklineChar = { fg = colors.border },
    IndentBlanklineContextChar = { fg = colors.fg }
  }
})

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true
  }
}
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "dist", ".git/" },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top"
      }
    }
  }
}

require("nvim-tree").setup({
  open_on_setup = true,
  open_on_setup_file = true,
  filters = {
    dotfiles = true
  },
  view = {
    width = 20,
    hide_root_folder = true,
    mappings = {
      list = {
        { key = "-", action = "" },
      }
    }
  },
  renderer = {
    --[[ indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = "│",
      },
    }, --]]
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "",
        edge = "",
        item = "",
        bottom = "",
        none = "",
      },
    },
    icons = {
      -- use one space as value if current font is full mono
      padding = "  ",
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
})

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  --[[ char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3"
  } --]]
}

-- Scopes for indentations highlighter
vim.g.indent_blankline_context_patterns = {
  'class',
  'function',
  'method',
  '^if',
  '^while',
  '^for',
  '^object',
  '^table',
  'block',
  'arguments'
}

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

-- NvimTree autoclose. WARNING: it can be cause of errors!
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
END

" FIRST MATERIAL
let g:material_style = "deep ocean" " darker / lighter / oceanic / palenight / deep ocean
" SECOND MATERIAL
" let g:material_theme_style = 'ocean-community'
" let g:material_terminal_italics = 1
" let g:airline_theme = 'nightfly'

" FIRST and SECOND
colorscheme material

" let g:indentLine_char = ''
" let g:indentLine_char = '|'

" CoC Server change colors
highlight CocFloating guibg=#1F2233
highlight FgCocErrorFloatBgCocFloating guifg=#FF5370
highlight CocPumSearch guifg=#84FFFF
" highlight CocFloatActive guifg=#F78C6C
highlight CocFloatActive guifg=#84FFFF
highlight CocMenuSel guibg=#2d324a
highlight CocFloatThumb guibg=#A6ACCD

" GitGutter highlights
highlight GitGutterAdd guifg=#ABCF76
highlight GitGutterChange guifg=#6E98EB
highlight GitGutterDelete guifg=#DC6068

" BARBAR plugin, changes color of left line (of active buffer/tab)
" hi BufferCurrentSign guifg='#84FFFF'
hi BufferCurrentSign guifg='#84FFFF'
hi BufferInactiveSign guifg='#0f111a' guibg='#090B10'
" hi BufferTabpageFill guifg='#1a1c25'
hi BufferTabpageFill guifg='#0F111A'
hi BufferCurrent guifg='#84FFFF'
hi BufferInactive guibg='#090B10'
hi BufferInactiveMod guibg='#090B10' guifg='#FFCB6B'
hi BufferOffset guifg='#090B10' guibg='#090B10'
hi BufferTabpageFill guibg='#090B10'
" BARBAR, change symbol of unsaved (modified) file
let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_close_tab_modified = '•'
" BARBAR, change symbol of separators
" let bufferline.icon_separator_active = ''
" let bufferline.icon_separator_inactive = ''

" Settings for indentations highlighter
let g:indent_blankline_use_treesitter = v:true
" let g:indent_blankline_char_list = ['▏', '¦', '┆', '┊']
let g:indent_blankline_char_list = ['│', '╎', '┆', '┊']
" highlight IndentBlanklineIndent1 guifg=#84FFFF gui=nocombine
" highlight IndentBlanklineIndent2 guifg=#C792EA gui=nocombine
" highlight IndentBlanklineIndent3 guifg=#FFCB6B gui=nocombine
" highlight IndentBlanklineContextChar guifg=#FF5370 gui=nocombine
" From description: Turn this off if you want to use background highlighting instead of chars
let g:indent_blankline_show_trailing_blankline_indent = v:false

" Highlight space char
hi IndentBlanklineSpaceChar guifg=#232637 gui=nocombine
hi IndentBlanklineContextSpaceChar guifg=#232637 gui=nocombine
hi Whitespace guifg=#232637

" Set color to yanked text
hi YankedText guifg=#0F111A guibg=#FFCB6B

" URxvt.keysym.S-space: \033[32;2u
" inoremap <S-Space> <Esc>
" au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Git gutter lines
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
" let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_removed_above_and_below = '┃'
let g:gitgutter_sign_modified_removed = '┃'

" Emmet trigger
imap <A-h> <C-y>,

" Go up/down on "next wrapped line" if current line is too long
" noremap <expr> j v:count ? 'j' : 'gj'
" noremap <expr> k v:count ? 'k' : 'gk'

" Center the screen after going to last line
nnoremap G Gzz

" Not exiting visual mode after tabulating
vmap > >gv
vmap < <gv

" Auto indentations after pressing brackets
inoremap <expr> <cr> 
   \   getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O"
   \ : getline(".")[col(".")-2:col(".")-1]=="()" ? "<cr><esc>O"
   \ : getline(".")[col(".")-2:col(".")-1]=="[]" ? "<cr><esc>O"
   \ : getline(".")[col(".")-2:col(".")-1]=="<>" ? "<cr><esc>O"
   \ :                                             "<cr>"

function! _extendedVersion()
  inoremap <expr> <cr> 
     \   getline(".") =~ '\S\s*{$'                 ? "<bs><cr>{<cr>}<esc>O"
     \ : getline('.') =~ '^\s*{$'                  ? "<cr>}<esc>O" 
     \ : getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O"
     \ : getline(".") =~ '\S\s*($'                 ? "<bs><cr>(<cr>)<esc>O"
     \ : getline('.') =~ '^\s*($'                  ? "<cr>)<esc>O" 
     \ : getline(".")[col(".")-2:col(".")-1]=="()" ? "<cr><esc>O"
     \ : getline(".") =~ '\S\s*[$'                 ? "<bs><cr>[<cr>]<esc>O"
     \ : getline('.') =~ '^\s*[$'                  ? "<cr>]<esc>O" 
     \ : getline(".")[col(".")-2:col(".")-1]=="[]" ? "<cr><esc>O"
     \ : getline(".") =~ '\S\s*<$'                 ? "<bs><cr><<cr>><esc>O"
     \ : getline('.') =~ '^\s*<$'                  ? "<cr>><esc>O" 
     \ : getline(".")[col(".")-2:col(".")-1]=="<>" ? "<cr><esc>O"
     \ :                                             "<cr>"
endfunction

" Auto close
" FIRST VARIANT
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" Switching between DEFAULT NEOVIM tabs
" nnoremap <F7> :tabprevious<CR>
" nnoremap <F8> :tabnext<CR>

" Switching between BARBAR tabs
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>

" Close BARBAR tab
nnoremap <silent>    <A-w> :BufferClose<CR>

" Find files using Telescope command-line sugar.
" By file name
nnoremap <A-f> <cmd>Telescope find_files hidden=true<cr>
" By plain text
nnoremap <A-r> <cmd>Telescope live_grep<cr>

map - <Plug>(easymotion-s)

" COC TS-Server keymaps
" Jump to type definition
nnoremap <A-t> <Plug>(coc-type-definition)
" Jump to definition
nnoremap <A-d> <Plug>(coc-definition)
" Show suggestion window
inoremap <silent><expr> <c-space> coc#refresh()

" default value: 'asdghklqwertyuiopzxcvbnmfj;'
" also can use: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:EasyMotion_keys = "aoeidtn',.pyfgcrl;qjkxbmuh-"

let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-e>'    " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-e>'    " replace visual C-n

" let g:NERDTreeDirArrowExpandable="📁"
" let g:NERDTreeDirArrowCollapsible="📂"
let g:coc_global_extensions = ['coc-tsserver']

" Cursor highlight
" highlight Cursor guifg=white guibg=red
" highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10
