local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
  }
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

vim.lsp.config("ror_lsp", {
    cmd = { "/Users/marcusheng/open-source/ruby/ror-lsp/exe/ror-lsp" },
    filetypes = { "ruby", "eruby" },
    root_markers = { { "bin/rails" }, '.git' },
    settings = {},
})
vim.lsp.enable("ror_lsp")

vim.lsp.config("herb_lsp", {
    cmd = { 'herb-language-server', '--stdio' },
    filetypes = { 'html', 'eruby' },
    root_markers = { { "bin/rails" }, '.git' },
})
vim.lsp.enable("herb_lsp")

if vim.fn.getcwd() == "/Users/marcusheng/workspace/project-tapir" then
  vim.lsp.config.solargraph = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    flags = {
      debounce_text_changes = 150,
    }
  }
  vim.lsp.enable("solargraph")
else
  vim.lsp.config.solargraph = {
    init_options = { formatting = true },
    settings = {
      solargraph = {
        diagnostics = false
      }
    }
  }
  vim.lsp.enable({ "rubocop", "solargraph" })
end

-- For tailwind custom intellisence
vim.lsp.config.tailwindcss = {
  on_attach = function(client, bufnr)
    if client.server_capabilities.colorProvider then
      require("document-color").buf_attach(bufnr)
    end
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  filetypes = { 'html', 'eruby', 'css', 'ruby', "tsx", "typescriptreact", "jsx", "javascriptreact" },
  root_markers = { { 'tailwind.config.js', 'tailwind.config.ts' } },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className" },
      experimental = {
        classRegex = {
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
 vim.lsp.enable("tailwindcss")

 vim.lsp.config.cssls = {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    css = {
      validate = false
    }
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  }
}
vim.lsp.enable("cssls")

vim.lsp.config.html = {
  filetypes = { "html", "eruby" },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  }
}
vim.lsp.enable("html")

vim.lsp.config.jsonls = {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  }
}
vim.lsp.enable("jsonls")

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

vim.lsp.config.ts_ls = {
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}
vim.lsp.enable("ts_ls")

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
vim.lsp.config.efm = {
    init_options = {documentFormatting = true},
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'json', 'html', 'eruby', 'css', 'scss', 'mjml'},
    root_markers = { '.git' },
    settings = {
        rootMarkers = {".git/"},
        languages = {
            typescript = {prettier, eslint},
            javascript = {prettier, eslint},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            -- html = {prettier},
            scss = {prettier},
            css = {prettier},
            -- eruby = {eruby},
            mjml = {eruby},
            -- ruby= {ruby},
        }
    }
}
vim.lsp.enable("efm")
