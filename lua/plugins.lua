return {
  "neovim/nvim-lspconfig",
  { 'stevearc/oil.nvim', opts = {}, dependencies = { { "echasnovski/mini.icons", opts = {} } } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim', branch = 'master', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    dir = "~/plugins/nord-vim",
    lazy = false, -- load immediately
    priority = 1000, -- load before other plugins
    config = function()
      vim.cmd.colorscheme("nord")
      -- load the colorscheme here
      -- vim.cmd([[colorscheme nord]])
    end
  },
  {
    "sindrets/diffview.nvim",
    config = function(_, opts)
      require('diffview').setup(opts)

      local function set_diff_highlights()
        local is_dark = vim.o.background == 'dark'

        if is_dark then
          vim.api.nvim_set_hl(0, 'DiffAdd', { fg = 'none', bg = '#2e4b2e' })
          vim.api.nvim_set_hl(0, 'DiffDelete', { fg = 'none', bg = '#4c1e15' })
          -- vim.api.nvim_set_hl(0, 'DiffChange', { fg = 'none', bg = '#45565c' })
          -- vim.api.nvim_set_hl(0, 'DiffText', { fg = 'none', bg = '#6d7499' })
        else
          vim.api.nvim_set_hl(0, 'DiffAdd', { fg = 'none', bg = 'palegreen', bold = true })
          vim.api.nvim_set_hl(0, 'DiffDelete', { fg = 'none', bg = 'tomato', bold = true })
          vim.api.nvim_set_hl(0, 'DiffChange', { fg = 'none', bg = 'lightblue', bold = true })
          vim.api.nvim_set_hl(0, 'DiffText', { fg = 'none', bg = 'lightpink', bold = true })
        end
      end

      set_diff_highlights()

      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('DiffColors', { clear = true }),
        callback = set_diff_highlights
      })
    end
  },
  {
      "f-person/git-blame.nvim",
      -- load the plugin at startup
      event = "VeryLazy",
      -- Because of the keys part, you will be lazy loading this plugin.
      -- The plugin will only load once one of the keys is used.
      -- If you want to load the plugin at startup, add something like event = "VeryLazy",
      -- or lazy = false. One of both options will work.
      opts = {
          -- your configuration comes here
          -- for example
          enabled = false,  -- if you want to enable the plugin
          message_template = " <author> • <date> • <<sha>>", -- template for the blame message, check the Message template section for more options
          date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
          virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
      },
  },
  { "sheerun/vim-polyglot" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip", tag = "v1.0.0" },
  { "nvim-lua/popup.nvim" },
  -- { "tpope/vim-fugitive" },
  { "mg979/vim-visual-multi" },
  { "tpope/vim-rails" },
  { "tpope/vim-surround" },
  { "szw/vim-maximizer" },
  { "cohama/lexima.vim" },
  { "voldikss/vim-floaterm" },
  { dir = "~/plugins/vim-closetag" },
  { "weizheheng/nvim-workbench" },
  { dir = "~/plugins/swap-buffers.nvim" },
  { "AndrewRadev/tagalong.vim" },
  { "andymass/vim-matchup" },
  { "ap/vim-css-color" },
  { "arnamak/stay-centered.nvim" },
  { "stevearc/dressing.nvim" },
  { "mrshmllow/document-color.nvim" },
  { dir = "~/plugins/ror.nvim" },
  { "rcarriga/nvim-notify" },
  { "nvim-lualine/lualine.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "sourcegraph/amp.nvim",
    branch = "main", 
    lazy = false,
    opts = { auto_start = true, log_level = "info" },
  }
  -- { "monkoose/neocodeium" }
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     provider = "claude",
  --     mode = "legacy",
  --     -- auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  --     behaviour = {
  --       auto_suggestions = false, -- Experimental stage
  --       auto_set_highlight_group = true,
  --       auto_set_keymaps = true,
  --       auto_apply_diff_after_generation = false,
  --       support_paste_from_clipboard = false,
  --       minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
  --     },
  --     providers = {
  --       claude = {
  --         endpoint = "https://api.anthropic.com",
  --         model = "claude-sonnet-4-20250514",
  --         timeout = 30000, -- Timeout in milliseconds
  --         disable_tools = true, -- disable tools!
  --         extra_request_body = {
  --           temperature = 0,
  --           max_tokens = 4096,
  --         }
  --       },
  --       deepseek_r1 = {
  --         __inherited_from = "openai",
  --         endpoint = "https://api.deepseek.com/v1",
  --         model = "deepseek-reasoner",
  --         timeout = 30000, -- Timeout in milliseconds
  --         disable_tools = true,
  --         api_key_name = "OPENAI_API_KEY",  -- default OPENAI_API_KEY if not set
  --         extra_request_body = {
  --           temperature = 0,
  --           max_tokens = 4096,
  --         }
  --       },
  --       deepseek = {
  --         __inherited_from = "openai",
  --         endpoint = "https://api.deepseek.com/v1",
  --         model = "deepseek-chat",
  --         timeout = 30000, -- Timeout in milliseconds
  --         api_key_name = "OPENAI_API_KEY",  -- default OPENAI_API_KEY if not set
  --         extra_request_body = {
  --           temperature = 0,
  --           max_tokens = 4096,
  --         }
  --       },
  --     },
  --     mappings = {
  --       diff = {
  --         ours = "gh",
  --         theirs = "gl",
  --       }
  --     },
  --     windows = {
  --       position = "left",
  --       ask = {
  --         start_insert = false
  --       }
  --     },
  --     highlights = {
  --       ---@type AvanteConflictHighlights
  --       diff = {
  --         current = "DiffText",
  --         incoming = "DiffAdd",
  --       },
  --     }
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({
  --       keymaps = {
  --           accept_suggestion = "<Up>a",
  --           accept_word = "<Up>o",
  --           clear_suggestion = "<Up>u",
  --         },
  --     })
  --   end,
  -- },
}
