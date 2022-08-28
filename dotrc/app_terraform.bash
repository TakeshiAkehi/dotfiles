
__dot::app::fterraform() {
    __dot::exec::interactive "\
tfenv list  (list of installed env)\n\
tfenv use [VERSION] (set version)\n\
tfenv list-remote  (list of install available)\n\
tfenv install [VERSION] (install new version)\n\
terraform workspace list (list of workspace)
terraform workspace new [WORKSPACE] (create new workspace)
terraform workspace select [WORKSPACE]
terraform workspace show (show current workspace name)
terraform get
terraform get -update
terraform graph | dot -Tpdf > graph.pdf (visualize with graphviz)
"
}

__dot::help::fterraform() {
    echo "interactive help for terraform"
}