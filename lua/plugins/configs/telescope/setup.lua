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
