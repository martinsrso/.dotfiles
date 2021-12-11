local api = vim.api
local format = require('config.format')

function _G.reload_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd [[edit]]
end

function _G.open_lsp_log()
  local path = vim.lsp.get_log_path()
  vim.cmd("edit " .. path)
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

local lspconfig = require 'lspconfig'
local lsp_status = require 'lsp-status'

local lsp = vim.lsp
local buf_keymap = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd

local null_ls = require 'null-ls'
local null_fmt = null_ls.builtins.formatting
local null_diag = null_ls.builtins.diagnostics
null_ls.config {
  sources = {
    null_fmt.google_java_format.with({
      extra_args = { "--aosp" },
    }),
    null_fmt.trim_whitespace,
  },
}

lsp_status.config {
  kind_labels = kind_symbols,
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ['start'] = { character = 0, line = vim.fn.byte2line(symbol.valueRange[1]) },
        ['end'] = { character = 0, line = vim.fn.byte2line(symbol.valueRange[2]) },
      }

      return require('lsp-status/util').in_range(cursor_pos, value_range)
    end
  end,
  current_function = false,
}

lsp_status.register_progress()
lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
})

local keymap_opts = { noremap = true, silent = true }
local function on_attach(client)
  lsp_status.on_attach(client)

  if client.resolved_capabilities.document_formatting then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    buf_keymap(0, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
    -- format.lsp_before_save()
  end

  cmd 'augroup lsp_aucmds'
  if client.resolved_capabilities.document_highlight == true then
    cmd 'au CursorHold <buffer> lua vim.lsp.buf.document_highlight()'
    cmd 'au CursorMoved <buffer> lua vim.lsp.buf.clear_references()'
  end

  cmd 'augroup END'
end

local servers = {
  -- jdtls = {},
  java_language_server = {
      cmd = {"/Users/rafael.martins/tmp/java-language-server/dist/lang_server_mac.sh"},
  },
  ['null-ls'] = {},
}

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities.textDocument.completion.completionItem.snippetSupport = true
client_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}
client_capabilities = require('cmp_nvim_lsp').update_capabilities(client_capabilities)

for server, config in pairs(servers) do
  if type(config) == 'function' then
    config = config()
  end
  config.on_attach = on_attach
  config.capabilities = vim.tbl_deep_extend(
    'keep',
    config.capabilities or {},
    client_capabilities,
    lsp_status.capabilities
  )
  lspconfig[server].setup(config)
end

