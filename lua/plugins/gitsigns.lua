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

          -- Navigate hunks; fall back to Vim's own diff-mode motion when in a diff window
          vim.keymap.set("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function() gs.nav_hunk("next") end)
            return "<Ignore>"
          end, { buffer = bufnr, expr = true })

          vim.keymap.set("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function() gs.nav_hunk("prev") end)
            return "<Ignore>"
          end, { buffer = bufnr, expr = true })
        end,
      }
    end
  }
}
