-- GitHub Copilot (AI completions)
-- Requires an active Copilot subscription. After first launch, run `:Copilot auth`.
vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }

require('copilot').setup {
  suggestion = {
    auto_trigger = true, -- show ghost-text suggestions as you type
    keymap = {
      accept = '<C-l>', -- accept the suggestion
      next = '<C-]>', -- cycle to next suggestion
      prev = '<C-[>', -- cycle to previous suggestion
      dismiss = '<C-h>', -- dismiss current suggestion
    },
  },
  panel = { enabled = false },
  -- Avoid clashing with the blink.cmp completion popup
  filetypes = {
    markdown = true,
    help = false,
  },
}
