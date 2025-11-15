return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  
    config = function()
      local telescope = require("telescope")
  
      telescope.setup({
        defaults = {
          layout_strategy = "flex",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
        },
      })
  
      -- keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
  
      map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
      map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
      map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
      map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
    end,
  }
  