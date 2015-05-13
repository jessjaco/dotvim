#Vim Notes

##To get this stuff

    git clone https://github.com/blindjesse/dotvim vimfiles
    cd vimfiles
    git submodule init
    git submodule update
    # then link .vimrc .gvimrc to the appropriate place 
    # in windows (in %USERPROFILE% dir):
    mklink /H "_vimrc" "vimfiles\vimrc"

##To add submodule
`git submodule add <url> bundle\<name>`

##To update submodules
`git submodule foreach git pull origin master`

##To get R plugin working when you're using 2.6 and portable python
Do not add portable python dir to path - see vimrc
Make sure includes are in pythonpath too - see vimrc
Ignore error (for now) when loading R file

## To change options for certain filetype.
See options for whatever plugin we use for that filetype OR make a
<filetype>.vim file in the vimfiles/after/ftplugin directory and set the
options that you want in there
