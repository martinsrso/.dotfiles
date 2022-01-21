local M = {}

M.setup = function(on_attach, capabilities)
        -- Update this path
        local extension_path = '/Users/oliveira.rafael/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
        local codelldb_path = extension_path .. 'adapter/codelldb'
        local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
        local util = require("lspconfig/util")

        local rust_opts = {
          tools = {
            autoSetHints = true,
            hover_with_actions = true,
            runnables = {
              use_telescope = true,
            },
            inlay_hints = {
                -- Only show inlay hints for the current line
                only_current_line = true,

                -- Event which triggers a refersh of the inlay hints.
                -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
                -- not that this may cause  higher CPU usage.
                -- This option is only respected when only_current_line and
                -- autoSetHints both are true.
                only_current_line_autocmd = "CursorHold",

                -- wheter to show parameter hints with the inlay hints or not
                show_parameter_hints = false,

                -- prefix for parameter hints
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                other_hints_prefix = "=> ",

                -- whether to align to the length of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 3,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "Comment",
            },
            -- inlay_hints = {
              -- show_parameter_hints = false,
              -- parameter_hints_prefix = "",
              -- other_hints_prefix = "         |=>",
            -- },
            hover_actions = {
              border = "single",
            },
          },
          dap = {
            adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
          },
          server = {
            --cmd = {"/home/sharks/source/dotfiles/misc/misc/rust-analyzer-wrapper"},
            on_attach = on_attach,
            root_dir = util.root_pattern("Cargo.toml"),
            capabilities = capabilities,
            settings = {
              -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
              ["rust-analyzer"] = {
                updates = { channel = "stable" },
                notifications = { cargoTomlNotFound = false },
                assist = {
                  importGroup = true,
                  importMergeBehaviour = "full",
                  importPrefix = "by_crate",
                },

                callInfo = {
                  full = true,
                },

                cargo = {
                  allFeatures = true,
                  autoreload = true,
                  loadOutDirsFromCheck = true,
                },

                checkOnSave = {
                  command = "clippy",
                  allFeatures = true,
                  extraArgs = {"--tests"},
                },

                completion = {
                  addCallArgumentSnippets = true,
                  addCallParenthesis = true,
                  postfix = {
                    enable = true,
                  },
                  autoimport = {
                    enable = true,
                  },
                },

                diagnostics = {
                  enable = true,
                  enableExperimental = true,
                },

                hoverActions = {
                  enable = true,
                  debug = true,
                  gotoTypeDef = true,
                  implementations = true,
                  run = true,
                  linksInHover = true,
                },

                inlayHints = {
                  chainingHints = true,
                  parameterHints = true,
                  typeHints = true,
                },

                lens = {
                  enable = true,
                  debug = true,
                  implementations = true,
                  run = true,
                  methodReferences = true,
                  references = true,
                },

                notifications = {
                  cargoTomlNotFound = true,
                },

                procMacro = {
                  enable = true,
                },
              }, -- ["rust-analyzer"]
            }, -- settings
          }, -- lsp server
        }
		require('rust-tools').setup(rust_opts)
end

return M
