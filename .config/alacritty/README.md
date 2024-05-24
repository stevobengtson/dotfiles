# Setup of Alacritty

## Install Homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Add path on silicon macs (M chips)

`echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile`

## Install Alacritty

`brew install --cask alacritty`

You should also have git installed

`brew install git`

## Install Meslo Nerd Font (or other preferred font)

`brew tap homebrew/cask-fonts`

`brew install font-meslo-lg-nerd-font`

## Configure Alacritty

Check out the repository to the config folder

`git clone https://github.com/stevobengtson/alacritty.git ~/.config/alacritty`

## Install PowerLevel10K command line theme

`brew install powerlevel10k`

`echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc`
