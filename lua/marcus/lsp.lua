local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim.lsp.set_log_level("debug")

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- To instead override globally set floating preview to have border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- require'lspconfig'.syntax_tree.setup{
--   cmd = { "stree", "lsp" }
-- }

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

if not configs.ror_lsp then
  configs.ror_lsp = {
    default_config = {
      -- cmd = { "bundle", "exec", "ror-lsp" },
      cmd = { "/Users/marcusheng/open-source/ruby/ror-lsp/exe/ror-lsp" },
      filetypes = { "ruby", "eruby" },
      root_dir = util.root_pattern("bin/rails"),
      settings = {},
    },
  }
end

lspconfig.ror_lsp.setup({})


if vim.fn.getcwd() == "/Users/marcusheng/workspace/project-tapir" then
  require'lspconfig'.solargraph.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    flags = {
      debounce_text_changes = 150,
    }
  }
else
  require'lspconfig'.rubocop.setup{}
  -- require'lspconfig'.standardrb.setup {}
  -- require'lspconfig'.solargraph.setup {
  --   capabilities = require('cmp_nvim_lsp').default_capabilities(),
  -- }
end

-- For tailwind custom intellisence
require'lspconfig'.tailwindcss.setup{
  on_attach = function(client, bufnr)
    if client.server_capabilities.colorProvider then
      require("document-color").buf_attach(bufnr)
    end
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  filetypes = { 'html', 'eruby', 'css', 'ruby' },
  root_dir = require('lspconfig').util.root_pattern('config/tailwind.config.js', 'config/tailwind.config.ts'),
  settings = {
    tailwindCSS = {
      classAttributes = { "class" },
      experimental = {
        classRegex = {
          "class_names\\(\"([^\\)]*)\"\\)", -- <div class: "..." />
          "class: \"([^\"]*)", -- <div class: "..." />
        }
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true
    }
  }
}

require'lspconfig'.cssls.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  }
}

require'lspconfig'.html.setup{
  filetypes = { "html", "eruby" },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  }
}

require'lspconfig'.jsonls.setup{
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  }
}


vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

require'lspconfig'.tsserver.setup {
    flags = {
      debounce_text_changes = 150,
    },
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        require "nvim-lsp-ts-utils".setup {}
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
local eruby = require "efm/eruby"
-- local ruby = require "efm/ruby"
    -- filetypes = {
    --     "javascript",
    --     "typescript",
    --     "typescriptreact",
    --     "javascriptreact",
    -- },
require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'json', 'html', 'eruby', 'css', 'scss'},
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            eruby = {eruby},
            -- ruby= {ruby},
        }
    }
}
