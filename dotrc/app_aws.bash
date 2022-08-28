
__dot::app::fzaws_profile() {
  local profile=$(aws configure list-profiles | sed "/default/d" | sort | fzf )
  local CMD="export AWS_PROFILE=$profile"
  __dot::exec::exec "${CMD}"
}
__dot::help::fzaws_profile() {
    echo -e "interactive aws profile switch"
}

__dot::app::fzaws() {
  __dot::exec::interactive "\
aws configure --profile [PROFILENAME] (create new config)\n\
"
}
__dot::help::fzaws() {
    echo -e "interactive aws help"
}