# coding: utf-8

# Python 2 and 3 compatibility
from __future__ import print_function

import os
import sys
import subprocess

from datetime import datetime

CHAR_MSG_UL = "┌"
CHAR_MSG_UR = "┐"
CHAR_MSG_DL = "└"
CHAR_MSG_DR = "┘"
CHAR_MSG_H  = "─"
CHAR_MSG_V  = "│" 

CHAR_MSG_TEXT = "Installing"

BACKUP_F = 'backups/' + datetime.strftime(datetime.now(), '%Y%m%d_%H%M%S')

class Insaller:

	def __init__(self, name, dependencies, srcFolder, dstFolder):
		self.name = name
		self.dependencies = dependencies
		self.srcFolder = self.installerPath(srcFolder)
		self.dstFolder = self.userPath(dstFolder)
		self.bkpFolder = self.installerPath(BACKUP_F + "/" + name + "/")
		self.mkdirs(self.bkpFolder)

	def install(self):
		self.message()
		self.checkDependencies()
		self.mkdirs(self.dstFolder)
		for f in os.listdir(self.srcFolder):
			if self.needsBackup(f):
				self.backup(f)
			os.symlink(self.srcFolder + f, self.dstFolder + f)
		print("\n => Done installing", self.name)

	def programExists(self, progName):
		print("      > Checking ", progName, ":\t", end="", sep="")
		try:
			subprocess.check_output(["which", progName])
			print("OK")
			return True
		except:
			print("NOK")
			return False

	def checkDependencies(self):
		print("  - Checking dependencies:")
		for dep in self.dependencies:
			if not self.programExists(dep): error("\nMissing " + dep + ". Exiting.")

	def mkdirs(self, folder):
		if not os.path.exists(folder):
			os.makedirs(folder)

	def needsBackup(self, file):
		return os.path.exists(self.dstFolder + file)

	def backup(self, file):
		os.rename(self.dstFolder + file, self.bkpFolder + file)

	def installerPath(self, folder):
		return self.userPath(os.path.dirname(os.path.realpath(__file__)) + '/' + folder)

	def userPath(self, folder):
		return os.path.expanduser(folder)

	def message(self):
		txt   = " " + CHAR_MSG_TEXT + " " + self.name + " "
		hBar  = CHAR_MSG_H * len(txt)
		line1 = CHAR_MSG_UL + hBar + CHAR_MSG_UR
		line2 = CHAR_MSG_V + txt + CHAR_MSG_V
		line3 = CHAR_MSG_DL + hBar + CHAR_MSG_DR
		msg   = "\n" + line1 + "\n" + line2 + "\n" + line3
		print(msg)
		print("  -   From:", self.srcFolder)
		print("  -     To:", self.dstFolder)
		print("  - Backup:", self.bkpFolder)

