return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- set code actions
      -- git signs, blame etc
      gitsigns = code_actions.gitsigns.with {
        config = {
          filter_actions = function(title)
            -- TODO filter out more when this gets annoying
            return title:lower():match "blame" == nil -- filter out blame actions
          end,
        },
      },
      code_actions.shellcheck,
      -- Go tool to modify struct field tags
      code_actions.gomodifytags,
      -- impl generates method stubs for implementing an interface
      code_actions.impl,
      --
      -- TODO some of those require additional installs
      -- either tooling in the OS (path accessible commands),
      -- or additional vim plugins
      --
      -- Marting Fowler refactoring automation for multiple languages
      code_actions.refactoring,
      -- set formatter
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      formatting.isort,
      formatting.gofumpt,
      formatting.shfmt,
      formatting.reorder_python_imports,
      -- set linter
      diagnostics.mypy,
      -- TODO already provided by LSP?
      -- diagnostics.golangci_lint,
      diagnostics.gitlint,
      diagnostics.clj_kondo,
      diagnostics.commitlint,
      -- Needs to be available as command
      -- diagnostics.misspell,
      -- diagnostics.codespell,
    }
    return config
  end,
}
