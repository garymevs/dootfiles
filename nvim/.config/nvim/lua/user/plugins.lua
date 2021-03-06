local fn = vim.fn

-- Automagically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- TODO: Convert to lua augroup at some point
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Protected call to handle errors properly
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    vim.notify('Error requiring packer module')
    return
end

-- Actual plugin stuffs
return packer.startup(function(use)

    -- General Plugins
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-autopairs'

    -- Colourscheme
    use 'gruvbox-community/gruvbox'

    -- cmp plugins 
    use 'hrsh7th/nvim-cmp' -- Completion plugin
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-cmdline' -- cmdline completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP completions

    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
    use 'rafamadriz/friendly-snippets' -- A collection of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- Enable LSP
    use 'williamboman/nvim-lsp-installer' -- Simple language server installer
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Automagically set up your configuration after cloning packer.nvim
    -- Keep this at the end
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
