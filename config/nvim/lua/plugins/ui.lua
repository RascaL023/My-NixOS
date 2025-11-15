return {
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("tokyonight").setup({
          transparent = false,
        })
        vim.cmd.colorscheme("tokyonight")
      end
    },
    {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("lualine").setup({
          options = { theme = "tokyonight" },
        })
      end
    },
  }
  