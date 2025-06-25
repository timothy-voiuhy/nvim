return {
  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("rust-tools").setup({
        tools = {
          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
          },
        },
        server = {
          on_attach = function(_, bufnr)
            local rt = require("rust-tools")
            vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, { buffer = bufnr, desc = "Rust Runnables" })
            vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables, { buffer = bufnr, desc = "Rust Debuggables" })
            vim.keymap.set("n", "<leader>re", rt.expand_macro.expand_macro, { buffer = bufnr, desc = "Expand Macro" })
          end,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      })
    end,
  },
  
  -- C/C++ tools
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    config = function()
      require("clangd_extensions").setup({
        inlay_hints = {
          inline = true,
        },
        ast = {
          role_icons = {
            type = "🄣",
            declaration = "🄓",
            expression = "🄔",
            statement = "🄢",
            specifier = "🄪",
            ["template argument"] = "🄣",
          },
          kind_icons = {
            Compound = "🄲",
            Recovery = "🅁",
            TranslationUnit = "🅄",
            PackExpansion = "🄿",
            TemplateTypeParm = "🅃",
            TemplateTemplateParm = "🅃",
            TemplateParamObject = "🅃",
          },
        },
        memory_usage = {
          border = "rounded",
        },
        symbol_info = {
          border = "rounded",
        },
      })
    end,
  },
  
  -- JavaScript/TypeScript tools
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  
  -- HTML/CSS tools
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "xml",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  
  -- Ruby tools
  {
    "tpope/vim-rails",
    ft = "ruby",
  },
} 