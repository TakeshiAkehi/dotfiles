function __dot::gnu::sed(){
    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        gsed "$@"
    else
        sed "$@"
    fi
}

function __dot::gnu::cp(){
    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        gcp "$@"
    else
        cp "$@"
    fi
}
function __dot::gnu::ls(){
    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        gls "$@"
    else
        ls "$@"
    fi
}
function __dot::gnu::mv(){
    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        gmv "$@"
    else
        mv "$@"
    fi
}
function __dot::gnu::rm(){
    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        grm "$@"
    else
        rm "$@"
    fi
}