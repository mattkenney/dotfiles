vim.keymap.set('v', '\\v', function()
  -- Get the visually selected text
  local start_pos = vim.fn.getpos('v')
  local end_pos = vim.fn.getpos('.')
  local lines = vim.fn.getregion(
    start_pos, end_pos, { type = vim.fn.mode() }
  )
  local selected = table.concat(lines, '\n')

  -- Get the unnamed register
  local replacement = vim.fn.getreg('"')

  -- Escape special characters for use in a substitution pattern
  local escaped_sel = vim.fn.escape(selected, '/\\.*^$[]~')
  local escaped_rep = vim.fn.escape(replacement, '/\\&~')

  -- Run the substitution
  local cmd = string.format('%%s/\\<%s\\>/%s/gc', escaped_sel, escaped_rep)
  vim.fn.feedkeys('\27:' .. cmd .. '\r', 'n')
end, { desc = 'Substitute selected text with unnamed register' })
