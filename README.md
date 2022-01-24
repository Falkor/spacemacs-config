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
See my previous emacs settings: [`Falkor/emacs-config2`](https://github.com/Falkor/emacs-config2) for Emacs 24.

This repository hosts also local [spacemacs layers](http://spacemacs.org/doc/LAYERS.html) (see also [explaination on layers](http://www.modernemacs.com/post/migrate-layers/)):

* `savegeometry`: save and restore window position and sie between Emacs launches
* `falkor`: my own customizations


## Setup (Mac OS)

See also [Spacemacs Practicalli](https://practical.li/spacemacs/)

1. Install Emacs (See [emacs-plus](https://github.com/d12frosted/homebrew-emacs-plus) for more information.)

```bash
# Option 1 - emacs-plus - may lead to blinkering windows
brew tap d12frosted/emacs-plus
brew install emacs-plus --with-spacemacs-icon
brew linkapps emacs-plus
# Option 2 - emacs-mac
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac-spacemacs-icon
```

2. Clone Spacemacs into your [XDG emacs directory](https://wiki.archlinux.org/title/XDG_Base_Directory) _i.e_ `~/.config/emacs`
   - we'll use the [develop](https://develop.spacemacs.org/) branch
   - alternatively, you can clone it into the default emacs configuration directory `~/.emacs.d`


```bash
# Default XDG-compliant installation
mkdir .config
git clone https://github.com/syl20bnr/spacemacs ~/.config/spacemacs
# emacs config expected in ~/.config/emacs
ln -s ~/.config/aquamacs  ~/.config/emacs
cd ~/.config/spacemacs
git checkout develop
```


3. You **MUST** clone the current repository into `~/.spacemacs.d`

```bash
git clone https://github.com/Falkor/spacemacs-config.git ~/.spacemacs.d
# Alternative setup (my preferred way)
mkdir -p ~/git/github.com/Falkor/
cd ~/git/github.com/Falkor/
git clone https://github.com/Falkor/spacemacs-config.git
ln -s ~/git/github.com/Falkor/spacemacs-config ~/.spacemacs.d
```

4. (Optional) Install some nice fonts:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro font-meslo-lg-nerd-font
```

You will also need to **disable** a keybord shortcut set by default on Mac OS for the CTRL-SPC sequence.
Go into **System Preferences / Keybord / Shortcuts / Input Source** and uncheck the settings.


## Extra software installation

Just run `make bootstrap`

### Magit

Install [Delta](https://dandavison.github.io/delta/installation.html)

```bash
brew install git-delta
```
