# .terminal
Vim, tmux, and other configuration files


## How to install:

Copy and paste this into a terminal:

```shell
mkdir -p ~/git/.terminal &&\
git clone git@github.com:valentinp72/.terminal.git ~/git/.terminal &&\
~/git/.terminal/install.py
```

On your first vim boot, you'll need to install all the plugins. To do that, run :

```shell
vim +PlugInstall # you'll probably see many errors, that's normal, press Enter
```
Wait for all plugins to install, then quit vim.

## How to update:

Copy and paste this into a terminal:

```shell
cd ~/git/.terminal &&\
git pull &&\
cd - &&\
~/git/.terminal/install.py NO_BACKUP
```
Do not forget to install new plugins with `:PlugInstall`.

