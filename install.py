#!/usr/bin/env python3
# coding: utf-8

# Python 2 and 3 compatibility
from __future__ import print_function

import installer

########
# TMUX #
########
tmuxDeps      = ["tmux"]
tmuxSRCFolder = "tmux/"
tmuxDSTFolder = "~/"

#######
# VIM #
#######
vimDeps      = ["vim", "ruby"]
vimSRCFolder = "vim/"
vimDSTFolder = "~/.vim/"

print("\t╔═════════════════════╗")
print("\t║ .terminal installer ║")
print("\t╠═════════════════════╣")
print("\t║ Version 1.0         ║")
print("\t║ 09/16/2018          ║")
print("\t║ Pelloin Valentin    ║")
print("\t╚═════════════════════╝")

tmux = installer.Insaller("tmux", tmuxDeps, tmuxSRCFolder, tmuxDSTFolder)
tmux.install()

vim  = installer.Insaller("vim", vimDeps, vimSRCFolder, vimDSTFolder)
vim.install()
