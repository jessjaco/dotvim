require("config.coc")
require("config.lazy")
vim.g.jellybeans_overrides = { background= { guibg= '000000' } }
vim.cmd("colorscheme jellybeans")
vim.cmd("highlight ColorColumn term=reverse ctermbg=232 guibg=232")


-- Global options
vim.opt.shiftwidth = 2 -- Number of spaces for each level of indent
vim.opt.expandtab = true -- Use spaces when you press tab
vim.opt.tabstop = 2 -- Number of spaces for each tab
vim.opt.ruler = true -- Tells us where the cursor is
vim.opt.wildmenu = true -- Helps with wildcard expansion
vim.opt.cc = "80" -- Make column 80 a different color
vim.opt.hlsearch = false -- Turn off annoying highlighting when searching

vim.opt.makeprg = "make 2>&1"

local config_dir = vim.fn.stdpath("config")
vim.g.python3_host_prog = config_dir .. "/venv/bin/python"

-- Key maps
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
