return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "RRethy/nvim-treesitter-textsubjects",
    "HiPhish/nvim-ts-rainbow2",
    {
      "andymass/vim-matchup",
      init = function() vim.g.matchup_matchparen_deferred = 1 end,
    },
  },
  opts = {
    matchup = { enable = true },
    textsubjects = {
      enable = true,
      prev_selection = ",", -- (Optional) keymap to select the previous selection
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ["i;"] = "textsubjects-container-inner",
      },
    },
    -- ensure_installed = { "lua" },
    rainbow = {
      -- enable rainbow coloured enclosures
      enable = true,
    },
  },
}
