local api = vim.api
local lspconfig = require 'lspconfig'
local lsp = vim.lsp

-- lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = true,
--   signs = true,
--   update_in_insert = false,
--   underline = true,
-- })

-- local keymap_opts = { noremap = true, silent = true }
-- local buf_keymap = vim.api.nvim_buf_set_keymap
-- local cmd = vim.cmd
-- local function on_attach(client)
--   if client.resolved_capabilities.document_formatting then
--     client.resolved_capabilities.document_formatting = false
--     client.resolved_capabilities.document_range_formatting = false
--     buf_keymap(0, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
--   end

--   cmd 'augroup lsp_aucmds'
--   if client.resolved_capabilities.document_highlight == true then
--     cmd 'au CursorHold <buffer> lua vim.lsp.buf.document_highlight()'
--     cmd 'au CursorMoved <buffer> lua vim.lsp.buf.clear_references()'
--   end
--   cmd 'augroup END'
-- end

local servers = {
  -- rust_analyzer = {},
  -- jdtls = {},
}

-- local client_capabilities = vim.lsp.protocol.make_client_capabilities()
-- client_capabilities.textDocument.completion.completionItem.snippetSupport = true
-- client_capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = { 'documentation', 'detail', 'additionalTextEdits' },
-- }
client_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for server, config in pairs(servers) do
  if type(config) == 'function' then
    config = config()
  end
  -- config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend(
    'keep',
    config.capabilities or {},
    client_capabilities
  )
  lspconfig[server].setup(config)
end

