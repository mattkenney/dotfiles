local on_attach = function(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr, {
    --autotrigger = true,
    convert = function(item)
      return { abbr = item.label:gsub('%b()', '') }
    end,
  })
end

local lsps = {
  { "jsonls", { on_attach = on_attach } },
  { "lua_ls", { on_attach = on_attach } },
  { "pyright", { on_attach = on_attach } },
  { "rust_analyzer", { on_attach = on_attach } },
  { "ts_ls", { on_attach = on_attach } },
}

local lsp_names = {}
for i, lsp in ipairs(lsps) do
  lsp_names[i] = lsp[1]
end

vim.cmd[[set completeopt+=menuone,noselect,popup]]
vim.keymap.set('i', '\\c', function()
  vim.lsp.completion.get()
end, { desc = 'Show code completion' })

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

vim.keymap.set('n', '\\\\z', function()
  vim.lsp.stop_client(vim.lsp.get_clients())
  print("LSP stopped")
end, { desc = 'Disable LSP' })

vim.keymap.set('n', '\\z', function()
  vim.cmd('edit')  -- Reload buffer to restart LSP
  print("LSP restarted")
end, { desc = 'Re-enable LSP' })

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
