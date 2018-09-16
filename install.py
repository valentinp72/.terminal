#!/usr/bin/env python
# coding: utf-8
# Python 2 and 3 compatibility
from __future__ import print_function

import os
import sys
import subprocess

########
# TMUX #
########
tmuxDependencies = ["tmux"]
tmuxSourceFolder = "tmux"
tmuxOutputFolder = "~/"
tmuxFiles        = [".tmux.conf"]

#######
# VIM #
#######
vimDependencies = ["nvim", "ruby"]
vimSourceFolder = "nvim"
vimOutputFolder = ""
vimFiles        = ""

print("\t╔═════════════════════╗")
print("\t║ .terminal installer ║")
print("\t╠═════════════════════╣")
print("\t║ Version 1.0         ║")
print("\t║ 09/16/2018          ║")
print("\t║ Pelloin Valentin    ║")
print("\t╚═════════════════════╝")
print("")

def programExists(progName):
	try:
		subprocess.check_output(["which", progName])
		return True
	except:
		return False

def programExistsVerbose(progName):
	print("  > Checking ", progName, ":\t", end="", sep="")
	if programExists(progName):
		print("OK")
		return True
	else:
		print("NOK")
		return False

def checkAllDependencies(deps):
	for dep in deps:
		if not programExistsVerbose(dep): error("\nMissing " + dep + ". Exiting.") 

def error(message):
	print(message)
	sys.exit()

def tmuxInstaller():
	print("┌─────────────────┐")
	print("│ Installing tmux │")
	print("└─────────────────┘")
	checkAllDependencies(tmuxDependencies)

def vimInstaller():
	print("┌─────────────────┐")
	print("│ Installing vim  │")
	print("└─────────────────┘")
	checkAllDependencies(vimDependencies)

tmuxInstaller()
vimInstaller()
