# .terminal
Vim, tmux, and other configuration files

## Requirements

- `git`
- `vim`
- `tmux`
- `zsh`
- `python3`
- for vim [fuzzy find](https://github.com/junegunn/fzf.vim):
	- [fzf](https://github.com/junegunn/fzf#installation)
	- [the silver searcher](https://github.com/ggreer/the_silver_searcher)
	- [bat](https://github.com/sharkdp/bat#installation) (for syntax highlighting)

## How to install:

Copy and paste this into a terminal:

```bash
mkdir -p ~/git/.terminal &&\
git clone git@github.com:valentinp72/.terminal.git ~/git/.terminal &&\
~/git/.terminal/install.py
```

On your first vim boot, you'll need to install all the plugins. To do that, run :

```bash
vim +PlugInstall # you'll probably see many errors, that's normal, press Enter
```
Wait for all plugins to install, then quit vim.

## How to update:

Copy and paste this into a terminal:

```bash
cd ~/git/.terminal &&\
git pull &&\
cd - &&\
~/git/.terminal/install.py NO_BACKUP
```
Do not forget to install new plugins with `:PlugInstall`.

## ZSH, oh-my-zsh

1. ZSH should be installed

2. Install ohmyzsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. Install plugins
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

4. A sample `.zshrc` is available in `zsh/.zshrc`
