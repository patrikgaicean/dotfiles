local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

-- disable default next/previous
vim.keymap.set({ 'i', 'n', 'v', 'c' }, '<C-n>', '<Nop>')
vim.keymap.set({ 'i', 'n', 'v', 'c' }, '<C-p>', '<Nop>')
vim.keymap.set({ 'i', 'n', 'v', 'c' }, '<C-j>', '<Nop>')
vim.keymap.set({ 'i', 'n', 'v', 'c' }, '<C-k>', '<Nop>')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- [E]dit
--

-- [T]ree
vim.keymap.set('n', '<leader>tt', ':NvimTreeFocus<CR>', { desc = '[tt] [T]ree Open [T]' })
vim.keymap.set('n', '<leader>tq', ':NvimTreeClose<CR>', { desc = '[tq] [T]ree [Q]uit' })

-- [S]earch
vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it Files' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch [S]tring by Grep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [D]iffview
vim.keymap.set('n', '<leader>dd', ':DiffviewOpen<CR>', { desc = '[D]iffview Open [D]' })
vim.keymap.set('n', '<leader>dq', ':DiffviewClose<CR>', { desc = '[D]iffview [Q]uit' })
vim.keymap.set('n', '<leader>dt', ':DiffviewToggleFiles<CR>', { desc = '[D]iffview [T]oggle Files' })
vim.keymap.set('n', '<leader>df', ':DiffviewFocusFiles<CR>', { desc = '[D]iffview [F]ocus Files' })
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory<CR>', { desc = '[D]iffview File [H]istory' })

-- Dia[G]nostic
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
