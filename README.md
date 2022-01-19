![By Falkor](https://img.shields.io/badge/by-Falkor-blue.svg) [![github](https://img.shields.io/badge/git-github-lightgray.svg)](https://github.com/Falkor/spacemacs-config) [![Issues](https://img.shields.io/badge/issues-github-green.svg)](https://github.com/Falkor/spacemacs-config/issues)

         ______    _ _             _        _____                                                  _____             __ _       
        |  ____|  | | |           ( )      / ____|                                                / ____|           / _(_)      
        | |__ __ _| | | _____  _ __/ ___  | (___  _ __   __ _  ___ ___ _ __ ___   __ _  ___ ___  | |     ___  _ __ | |_ _  __ _
        |  __/ _` | | |/ / _ \| '__| / __|  \___ \| '_ \ / _` |/ __/ _ \ '_ ` _ \ / _` |/ __/ __| | |    / _ \| '_ \|  _| |/ _` |
        | | | (_| | |   < (_) | |   \__ \  ____) | |_) | (_| | (__  __/ | | | | | (_| | (__\__ \ | |____ (_) | | | | | | | (_| |
        |_|  \__,_|_|_|\_\___/|_|   |___/ |_____/| .__/ \__,_|\___\___|_| |_| |_|\__,_|\___|___/  \_____\___/|_| |_|_| |_|\__, |
                                                 | |                                                                       __/ |
                                                 |_|                                                                      |___/
       Copyright (c) 2022 S. Varrette <sebastien.varrette@gmail.com>

Personal settings and customization for [Spacemacs](https://www.spacemacs.org/), the Emacs distribution I'm now using.
See my previous emacs settings: `Falkor/emacs-config2`](https://github.com/Falkor/emacs-config2) for Emacs 24.

## Setup (Mac OS X)

See also [Spacemacs Practicalli](https://practical.li/spacemacs/)

1. Install Emacs (See [emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus) for more information.)

```bash
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
```

2. Clone Spacemacs into your [XDG config directory](https://wiki.archlinux.org/title/XDG_Base_Directory)
   - we'll use the [develop](https://develop.spacemacs.org/) branch

```bash
mkdir .config
git clone https://github.com/syl20bnr/spacemacs ~/.config/spacemacs
cd ~/.config/spacemacs
git checkout develop
```

3. (Optional) Install some nice fonts:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro
```

4. Setup the current repository


```bash
$> mkdir -p ~/git/github.com/Falkor/
$> cd ~/git/github.com/Falkor/
$> git clone git@github.com:Falkor/spacemacs-config.git
```
