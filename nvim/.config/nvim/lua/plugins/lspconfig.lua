local present, nvim_lsp = pcall(require, "lspconfig")
if not present then
   return
end

local present, trouble = pcall(require, "trouble")
if not present then
   return
end

local present, lsp_status = pcall(require, "lsp-status")
if not present then
   return
end

-- local present, illuminate = pcall(require, "illuminate")
-- if not present then
--    return
-- end

lsp_status.config {
    current_function = false,
    show_filename = false,
    diagnostics = false,
}

lsp_status.register_progress()

-- rounded borders
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
--
-- add small icon before diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
   -- virtual_text = {
   --    prefix = "",
   --    spacing = 7,
   -- },
   float = {
        show_header = true,
    },
   signs = true,
   underline = true,
   update_in_insert = false, -- update diagnostics insert mode
})

vim.cmd([[
sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
]])

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- vim.api.nvim_exec(
    --   [[
    -- augroup lsp_document_highlight
    --   autocmd! * <buffer>
    --   autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    --   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    -- augroup END
    -- ]],
    --   false
    -- )
      vim.cmd [[
  augroup lsp_buf_format
  au! BufWritePre <buffer>
  autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
  augroup END
  ]]
    -- illuminate.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, server in ipairs({
    "rust-analyzer",
    -- "null-ls",
    "bashls",
    "dockerls",
    "jsonls",
}) do
    require("lsp." .. server).setup(on_attach, capabilities)
end

-- suppress lspconfig messages local notify = vim.notify
-- vim.notify = function(msg, ...)
--     if msg:match("%[lspconfig%]") then
--         return
--     end
--
--     notify(msg, ...)
-- end
