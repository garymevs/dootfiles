local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
    vim.notify('Error requiring lspconfig module')
    return
end

require('user.lsp.lsp-installer')
require('user.lsp.handlers').setup()
