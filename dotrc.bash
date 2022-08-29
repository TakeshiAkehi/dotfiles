export DOT_DEBUG=false
export DOT_ROOT=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
export DOT_DIR_SCRIPT=${DOT_ROOT}/dotrc
export DOT_DIR_HELP=${DOT_ROOT}/help
export DOT_DIR_EXT=${DOT_ROOT}/dotrc/extension
export DOT_DIR_CONF=${DOT_ROOT}/dotrc/config
export DOT_SH=$1

if [ "${DOT_SH}" != "bash" ] && [ "${DOT_SH}" != "zsh" ]; then
    echo "please input correct shell"
    exit 1
fi

# check shell license (for sed/history command)
if [ "$(uname)" = 'Darwin' ]; then
  export DOT_OS='Mac'
  export DOT_SH_LIC='BSD'
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
  export DOT_OS='Linux'
  export DOT_SH_LIC='GNU'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# if "${DOT_DEBUG}"; then
#     shopt -s expand_aliases
# fi

__dot::dotrc::dprint(){
    if "${DOT_DEBUG}"; then
        echo "$1"
    fi
}

__dot::dotrc::source(){
    for file in ${DOT_DIR_SCRIPT}/*; do
        if [ -f $file ] ; then
            __dot::dotrc::dprint "source : $file"
            source $file
        fi
    done
}

__dot::dotrc::regisiter_apps(){
    if [ ${DOT_SH} = "bash" ]; then
        local names=`typeset | grep -E "^__dot::app" | __dot::gnu::sed -r 's/^__dot::app::(.*)\s\(\)\s/\1/'`
    fi

    if [ ${DOT_SH} = "zsh" ]; then
        local names=`print -l ${(ok)functions} | grep -E "^__dot::app" | __dot::gnu::sed -r 's/^__dot::app::(.*)/\1/'`
    fi

    for name in `echo -e "${names}"`
    do
        # register alias
        __dot::dotrc::dprint "alias : ${name}."
        local astr=`echo "alias ${name}='__dot::app::${name}'"`
        eval "${astr}"
        # export help file
        __dot::help::${name} > ${DOT_DIR_HELP}/${name}.txt
    done
}

__dot::dotrc::dotrc(){
    __dot::dotrc::dprint "OS : $DOT_OS"
    __dot::dotrc::dprint "LIC : $DOT_SH_LIC"
    __dot::dotrc::source
    __dot::dotrc::regisiter_apps
}

__dot_setup(){
    ln -snfv ${DOT_DIR_CONF}/.vimrc ~
    if [ ${DOT_SH} = "bash" ]; then
        # assuming bash
        git clone https://github.com/b4b4r07/enhancd.git ${DOT_DIR_EXT}/enhancd
        echo "source ${DOT_DIR_EXT}/enhancd/init.sh" >> ~/.bash_profile
        source ~/.bash_profile
        export PS1="\[\033[38;5;11m\]\u@\W\[$(tput sgr0)\]: \[$(tput sgr0)\]\[\033[38;5;45m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\n\\$ \[$(tput sgr0)\]"
        echo "export PS1=\"${PS1}\"" >> ~/.bashrc
        echo "export ENHANCD_HOOK_AFTER_CD=ls" >> ~/.bashrc
    else
        echo "enhancd is supported for only bash"
    fi
}

__dot::dotrc::dotrc
