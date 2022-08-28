
__dot::exec::exec(){
    echo "$1"
    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        print -s "${CMD}"
    else
        history -s "$1"
    fi
    eval "$1"
}

__dot::exec::interactive(){
    local SELECTED=`echo -e $1 | fzf | __dot::gnu::sed -e "s/(\(.*\)).*//"`
    __dot::exec::exec "${SELECTED}"
}