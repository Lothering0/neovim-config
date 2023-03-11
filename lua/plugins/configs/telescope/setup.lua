require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      ".git/",
      -- TODO: make sure that ignore works for *-lock.json files
      "^package-lock.json",
      "^yarn-lock.json",
    },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top"
      }
    }
  }
}
