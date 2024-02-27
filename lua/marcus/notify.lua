require('notify').setup({
  icons = {
    DEBUG = "-",
    ERROR = "-",
    INFO = "-",
    TRACE = "-",
    WARN = "-"
  },
  level = 2,
  minimum_width = 55,
  render = "default",
  stages = "static",
})
