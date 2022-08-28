# overview

# requirements
fuzzy filter
```
# brew
brew install fzf
# apt
sudo apt install fzf
# apk
sudo apk add fzf
```

# requirements for mac
mac gnu commands
```
brew install coreutils
brew install gnu-sed
```

# acitvate
```
# setup
cd ~
git clone https://github.com/TakeshiAkehi/dotfiles.git

# .zshrc
echo "source ~/dotfiles/dotrc.bash zsh" >> ~/.zshrc
source ~/.zshrc

# .bashrc
echo "source ~/dotfiles/dotrc.bash bash" >> ~/.bashrc
source ~/.bashrc

# initial setup
#  - this command overwrites .vimrc
__dot_setup
```

for bash setup shortcut 
```
cd ~
git clone https://github.com/TakeshiAkehi/dotfiles.git
bash setup.bash
```


# test environment

```
# build image
make build

# linux/bash test env
make bash

# linuz/zsh test env
#  - there is no test environment for mac/zsh
make zsh

```
