return {
  "ggandor/leap.nvim",
  event = "User AstroFile",
  config = function(_, opts)
    local leap = require "leap"
    leap.setup(opts)
    leap.add_default_mappings()
  end,
}
