return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    -- background = {
    --   light = "latte",
    --   dark = "mocha",
    -- },
    dim_inactive = {
      enabled = true,
      -- shade = "dark",
      percentage = 0.25,
    },
    integrations = {
      aerial = true,
      notify = false,
      mason = true,
      harpoon = true,
      dashboard = true,
      gitsigns = true,
      leap = true,
      octo = true,
      ts_rainbow2 = true,
      telescope = true,
      which_key = true,
      lsp_trouble = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
    },
  },
}
