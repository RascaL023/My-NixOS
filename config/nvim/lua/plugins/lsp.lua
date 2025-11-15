-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = { "mfussenegger/nvim-jdtls" },
-- 
--   config = function()
--     local lsp = require("lspconfig")
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 
--     -- contoh: lsp lua
--     lsp.lua_ls.setup({ capabilities = capabilities })
--   end,
-- }

return {
  "neovim/nvim-lspconfig",
  "mfussenegger/nvim-jdtls",
}
