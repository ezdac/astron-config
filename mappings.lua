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
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>t"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    --
    -- TODO remap lower case h core functionality to H
    -- and use h for harpoon
    ["<leader>H"] = { name = "⇁ Harpoon" },
    ["<leader>Ha"] = {
      function() require("harpoon.mark").add_file() end,
      desc = "add File to marks",
    },
    ["<leader>Hm"] = {
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "Menu",
    },
    ["<leader>f'"] = {
      "<cmd>Telescope harpoon marks<CR>",
      desc = "Find Harpoon marks",
    },
    -- TODO find quicker mapping
    ["<leader>H1"] = {
      function() require("harpoon.ui").nav_file(1) end,
      desc = "Harpoon 1",
    },
    ["<leader>H2"] = {
      function() require("harpoon.ui").nav_file(2) end,
      desc = "Harpoon 2",
    },
    ["<leader>H3"] = {
      function() require("harpoon.ui").nav_file(3) end,
      desc = "Harpoon 3",
    },
    ["<leader>H4"] = {
      function() require("harpoon.ui").nav_file(4) end,
      desc = "Harpoon 4",
    },
    --
    -- GitHub / octo
    ["<leader>G"] = { name = " GitHub" },
    ["<leader>Gi"] = { "<cmd>Octo issue list<cr>", desc = "Open Issues" },
    ["<leader>GI"] = { "<cmd>Octo issue search<cr>", desc = "Search Issues" },
    ["<leader>Gp"] = { "<cmd>Octo pr list<cr>", desc = "Open PRs" },
    ["<leader>GP"] = { "<cmd>Octo pr search<cr>", desc = "Search PRs" },
    ["<leader>Gr"] = { "<cmd>Octo repo list<cr>", desc = "Open Repository" },
    --
    -- Trouble
    ["<leader>x"] = { desc = "裂Trouble" },
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    ["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
  },
  -- t = {
  --   -- setting a mapping to false will disable it
  --   -- ["<esc>"] = false,
  -- },
  i = {
    ["<leader>i"] = {
      "<cmd>IconPickerInsert<CR>",
      desc = "😃 Pick icon",
    },
  },
}
