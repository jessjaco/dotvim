return {
  {
    "itchyny/lightline.vim",
    lazy = false,
    config = function()
      vim.g.lightline = {
        active = {
          left = {
            { 'mode',      'paste' },
            { 'cocstatus', 'readonly', 'relativepath', 'modified' }
          },
        },
        component_function = { cocstatus = "coc#status" }
      }
    end
  }
}
