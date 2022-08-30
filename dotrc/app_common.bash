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

__dot::app::dot_configure(){
    # echo "export DOT_TMP=\`pwd\`"
    # echo "cd ~"
    echo "git clone https://github.com/TakeshiAkehi/dotfiles.git"
    # echo "cd ~/dotfiles"
    # echo "git pull origin master"
    # echo "source ~/dotfiles/setup.bash"
    # echo "cd \"\${DOT_TMP}\""
    # echo ""
}


__dot::help::dot_configure(){
    echo -e "print setup shortcut command"
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

# __dot::app::cp() {
#     __dot::gnu::cp "$@"
# }
# __dot::help::cp() {
#     echo "gnu cp"
# }

# __dot::app::ls() {
#     __dot::gnu::ls "$@" "--color=auto"
# }
# __dot::help::ls() {
#     echo "gnu ls colorized"
# }

# __dot::app::lsraw() {
#     __dot::gnu::ls "$@"
# }
# __dot::help::lsraw() {
#     echo "gnu ls"
# }

# __dot::app::mv() {
#     __dot::gnu::mv "$@"
# }
# __dot::help::mv() {
#     echo "gnu mv"
# }

# __dot::app::rm() {
#     __dot::gnu::rm "$@"
# }
# __dot::help::rm() {
#     echo "gnu rm"
# }
