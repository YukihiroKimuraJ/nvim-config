-- VSCode-like editor tabs across the top of the window.
-- https://github.com/akinsho/bufferline.nvim
--
-- Each open buffer shows as a clickable tab with a filetype icon (needs a Nerd
-- Font, which is enabled via vim.g.have_nerd_font in init.lua).

vim.pack.add {
  'https://github.com/akinsho/bufferline.nvim',
  -- bufferline draws icons via nvim-web-devicons; init.lua already adds it when
  -- have_nerd_font is true, but list it here too so this file works standalone.
  'https://github.com/nvim-tree/nvim-web-devicons',
}

-- Needed for the 24-bit colors bufferline uses (tokyonight also sets this).
vim.o.termguicolors = true

require('bufferline').setup {
  options = {
    diagnostics = 'nvim_lsp', -- show LSP error/warn counts on each tab
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = 'thin',
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left',
      },
    },
  },
}

-- Tab navigation (Shift+h / Shift+l, like LazyVim)
vim.keymap.set('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer/tab' })
vim.keymap.set('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer/tab' })

-- Jump straight to tab 1..9 (like VSCode's Cmd+1..9, here <leader>1..9)
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, function() require('bufferline').go_to(i, true) end, { desc = 'Go to tab ' .. i })
end

-- Close / pick tabs
vim.keymap.set('n', '<leader>bd', '<Cmd>bdelete<CR>', { desc = '[B]uffer [D]elete (close tab)' })
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLinePick<CR>', { desc = '[B]uffer [P]ick' })
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = '[B]uffer close [O]thers' })
