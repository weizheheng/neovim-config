local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
local diagnostic = require "el.diagnostic"

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return branch
  end
end)

local diagnostic_display = diagnostic.make_buffer()

require('el').setup {
  generator = function(_, _)
    return {
      extensions.gen_mode {
        format_string = ' %s '
      },
      { sections.split, required = true },
      builtin.file_relative,
      { " " },
      { diagnostic_display },
      { sections.split, required = true },
      git_branch,
      { " " },
      "[",
      builtin.line,
      " : ",
      builtin.column,
      "]",
      builtin.filetype,
    }
  end
}
