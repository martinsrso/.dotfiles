local api = vim.api
local lspconfig = require 'lspconfig'
local global = require 'core.global'
local format = require('modules.completion.format')
local null_ls = require 'null-ls'

if not packer_plugins['nvim-lspconfig'].loaded then
  vim.cmd [[packadd nvim-lspconfig]]
end

if not packer_plugins['nvim-cmp'].loaded then
  vim.cmd [[packadd nvim-cmp]]
end

if not packer_plugins['cmp-nvim-lsp'].loaded then
  vim.cmd [[packadd cmp-nvim-lsp]]
end

-- null-ls setup
local null_fmt = null_ls.builtins.formatting
local null_diag = null_ls.builtins.diagnostics
null_ls.config {
  sources = {
    null_fmt.terraform_fmt,
    -- null_fmt.clang_format,
    -- null_fmt.cmake_format,
    null_fmt.fixjson,
    -- null_fmt.isort,
    -- null_fmt.prettier,
    -- null_fmt.rustfmt,
    null_diag.shellcheck,
    null_fmt.shfmt,
    -- null_fmt.stylua,
    null_fmt.trim_whitespace,
    -- null_fmt.yapf,
    -- null_diag.chktex,
    null_diag.write_good.with { filetypes = { 'markdown' } },
    -- null_diag.vale,
    -- null_diag.teal,
    -- null_diag.vint,
    -- null_diag.selene,
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { 'documentation', 'detail', 'additionalTextEdits',}}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
    update_in_insert = false,
})

local enhance_attach = function(client,bufnr)
  local keymap_opts = { noremap = true, silent = true }
  print(vim.inspect(client.resolved_capabilities.document_formatting))
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ft', '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
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
  filetypes = {
    "terraform",
    "tf"
  },
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

lspconfig['null-ls'].setup({})

local servers = {
  'sqlls',
  'dockerls',
  'bashls',
  -- 'pyright',
  -- 'tsserver',
  'jsonls',
  -- 'html',
  -- 'ansiblels',
  -- 'pyls',
  -- 'cssls'
}

for _,server in ipairs(servers) do
  lspconfig[server].setup{
      on_attach = enhance_attach,
      capabilities = capabilities
  }
end

