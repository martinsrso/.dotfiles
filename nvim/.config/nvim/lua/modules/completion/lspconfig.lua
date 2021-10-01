local api = vim.api
local lspconfig = require 'lspconfig'
local global = require 'core.global'
local format = require('modules.completion.format')

if not packer_plugins['coq_nvim'].loaded then
  vim.cmd [[packadd coq_nvim]]
end

if not packer_plugins['nvim-lspconfig'].loaded then
  vim.cmd [[packadd nvim-lspconfig]]
end

if not packer_plugins['lspsaga.nvim'].loaded then
  vim.cmd [[packadd lspsaga.nvim]]
end

local saga = require 'lspsaga'
saga.init_lsp_saga({
    code_action_icon = " ",
    border_style = "round",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { 'documentation', 'detail', 'additionalTextEdits',}}

function _G.reload_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd [[edit]]
end

function _G.open_lsp_log()
  local path = vim.lsp.get_log_path()
  vim.cmd("edit " .. path)
end

local coq = require'coq'

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    signs = {
      enable = true,
      priority = 20
    },
    -- Disable a feature update_in_insert = false,
})

local enhance_attach = function(client,bufnr)
  if client.resolved_capabilities.document_formatting then
    format.lsp_before_save()
  end
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.clangd.setup {
  -- coq.lsp_ensure_capabilities{
    on_attach = enhance_attach,
    capabilities = capabilities,
    filetypes = {'cpp'},
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
  -- }
}

lspconfig.terraformls.setup{
  cmd = {
    "terraform-ls",
    "serve",
  },
  filetypes = {
    "terraform",
    "tf"
  },
  on_attach = enhance_attach,
  capabilities = capabilities,
 }

lspconfig.rust_analyzer.setup {
  on_attach = enhance_attach,
  capabilities = capabilities,
}

lspconfig.yamlls.setup {
  schemas = {
    kubernetes = "globPattern"
  },
  on_attach = enhance_attach,
  capabilities = capabilities,
}

lspconfig.sumneko_lua.setup {
    cmd = {
        global.home.."/tmp/lua-language-server/bin/macOS/lua-language-server",
        "-E",
        global.home.."/tmp/lua-language-server/main.lua"
    };
    on_attach = enhance_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                enable = true,
                globals = {"vim","packer_plugins"}
            },
            runtime = {version = "LuaJIT"},
            workspace = {
                library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
            },
        },
    }
}

lspconfig.gopls.setup {
  on_attach = enhance_attach,
  capabilities = capabilities,
  init_options = {
    usePlaceholders=true,
    completeUnimported=true,
  }
}

local servers = {
  'dockerls','bashls','pyright', 'tsserver', 'jsonls', 'html',
}

for _,server in ipairs(servers) do
  lspconfig[server].setup{
    coq.lsp_ensure_capabilities{
      on_attach = enhance_attach,
      capabilities = capabilities
    }
  }
end

