return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>lo", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview with full file view" },
    { "<leader>lc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    { "<leader>lh", "<cmd>DiffviewFileHistory<CR>", desc = "Open DiffviewFileHistory" },
  },
  opts = {
    view = {
      default = {
        layout = "diff2_horizontal",
      },
    },
  },
  config = function(_, opts)
    require("diffview").setup(opts)
  end,
}
