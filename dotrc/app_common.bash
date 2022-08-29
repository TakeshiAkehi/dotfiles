__dot::app::zshrc(){
    vim ~/.zshrc
    source ~/.zshrc
}
__dot::help::zshrc(){
    echo -e "helpmsg of zshrc \n newline availabl"
}

__dot::app::bashrc(){
    vim ~/.bashrc
    source ~/.bashrc
}
__dot::help::bashrc(){
    echo -e "helpmsg of bashrc \n newline availabl"
}

__dot::app::relogin(){
     exec $SHELL -l
}
__dot::help::relogin(){
    echo -e "re-login to shell"
}

__dot::app::reopen(){
     exec $0 -l
}
__dot::help::reopen(){
    echo -e "re-open current shel"
}

__dot::app::cc(){
    cd "$@"
    ls
}
__dot::help::cc(){
    echo -e "ls after cd"
}

__dot::app::hp(){
    if [ ${DOT_SH} = "bash" ]; then
        local names=`typeset | grep -E "^__dot::app" | __dot::gnu::sed -r 's/^__dot::app::(.*)\s\(\)\s/\1/'`
    fi

    if [ ${DOT_SH} = "zsh" ]; then
        local names=`print -l ${(ok)functions} | grep -E "^__dot::app" | __dot::gnu::sed -r 's/^__dot::app::(.*)/\1/'`
    fi

    local SELECTED=`echo -e "${names}" | fzf\
    --preview="cat \"${DOT_DIR_HELP}\"/\`echo {}\`.txt"`
    # local CMD="__dot::app::${SELECTED}"
    local CMD="${SELECTED}"
    __dot::exec::exec "${CMD}"
}
__dot::help::hp(){
    echo -e "helpmsg of hp"
}

__dot::app::hi() {
    if [ $# = 1 ]; then
        local QUERY="$1"
    else
        local QUERY=""
    fi

    if [ ${DOT_SH_LIC} = 'BSD' ]; then
        local CMD=`history -n -r 1 | awk '!a[$0]++' | fzf --query "${QUERY}" \
        --preview="man {}"`
        __dot::exec::exec "${CMD}"
    else
        local CMD=`history | tac | sed -e 's/^ *[0-9]\{1,\}\*\{0,1\} *//' -e 's/ *$//' | awk '!a[$0]++'  | fzf --query "${QUERY}" \
        --preview="man {}"`
        __dot::exec::exec "${CMD}"
    fi
}
__dot::help::hi() {
    echo -e "interactive command history"
}

__dot::app::hist() {
    __dot::app::hi "$@"
}
__dot::help::hist() {
    __dot::help::hi
}