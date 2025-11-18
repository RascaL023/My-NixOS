return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  -- {
    -- "echasnovski/mini.nvim",
    -- version = false,
    -- lazy = false,  -- <--- paksa dimuat saat startup
    -- config = function()
      -- local mini_notify = require("mini.notify")
      -- mini_notify.setup({
        -- timeout = 3000,
        -- stages = "fade_in_slide_out",
      -- })
      -- vim.notify = mini_notify.notify
    -- end,
  -- },
}

