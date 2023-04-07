return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-hop.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    {
      "ThePrimeagen/harpoon",
      lazy = false,
    },
  },
  opts = function(_, opts)
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local fb_actions = require("telescope").extensions.file_browser.actions
    local hop = telescope.extensions.hop
    return require("astronvim.utils").extend_tbl(opts, {
      defaults = {
        layout_strategy = "flex",
        layout_config = {
          flex = {
            prompt_position = "top",
            -- nof columns required to flip to horizontal
            flip_columns = 100,
            -- nof lines required to flip to vertical
            flip_lines = 40,
            -- horizontal = {
            --   -- options to pass for horizontal layour
            --   prompt_position = "top",
            --   preview_width = 0.55,
            --   results_width = 0.8,
            -- },
            -- vertical = {
            --   -- options to pass for vertical layour
            --   mirror = false,
            -- },
            width = 0.9,
            height = 0.9,
            preview_cutoff = 120,
          },
        },
        mappings = {
          i = {
            -- Quickfix is swapped compared to default
            ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-h>"] = hop.hop,
            ["<C-space>"] = function(prompt_bufnr)
              hop._hop_loop(
                prompt_bufnr,
                { callback = actions.toggle_selection, loop_callback = actions.send_selected_to_qflist }
              )
            end,
          },
          n = {
            -- Quickfix is swapped compared to default
            ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          mappings = {
            i = {
              ["<C-z>"] = fb_actions.toggle_hidden,
            },
            n = {
              z = fb_actions.toggle_hidden,
            },
          },
        },
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- "smart_case" (default) or "ignore_case" or "respect_case"
        },
      },
    })
  end,
  config = function(plugin, opts)
    -- run the core AstroNvim configuration function with the options table
    require "plugins.configs.telescope"(plugin, opts)

    -- require telescope and load extensions as necessary
    local telescope = require "telescope"
    telescope.load_extension "fzf"
    telescope.load_extension "harpoon"
  end,
}
