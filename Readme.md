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
git clone

# .zshrc
echo "source ~/dotfiles/dotrc.bash zsh" >> ~/.zshrc
source ~/.zshrc
__dot_setup zsh

# .bashrc
echo "source ~/dotfiles/dotrc.bash bash" >> ~/.bashrc
source ~/.bashrc
__dot_setup bash

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
