require('lualine').setup({
  options = {
    theme = "nord"
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', { 'diagnostics', symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" } }},
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = false,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      }
    },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

