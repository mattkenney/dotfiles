local lsps = {
  { "jsonls" },
  { "lua_ls" },
  { "pyright" },
  { "rust_analyzer" },
  { "ts_ls" },
}

local lsp_names = {}
for i, lsp in ipairs(lsps) do
  lsp_names[i] = lsp[1]
end

vim.keymap.set('n', '\\h', function()
  local diagnostics = vim.diagnostic.get(0, { 
    lnum = vim.fn.line('.') - 1,
    col = vim.fn.col('.') - 1 
  })
  if #diagnostics > 0 then
    vim.diagnostic.open_float()
  else
    vim.lsp.buf.hover()
  end
end, { desc = 'Show diagnostic or hover' })

vim.keymap.set('n', '\\\\h', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = 'Close floating windows' })

return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = lsp_names,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      for _, lsp in pairs(lsps) do
          local name, config = lsp[1], lsp[2]
          vim.lsp.enable(name)
          if config then
              vim.lsp.config(name, config)
          end
      end
    end
  },
}
