local cmp_enabled = true

vim.api.nvim_create_user_command("ToggleAutoComplete", function()
  if cmp_enabled then
    require("cmp").setup.buffer({ enabled = false })
    cmp_enabled = false
  else
    require("cmp").setup.buffer({ enabled = true })
    cmp_enabled = true
  end
end, {})

vim.keymap.set(
  'n',
  '<leader>cc',
  ':ToggleAutoComplete<CR>',
  { desc = 'CMP: [C]ompletions Toggle [C]' }
)
