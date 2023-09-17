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
    config = function()
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
  }
}
