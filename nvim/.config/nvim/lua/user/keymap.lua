local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Set leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--  normal_mode 'n',
--  insert_mode 'i',
--  visual_mode 'v',
--  visual_block_mode 'x',
--  term_mode = 't',
--  command_mode = 'c',

-- Normal mappings
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Normal mappings for Telescope
keymap('n', '<leader>ff', ':Telescope find_files<enter>', opts)
keymap('n', '<leader>fh', ':Telescope find_files hidden=true<enter>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<enter>', opts)

-- Insert mappings
keymap('i', 'jk', '<ESC>', opts)
