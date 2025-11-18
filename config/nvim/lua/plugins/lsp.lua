-- return {
--   "neovim/nvim-lspconfig",
--   "mfussenegger/nvim-jdtls",
-- }

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "mfussenegger/nvim-jdtls", -- Kalau kamu pakai Java
  },

  config = function()
    local lspconfig = require("lspconfig")

    -- Integrasi dengan nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Aktifkan LSP untuk C/C++
    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = { "clangd" },
    })

    -- Aktifkan LSP untuk Go
    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    -- Contoh tambahan: Lua (opsional)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })
  end,
}

