require("oil").setup({
  skip_confirm_for_simple_edits = false,
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  view_options = {
    show_hidden = true
  },
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 100,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
      winhighlight = "FloatBorder:Normal"
    },
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
})
