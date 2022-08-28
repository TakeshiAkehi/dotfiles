
__dot::app::fgit_checkout(){
    TARGET=`git branch $1 | fzf --preview \
    "echo {} | tr -d ' *' | xargs git log --oneline --first-parent --graph --decorate --color=always" \
    | xargs echo | tr -d ' *' `
    CMD="git checkout ${TARGET}"
    __dot::exec::exec "$CMD"
}

__dot::help::fgit_checkout() {
    echo -e "interactive git checkout\n\
default : only local branches\n\
-r : only remote branches\n\
-a : all branches"
}