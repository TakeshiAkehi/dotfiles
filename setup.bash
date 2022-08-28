CDIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

source ${CDIR}/dotrc.bash bash
__dot_setup bash

echo "source ${CDIR}/dotrc.bash bash" >> ~/.bashrc
source ~/.bashrc
