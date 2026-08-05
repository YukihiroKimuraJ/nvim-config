-- VSCode-like integrated terminal (toggleable panel at the bottom).
-- https://github.com/akinsho/toggleterm.nvim
--
-- Press Ctrl+\ in normal OR terminal mode to show/hide it.

vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  size = 15,
  start_in_insert = true,
  shade_terminals = true,
  -- Reuse one terminal by default; <count>Ctrl+\ opens additional ones.
  persist_size = true,
}

-- A second, full-screen floating terminal on <leader>tt — handy for one-off commands.
local Terminal = require('toggleterm.terminal').Terminal
local float_term = Terminal:new { direction = 'float', hidden = true }
vim.keymap.set('n', '<leader>tt', function() float_term:toggle() end, { desc = '[T]oggle floating [T]erminal' })

-- Make leaving the terminal feel native: Ctrl+h/j/k/l jumps to other windows
-- straight from terminal mode (kickstart only sets these in normal mode).
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-toggleterm-nav', { clear = true }),
  pattern = 'term://*toggleterm#*',
  callback = function()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  end,
})
