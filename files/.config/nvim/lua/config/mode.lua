vim.cmd("colorscheme vscode")
vim.o.background = 'light'

local mode_group = vim.api.nvim_create_augroup('ModeGroup', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  group = mode_group,
  callback = function()
    if vim.wo.diff then
      vim.cmd('colorscheme github')
    end
  end,
})

vim.api.nvim_create_autocmd('InsertEnter', {
  group = mode_group,
  callback = function()
    vim.o.background = 'dark'
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  group = mode_group,
  callback = function()
    vim.o.background = 'light'
  end,
})

vim.api.nvim_create_autocmd('OptionSet', {
  group = mode_group,
  pattern = 'diff',
  callback = function()
    if vim.wo.diff then
      vim.cmd('colorscheme github')
    else
      vim.cmd('colorscheme vscode')
    end
  end,
})
