-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Format with LSP (silent mapping)
vim.keymap.set("n", "<leader>ff", function()
  vim.lsp.buf.format({ timeout_ms = 10000 })
end, { noremap = true, silent = true })

-- Insert mode mappings for ERB tags
vim.keymap.set("i", "<C-s>=", "<%=  %><Left><Left><Left>", { noremap = true })
vim.keymap.set("i", "<C-s>-", "<%  %><Left><Left><Left>", { noremap = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("n", "<leader>th", "<C-w>t<C-w>H", { noremap = true })
vim.keymap.set("n", "<leader>tk", "<C-w>t<C-w>K", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "<leader><Left>", ":tabprevious<CR>", { noremap = true })
vim.keymap.set("n", "<leader><Right>", ":tabnext<CR>", { noremap = true })
vim.keymap.set('n', '<leader>ch', ':AvanteClear history<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ap', ':AvanteSwitchProvider ', { noremap = true })
-- vim.keymap.set("n", "<leader>gsr", ":cdo s//gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>", { noremap = true })
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set('n', '<leader>cp', ':let @+ = expand("%:~:.")<CR>', { noremap = true, silent = false })

-- Toggle highlight search
vim.keymap.set("n", "<leader>hh", ":set invhlsearch<CR>:set hlsearch?<CR>", { noremap = true })

-- Resize window
vim.keymap.set("n", "<leader>rv", ":vertical resize 155<CR>", { noremap = true })

-- Improved j/k navigation with jumplist
vim.keymap.set("n", "k", function()
  return vim.v.count > 5 and "m'" .. vim.v.count .. "k" or "k"
end, { expr = true, noremap = true })
vim.keymap.set("n", "j", function()
  return vim.v.count > 5 and "m'" .. vim.v.count .. "j" or "j"
end, { expr = true, noremap = true })

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- Workbench mappings
vim.keymap.set("n", "<leader>bp", "<Plug>ToggleProjectWorkbench", { noremap = true })
vim.keymap.set("n", "<leader>bb", "<Plug>ToggleBranchWorkbench", { noremap = true })
vim.keymap.set("n", "<leader><CR>", "<Plug>WorkbenchToggleCheckbox", { noremap = true })

-- Search and replace
vim.keymap.set("n", "<leader>br", ":%s//g<Left><Left>", { noremap = true })

-- closetag.vim settings
vim.g.closetag_close_shortcut = ",>"
vim.g.closetag_filenames = "*.erb,*.slim,*.tsx,*.html"
vim.g.closetag_regions = {
  ["typescript.tsx"] = "jsxRegion,tsxRegion",
  ["typescriptreact"] = "jsxRegion,tsxRegion",
}

-- matchup.vim settings
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_offscreen = {}

-- floaterm
vim.g.floaterm_position = 'bottom'
vim.g.floaterm_width = 1.0
vim.g.floaterm_height = 0.4
vim.g.floaterm_keymap_toggle = ',t'


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
})
