-- Ensure this file doesn't error if LSP servers aren't installed yet
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("nvim-lspconfig not found, LSP not configured", vim.log.levels.WARN)
  return
end

-- Set up keymaps for LSP functionality
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  
  -- Keybindings for LSP functionality
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
end

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic symbols in the sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Safe setup function that only sets up servers that exist
local function setup_server(server_name, config)
  -- Skip if server doesn't exist in lspconfig
  if not lspconfig[server_name] then
    return
  end

  if not config then
    config = {}
  end
  
  -- Add on_attach to config if not already present
  if not config.on_attach then
    config.on_attach = on_attach
  end
  
  -- Use pcall to safely set up the server
  local success, err = pcall(function()
    lspconfig[server_name].setup(config)
  end)
  
  if not success then
    vim.notify("Failed to set up " .. server_name .. ": " .. tostring(err), vim.log.levels.WARN)
  end
end

-- List of servers to configure
local servers = {
  -- Python
  pyright = {},  -- Python type checker
  pylsp = {      -- Python linting
    settings = {
      pylsp = {
        pylint = { enabled = true },
        pyflakes = { enabled = true },
        pycodestyle = { enabled = true },
        yapf = { enabled = true },
        autopep8 = { enabled = true },
        mccabe = { enabled = true },
        flake8 = { enabled = true },
        rope_autoimport = { enabled = false },
      },
    },
  },
  
  -- C/C++
  clangd = {
    cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
  },
  
  -- JavaScript/TypeScript
  -- tsserver = {
  --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  -- },

  -- Javascript
  eslint = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  
  -- HTML
  html = {
    filetypes = { "html" },
  },
  
  -- CSS
  cssls = {
    filetypes = { "css", "scss", "less" },
  },
  
  -- -- Ruby
  -- solargraph = {
  --   filetypes = { "ruby" },
  -- },
  
  -- Rust
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

-- Set up each server
for server_name, config in pairs(servers) do
  setup_server(server_name, config)
end 