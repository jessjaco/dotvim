-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

-- Global options
vim.opt.shiftwidth = 2        -- Number of spaces for each level of indent
vim.opt.expandtab = true      -- Use spaces when you press tab
vim.opt.tabstop = 2           -- Number of spaces for each tab
vim.opt.ruler = true          -- Tells us where the cursor is
vim.opt.wildmenu = true       -- Helps with wildcard expansion
vim.opt.cc = "80"             -- Make column 80 a different color
vim.opt.hlsearch = false      -- Turn off annoying highlighting when searching

vim.opt.makeprg = "make 2>&1" -- capture stderr (for ifx)

local config_dir = vim.fn.stdpath("config")
vim.g.python3_host_prog = config_dir .. "/venv/bin/python"

-- Key maps
local keyset = vim.keymap.set
keyset('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
keyset('n', '<C-l>', ':Neotree buffers toggle<CR>', { noremap = true, silent = true })

-- Write docstring for function signature at current line
vim.keymap.set(
  'n', '<leader>ds', require('neogen').generate,
  { noremap = true, silent = true }
)

local function toggle_breakpoint(text)
  local line = vim.api.nvim_get_current_line()
  if line:find(text, 1, true) then
    vim.api.nvim_set_current_line("")
  else
    vim.api.nvim_set_current_line(text)
  end
end

-- For Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.keymap.set("n", "<localleader>b", function()
      toggle_breakpoint("breakpoint()")
    end, { buffer = true, desc = "Toggle Python breakpoint" })
  end,
})

-- For R
vim.api.nvim_create_autocmd("FileType", {
  pattern = "r",
  callback = function()
    vim.keymap.set("n", "<localleader>b", function()
      toggle_breakpoint("browser()")
    end, { buffer = true, desc = "Toggle R browser" })
  end,
})

vim.keymap.set('n', '<leader>df', function()
  -- Temporarily visually select the function with 'vaf'
  vim.cmd('normal! vaf')

  -- Get start/end of visual selection
  local start_pos  = vim.fn.getpos("'<")
  local end_pos    = vim.fn.getpos("'>")
  local start_line = start_pos[2]
  local end_line   = end_pos[2]

  -- Grab the lines of the function
  local lines      = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local func_text  = table.concat(lines, "\n")
  print(func_text)

  -- Prepare prompt with selected text
  local prompt =
      "add a docstring to this function, google style, don't specify types in docs but keep them in sig. I still want the args and returns parts. 80 character line limits.\n" ..
      func_text

  -- Call gp.nvim's generate function with prompt
  require('gp').cmd.Prepend(prompt)
end)
