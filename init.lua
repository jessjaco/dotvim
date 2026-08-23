-- Set these before loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
local opts = { noremap = true, silent = true }

-- General
keyset('n', '<leader>vs', ':vsplit<CR><C-w>la', opts)          -- Vertical split & go
keyset('n', '<leader>vt', ':vsplit<CR><C-w>l:term<CR>a', opts) -- Vertical split & open terminal

keyset('n', '<leader>`', ':tabnew<CR>', opts)
keyset('n', '<leader>1', ':tabnext 1<CR>', opts)
keyset('n', '<leader>2', ':tabnext 2<CR>', opts)
keyset('n', '<leader>3', ':tabnext 3<CR>', opts)
keyset('n', '<leader>4', ':tabnext 4<CR>', opts)
keyset('n', '<leader>5', ':tabnext 5<CR>', opts)
keyset('n', '<leader>6', ':tabnext 6<CR>', opts)
keyset('n', '<leader>7', ':tabnext 7<CR>', opts)
keyset('n', '<leader>8', ':tabnext 8<CR>', opts)
keyset('n', '<leader>9', ':tabnext 9<CR>', opts)


keyset('n', '<leader>pi', 'A # pyright: ignore[', opts)

-- Neotree
keyset('n', '<C-n>', ':Neotree reveal=true toggle<CR>', opts)
keyset('n', '<C-l>', ':Neotree buffers position=right toggle<CR>', opts)
keyset('n', '<C-g>', ':Neotree git_status toggle<CR>', opts)

-- Write docstring for function signature at current line
keyset('n', '<leader>ds', function() require('neogen').generate() end, opts)

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
