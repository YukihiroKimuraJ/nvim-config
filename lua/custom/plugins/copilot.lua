-- GitHub Copilot (AI completions)
-- Requires an active Copilot subscription. After first launch, run `:Copilot auth`.
vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }

require('copilot').setup {
  suggestion = {
    auto_trigger = true, -- show ghost-text suggestions as you type
    keymap = {
      accept = '<C-l>', -- accept the suggestion
      -- next/prev/dismiss keep copilot's Alt-based defaults (<M-]> / <M-[> / <C-]>)
      -- to avoid clobbering <Esc> (== <C-[>) and <BS> (== <C-h>) in the terminal.
    },
  },
  panel = { enabled = false },
  -- Avoid clashing with the blink.cmp completion popup
  filetypes = {
    markdown = true,
    help = false,
  },
}
