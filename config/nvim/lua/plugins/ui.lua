return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            style = "night",
            on_colors = function(c)
                c.bg = "#1a0f1f"
                c.bg_dark = "#120b16"
                c.purple = "#bb9af7"
                c.magenta = "#c678dd"
                c.blue = "#9d7cd8"
                c.fg = "#dcd7ff"
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    
    {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("lualine").setup({
          options = {
            theme = "tokyonight",
            section_separators = { left = "", right = "" },
            component_separators = "|",
          },
        })
      end,
    },
    {
      "gen740/SmoothCursor.nvim",
      event = "BufReadPost",
      config = function()
        require("smoothcursor").setup({
        autostart = true,

        -- Kecepatan animasi
        speed = 25,
        intervals = 40,
        fancy = {
          enable = true,

          head = { cursor = "", texthl = "SmoothCursor", linehl = nil }, -- kepala

          body = {
            { cursor = "", texthl = "SmoothCursorBody1" },
            { cursor = "", texthl = "SmoothCursorBody2" },
            { cursor = "•",  texthl = "SmoothCursorBody3" },
          },
          tail = { cursor = "-", texthl = "SmoothCursorTail" },

        },
      })

      -- Warna tail / ghost effect → UNGU BIAR KELIATAN
      vim.api.nvim_set_hl(0, "SmoothCursor",        { fg = "#c678dd" }) -- kepala
      vim.api.nvim_set_hl(0, "SmoothCursorBody1",   { fg = "#bb9af7" })
      vim.api.nvim_set_hl(0, "SmoothCursorBody2",   { fg = "#9d7cd8" })
      vim.api.nvim_set_hl(0, "SmoothCursorBody3",   { fg = "#6d4ea8" })
      vim.api.nvim_set_hl(0, "SmoothCursorTail",    { fg = "#5a3c8c" })
    end,
  }

  -- {
  --   "rainbowhxch/beacon.nvim",
  --   event = "CursorMoved",
  --   config = function()
  --     require("beacon").setup({
  --       enable = true,
  --       size = 60,
  --       fade = true,
  --       minimal_jump = 10,
  --     })
  --
  --     -- warnanya #bb9af7 biar kelihatan
  --     vim.api.nvim_set_hl(0, "Beacon", { bg = "#ffffff" }) 
  --   end,
  -- }
}
