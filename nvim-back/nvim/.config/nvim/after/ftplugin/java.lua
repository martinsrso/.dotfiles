local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/Users/rafael.martins/workspace/' .. project_name

local jdtls_path = tostring(vim.fn.getenv("JDTLS_HOME"))
local lombok_jar = tostring(vim.fn.getenv("LOMBOK_JAR"))

local equinox = jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local config_mac = jdtls_path .. "/config_mac/"
local java_debug_jar = vim.fn.glob("/Users/rafael.martins/.local/java-debug-main/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
    java_debug_jar,
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob("/Users/rafael.martins/.local/vscode-java-test-main/server/*.jar"), "\n"))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
  
      -- 💀
      'java', -- or '/path/to/java11_or_newer/bin/java'
              -- depends on if `java` is in your $PATH env variable and if it points to the right version.
  
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-javaagent:' .. lombok_jar,
      '-Xms1g',
      '-Xmx2G',
      -- 💀
      '-jar', equinox,
  
      -- 💀
      '-configuration', config_mac,
  
      -- 💀
      -- See `data directory configuration` section in the README
      '-data', workspace_dir,

      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    },


    init_options = {
        bundles = bundles;
    },

    --[[ on_attach = function(client, bufnr)
	    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    end, ]]
  
    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  
    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
      signatureHelp = { enabled = true };
      contentProvider = { preferred = 'fernflower' };
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        }
      };
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        };
      };
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      };
      }
    }
  }
  
  -- This starts a new client & server,
  -- or attaches to an existing client & server depending on the `root_dir`.
config['on_attach'] = function(client, bufnr)
  -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
  -- you make during a debug session immediately.
  -- Remove the option if you do not want that.
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

  require('jdtls').start_or_attach(config)
  require'jdtls.setup'.add_commands()
  require'jdtls'.setup_dap()
  -- require'lsp-status'.register_progress()

  local dap = require('dap')
