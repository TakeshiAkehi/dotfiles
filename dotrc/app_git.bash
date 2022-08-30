__dot::app::fzgit_checkout(){
    TARGET=`git branch $1 | fzf --preview \
    "echo {} | tr -d ' *' | xargs git log --oneline --first-parent --graph --decorate --color=always" \
    | xargs echo | tr -d ' *' `
    CMD="git checkout ${TARGET}"
    __dot::exec::exec "$CMD"
}

__dot::help::fzgit_checkout() {
    echo -e "interactive git checkout\n\
default : only local branches\n\
-r : only remote branches\n\
-a : all branches"
}

__dot::app::fzgit_checkout_commit(){
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

__dot::help::fzgit_checkout_commit() {
    echo -e "interactive git checkouting to commit"
}

# __dot::app::fzgit(){
#     TARGET=`git branch $1 | fzf --preview \
#     "echo {} | tr -d ' *' | xargs git log --oneline --first-parent --graph --decorate --color=always" \
#     | xargs echo | tr -d ' *' `

#     CMD="${TARGET}"
#     __dot::exec::exec "$CMD"
# }

# __dot::help::fzgit() {
#     echo -e "interactive git branch selector\n\
#     example : fzgit  \"git branch -d {}\" "
# }
