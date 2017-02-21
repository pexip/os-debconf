#!/bin/sh
set -e

# Hack around multiple bugs in puic4:
# - can't set the package correctly
# - tries to import a module that no longer exists
# - lower-cases the names of buttons in retranslateui
puic4 WizardUi.ui \
	| sed 's/package Ui_DebconfWizard;/package Debconf::FrontEnd::Kde::Ui_DebconfWizard;/' \
	| sed 's/use Qt3Support4;//' \
	| sed -e 's/bhelp/bHelp/g' -e 's/bback/bBack/g' -e 's/bnext/bNext/g' -e 's/bcancel/bCancel/g' \
	> Ui_DebconfWizard.pm
