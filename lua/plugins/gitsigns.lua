return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup {
        current_line_blame = false, -- don't show always-on blame
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          vim.keymap.set("n", "<leader>gb", gs.blame, { buffer = bufnr })
          vim.keymap.set("n", "<leader>gd", gs.diffthis, { buffer = bufnr })
        end,
      }
    end
  }
}
