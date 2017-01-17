#Vim Notes

##To get this stuff

    git clone https://github.com/blindjesse/dotvim vimfiles
    cd vimfiles
    # then link .vimrc .gvimrc to the appropriate place 
    # in windows (in %USERPROFILE% dir):
    mklink /H "_vimrc" "vimfiles\vimrc"

##To add plugin
1) Install Vundle (see vundle site; follow git directions if you need git)
  But see updates to init.vim which may install it automatically
2) add 
     Plugin 'username/repo'
   to vimrc, then launch vim and type `:PluginInstall`. Use `:PluginUpdate` to
   update plugins

## To change options for certain filetype.
See options for whatever plugin we use for that filetype OR make a
<filetype>.vim file in the vimfiles/after/ftplugin directory and set the
options that you want in there
