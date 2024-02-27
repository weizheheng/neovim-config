require("dressing").setup({
  input = {
    min_width = { 60, 0.9 },
    win_options = {
      winhighlight = "FloatBorder:Normal"
    }
  },
  select = {
    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = require('telescope.themes').get_dropdown({ layout_config = { height = 15, width = 90 } }), }
})
