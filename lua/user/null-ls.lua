local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
  },
}

function M.config()
  local null_ls = require "null-ls"
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  -- https://github.com/prettier-solidity/prettier-plugin-solidity
  null_ls.setup {
    debug = true,
    sources = {
      formatting.prettier,
      formatting.stylua,
      diagnostics.misspell,
    },
    -- on_attach = function(client, bufnr)
    --   if client.supports_method "textDocument/formatting" then
    --     vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --       group = augroup,
    --       buffer = bufnr,
    --       callback = function()
    --         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --         vim.lsp.buf.format { { bufnr = bufnr } }
    --       end,
    --     })
    --   end
    -- end,
  }
end

return M
