return {
  {
    "williamboman/mason.nvim",
    priority = 100,  -- Ensure Mason loads early
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    priority = 90,  -- Load after Mason but before LSP config
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          -- "tsserver",
          "eslint",
          "html",
          "cssls",
          -- "solargraph",
          "rust_analyzer",
          "pyright",
          "pylsp",
        },
        automatic_installation = true,
      })
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    priority = 80,  -- Load after Mason and Mason-lspconfig
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Formatters
          "prettier",
          "stylua",
          "black",
          "clang-format",
          "rustfmt",
          
          -- Linters
          "eslint_d",
          "flake8",
          "pylint",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
} 