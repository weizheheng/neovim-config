local layout = {}

function layout.set()
  local ui = vim.api.nvim_list_uis()[1]
  if ui.width > 200 then
    vim.cmd(string.format('%svnew', 155))
    -- vim.cmd("set wfw")
    require('swap-buffers').swap_buffers('h')
  end
end

function layout.set_new_tab()
  local ui = vim.api.nvim_list_uis()[1]
  if ui.width > 200 then
    vim.cmd(string.format('%svnew', 155))
    -- vim.cmd("set wfw")
    require('swap-buffers').swap_buffers('h')
  end
end

return layout
