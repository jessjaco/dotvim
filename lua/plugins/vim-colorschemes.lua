return {
  {
    "flazz/vim-colorschemes",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.jellybeans_overrides = { background= { guibg= '000000' } }
      vim.cmd("colorscheme jellybeans")
      vim.cmd("highlight ColorColumn term=reverse ctermbg=232 guibg=232")
    end
  }
}
