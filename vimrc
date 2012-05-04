call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
syntax enable
filetype plugin on
filetype indent on

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif
