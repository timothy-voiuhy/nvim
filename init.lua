-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Load LSP configurations after plugins are loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    require("config.lsp")
  end,
})
