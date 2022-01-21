function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

local definitions = {
    bufs = {
        {'BufReadPost', '*', [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]};
        {"BufWritePre","/tmp/*","setlocal noundofile"};
        {"BufWritePre","COMMIT_EDITMSG","setlocal noundofile"};
        {"BufWritePre","MERGE_MSG","setlocal noundofile"};
        {"BufWritePre","*.tmp","setlocal noundofile"};
        {"BufWritePre","*.bak","setlocal noundofile"};
        -- {"BufWritePre (InsertLeave?) <buffer>","*","lua vim.lsp.buf.formatting_sync(nil,500)"};
        -- {"BufWritePre", "*.rs", "silent! lua vim.lsp.buf.formatting_sync(nil,500)"};
    };

    wins = {
        -- Highlight current line only on focused window
        {"WinEnter,BufEnter,InsertLeave", "*", [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]]};
        -- Equalize window dimensions when resizing vim window
        {"VimResized", "*", [[tabdo wincmd =]]};
        -- Force write shada on leaving nvim
        {"VimLeave", "*", [[if has('nvim') | wshada! | else | wviminfo! | endif]]};
        -- Check if file changed when its window is focus, more eager than 'autoread'
        {"FocusGained", "* checktime"};
    };

    ft = {
        {"FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"};
        {"FileType", "TelescopePrompt", "lua require('cmp').setup.buffer { completion = { autocomplete = false } }" };
        {"BufNewFile,BufRead","*.toml"," setf toml"};
    };

     yank = {
       {"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]};
     };
}

nvim_create_augroups(definitions)
