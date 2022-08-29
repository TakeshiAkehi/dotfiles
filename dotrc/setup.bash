# set vi command line mode
set -o vi

# overwrite some BSD command to GNU command
if [ ${DOT_SH_LIC} = 'BSD' ]; then
    function cp(){
        gcp "$@"
    }
    function ls(){
        gls "$@"
    }
    function rm(){
        grm "$@"
    }
    function mv(){
        gmv "$@"
    }
fi

