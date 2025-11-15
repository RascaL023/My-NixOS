-- local jdtls = require("jdtls")
-- 
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
-- 
-- local config = {
--   cmd = { "jdtls", "-data", workspace_dir },
--   root_dir = vim.fs.root(0, { "gradlew", "mvnw", ".git" }),
-- 
--   capabilities = capabilities,
-- 
--   on_attach = function(client, bufnr)
--     -- biar dapet autocomplete
--     require("jdtls").setup_dap()
--     require("jdtls.setup").add_commands()
--   end,
-- }
-- 
-- jdtls.start_or_attach(config)

local jdtls = require("jdtls")

-- Workspace untuk tiap project
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

-- Autocomplete capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Root dir = folder project java
local root_dir = require("jdtls.setup").find_root({
  "mvnw",
  "gradlew",
  "pom.xml",
  "build.gradle",
  ".git",
})

-- Configuration JDTLS
local config = {
  cmd = { "jdtls", "-data", workspace_dir },
  root_dir = root_dir,
  capabilities = capabilities,

  settings = {
    java = {
      contentProvider = { preferred = "fernflower" }, -- buat decompile class
      completion = {
        favoriteStaticMembers = {
          "org.springframework.*",
          "org.springframework.boot.*"
        }
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        }
      },
    },
  },

  init_options = {
    bundles = {},
  },
}

-- Start LSP
jdtls.start_or_attach(config)
