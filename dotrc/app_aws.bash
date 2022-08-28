
__dot::app::faws_profile() {
  local profile=$(aws configure list-profiles | sed "/default/d" | sort | fzf )
  local CMD="export AWS_PROFILE=$profile"
  __dot::exec::exec "${CMD}"
}
__dot::help::faws_profile() {
    echo -e "interactive aws profile switch"
}

__dot::app::faws() {
  __inthelp__ "\
aws configure --profile [PROFILENAME] (create new config)\n\
"
}
__dot::help::faws() {
    echo -e "interactive aws help"
}