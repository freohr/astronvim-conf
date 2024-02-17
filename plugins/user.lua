return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "medium"
    end
  },
  {
    "wookayin/semshi",
    ft = "python",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g["semshi#excluded_hl_groups"] = {}
    end,
    config = function()
      local function set_semshi_hl()
        vim.api.nvim_set_hl(0, "semshiLocal", { ctermfg=209, fg="#80aa9e" } )
        vim.api.nvim_set_hl(0, "semshiGlobal", { ctermfg=214, fg="#d3869b" } )
        vim.api.nvim_set_hl(0, "semshiImported", { ctermfg=214, fg="#8bba7f", cterm=bold, gui=bold } )
        vim.api.nvim_set_hl(0, "semshiParameter", { ctermfg=75,  fg="#fabd2f" } )
        vim.api.nvim_set_hl(0, "semshiParameterUnused", { ctermfg=117, fg="#d79921", cterm=underline, gui=underline} )
        vim.api.nvim_set_hl(0, "semshiFree", { ctermfg=218, fg="#a89984"} )
        vim.api.nvim_set_hl(0, "semshiBuiltin", { ctermfg=207, fg="#f2594b"} )
        vim.api.nvim_set_hl(0, "semshiAttribute", { ctermfg=49,  fg="#458588"} )
        vim.api.nvim_set_hl(0, "semshiSelf", { ctermfg=249, fg="#fe8019"} )
        vim.api.nvim_set_hl(0, "semshiUnresolved", { ctermfg=226, fg="#d65d0e", cterm=underline, gui=underline} )
        vim.api.nvim_set_hl(0, "semshiSelected", { ctermfg=231, fg="#fbf1c7", ctermbg=161, bg="#4c3432"} )

        vim.api.nvim_set_hl(0, "semshiErrorSign", { ctermfg=231, fg="#fbf1c7", ctermbg=160, bg="#402120"} )
        vim.api.nvim_set_hl(0, "semshiErrorChar", { ctermfg=231, fg="#fbf1c7", ctermbg=160, bg="#402120"} )
        vim.cmd([[sign define semshiError text=E> texthl=semshiErrorSign]])
      end
      vim.api.nvim_create_autocmd('Colorscheme', {
        pattern = '*',
        group = vim.api.nvim_create_augroup('semshi_colorscheme', {clear = true}),
        callback = set_semshi_hl
      })
      set_semshi_hl()
    end,
    keys = {
      n = {
        ["<leader>s"] = { name = "Semshi" },
        ["<leader>se"] = { ":Semshi enable<cr>", desc = "Enable Semshi coloring" },
      }
    }
  },
  {
    "sveltejs/language-tools",
    config = function()
      require('plugins.configs.lspconfig').svelte.setup()
    end,
  },
  {
    "pocco81/true-zen.nvim",
    event = "BufRead",
    keys = {
      n = {
        -- Zen Mode
        ["<leader>W"] = { name = "Writing Mode"},
        ["<leader>Wz"] = { ":TZAtaraxis<cr>", desc = "Full Zen"},
        ["<leader>Wm"] = { ":TZMinimalist<cr>", desc = "Minimalist Mode"},
        ["<leader>Wn"] = { ":TZNarrow<cr>", desc = "Narrow Mode"},
        ["<leader>Wf"] = { ":TZFocus<cr>", desc = "Focus current pane"},
      }
    }
  },
  {
    "icebreaker/gustav.vim",
    ft = "markdown",
    keys = {
      n = {
        ["<leader>-"] = { ":call gustav#add()<CR>", desc = "Add GFM checkbox to item"},
        ["<leader>="] = { ":call gustav#toggle()<CR>", desc = "Toggle GFM checkbox status"},
      }
    }
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python"
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- Optional
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "13th Age - Stone Thief",
          path = "~/Ludothèque/TTRPGs/campaigns/13A-Stone-Thief"
        },
        {
          name = "OSE - Marches du Nord",
          path = "~/Ludothèque/TTRPGs/campaigns/OSE-marches-du-nord"
        }
      }
    }
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    dependencies = {
      "folke/twilight.nvim"
    },
    keys = {
      -- Zen Mode 
      { "<leader>z", ":ZenMode<cr>", desc = "Toggle Zen Mode" },
    },
    opts = {}
  },
  {
    "folke/twilight.nvim",
    opts = {}
  },
  {
    'f3fora/nvim-texlabconfig',
    config = function()
        require('texlabconfig').setup(config)
    end,
    ft = { 'tex', 'bib' }, -- Lazy-load on filetype
    build = 'go build'
    -- build = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
  },
  {
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>O", ":OverseerRun<cr>", desc = "Overseer build options"}
    }
  },
  {
    "mustache/vim-mustache-handlebars",
    opts = {},
    ft = "handlebars"
  }
}
