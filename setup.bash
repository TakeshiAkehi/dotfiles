CDIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)`

source ${CDIR}/dotrc.bash
__dot_setup

echo "source ${CDIR}/dotrc.bash bash" >> ~/.bashrc
source ~/.bashrc
