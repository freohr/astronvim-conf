local utils = require('user.utils')
-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<A-]>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer"
    },
    ["<A-[>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer"
    },
    -- Quick insert shebangs
    ["<leader>#"] = { name = "Shebangs" },
    ["<leader>#b"] = { "gg^i#!/bin/bash<Esc>``", desc = "bash"},
    ["<leader>#z"] = { "gg^i#!/bin/zsh<Esc>``", desc = "zsh"},
    ["<leader>#p"] = { "gg^i#!/bin/python<Esc>``", desc = "system python"},
    ["<leader>#P"] = { "gg^i#!python<Esc>``", desc = "venv python"},
    -- Select all
    ["yA"] = { "gg^yG``", desc = "Copy entire file content"},
    ["dA"] = { "gg^dG", desc = "Delete entire file content"},
    ["<leader>W"] = { ":w !sudo tee %", desc = "Force Save with sudo"},
  },
  i = {
  },
  v = {
    ["<leader>c"] = {
      function()
        local newfile_path = vim.fn.expand("%:.:h").."/"..utils.buf_vtext()
        vim.cmd(":e "..newfile_path)
      end,
      desc = "Create or open file from selection relative to current buffer"
    },
    ["A"] = {
      "<Esc>gg^vG$", desc = "Select All"
    },
    ["H"] = {
      function()
        local escaped_text = utils.buf_vtext()
      end,
      desc = "Replace selected text"
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
