function __dot::gnu::sed(){
    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        gsed "$@"
    else
        sed "$@"
    fi
}