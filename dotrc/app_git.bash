__dot::app::fzgit_branch(){
    TARGET=`git branch -a | fzf --preview \
    "echo {} | tr -d ' *' | xargs git log --oneline --first-parent --graph --decorate --color=always" \
    | xargs echo | tr -d ' *' `
    echo ${TARGET}
}

__dot::help::fzgit_branch() {
    echo -e "interactive git branch selector"
}

# __dot::app::fzgit_commit(){
#     # TARGET=`git branch -a | fzf --preview \
#     # "echo {} | tr -d ' *' | xargs git log --oneline --first-parent --graph --decorate --color=always" \
#     # | xargs echo | tr -d ' *' `
#     TARGET=`git log --pretty=format:"%h %s %ad (%ar) by  %cn" --graph | fzf \
#     --preview="echo {} | sed -r 's/.*\s([0-9a-f]{7}\s).*/\1/' | xargs echo "\
#     `
#     # --preview="git show {}"\
#     echo ${TARGET}
# }

# __dot::help::fzgit_commit() {
#     echo -e "interactive git commit selector"
# }


