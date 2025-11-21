# Time-stamp: <Tue 2025-11-11 22:00 svarrette>
####################################################################################
# Makefile (configuration file for GNU make - see http://www.gnu.org/software/make/)
#                     __  __       _         __ _ _
#                    |  \/  | __ _| | _____ / _(_) | ___
#                    | |\/| |/ _` | |/ / _ \ |_| | |/ _ \
#                    | |  | | (_| |   <  __/  _| | |  __/
#                    |_|  |_|\__,_|_|\_\___|_| |_|_|\___|
#
####################################################################################
# A generic and modular Makefile piloting a project repository.
# See https://github.com/Falkor/Makefiles for more examples
#
# In particular, to collect .Makefile.venv for python management:
#    wget https://raw.githubusercontent.com/Falkor/Makefiles/refs/heads/devel/venv/.Makefile.venv
# and/or to pilot git[flow] operations:
#    wget https://raw.githubusercontent.com/Falkor/Makefiles/refs/heads/devel/gitflow/.Makefile.git
# and/or to pilot Mkdocs operations:
#    wget https://raw.githubusercontent.com/Falkor/Makefiles/refs/heads/devel/mkdocs/.Makefile.mkdocs
# etc.
#
# **Default action upon 'make'**: see TARGETS
# Usage:
# - Repository management: (from .Makefile.git)
#     make setup
#     make up
#     make start-{major,minor,patch}-version-bump
#     make release
#
# - python venv management (from .Makefile.venv)
#     make setup-python
#     make clean-venv
#
# - Mkdocs management (from .Makefile.mkdocs)
#     make setup-python
#     make clean-venv
#
# - lint operations
#     make lint (shellcheck on scripts etc.)
#
# - cleanup operation
#     make clean
#     make distclean
####################################################################################
SHELL = /bin/bash

# Check commands needed for this Makefile - complete as needed (space separated)
EXECUTABLES = curl
$(foreach exec,$(EXECUTABLES),\
  $(if $(shell command -v $(exec) 2>/dev/null),,$(error "$(exec) not available in PATH")))

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SCRIPTS_DIR := scripts

# XDG Base Directory Specification: https://specifications.freedesktop.org/basedir-spec/
XDG_CACHE_HOME  ?= $(HOME)/.cache
XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME   ?= $(HOME)/.local/share

##################### Main targets #####################
TARGETS = setup
SETUP_TARGETS = setup-xdg
CLEAN_TARGETS =
DISTCLEAN_TARGETS = clean-venv
INFO_TARGETS =

# local hook (before) for 'easy' customization. Ex:
# SETUP_TARGETS += setup-python
# all: $(TARGETS)
ifneq ("$(wildcard .Makefile.local)","")
include .Makefile.local
endif
# As above, but generally meant to be git ignored...
ifneq ("$(wildcard .Makefile.custom)","")
include .Makefile.custom
endif

############### Let's go ##############
.PHONY: all
all: $(TARGETS)

### Specific setup; XDG, python venv
.PHONY: setup-xdg
setup-xdg:
	mkdir -p $(XDG_CONFIG_HOME)
	mkdir -p $(XDG_DATA_HOME)
	mkdir -p $(XDG_CACHE_HOME)


##############################
### Python VENV management ###
##############################
ifneq ("$(wildcard .Makefile.venv)","")
include .Makefile.venv
.PHONY: setup-python
setup-python: setup-python-deps
# SETUP_TARGETS += setup-python
DISTCLEAN_TARGETS += clean-venv
INFO_VENV += info-venv

endif

#######################################
### Git[flow] Repository management ###
#######################################
ifneq ("$(wildcard .Makefile.git)","")
include .Makefile.git
SETUP_TARGETS += setup-gitflow setup-git-submodule
INFO_TARGETS  += info-git info-version
endif

#########################
### MKdocs Management ###
#########################
ifneq ("$(wildcard .Makefile.mkdocs)","")
include .Makefile.mkdocs
DISTCLEAN_TARGETS += clean-doc
endif

############
### Lint ###
############
.PHONY: lint lint-bash
lint: lint-bash
lint-bash:
	shellcheck $(shell find $(SCRIPTS_DIR) -type f)


.PHONY: setup clean distclean info
setup: $(SETUP_TARGETS)
clean: $(CLEAN_TARGETS)
distclean: $(DISTCLEAN_TARGETS)
info: $(INFO_TARGETS)

# local hook (after) to add complementary rules
# extending *_TARGETS variables here won't have the expected effect (use .Makefile.local instead)
ifneq ("$(wildcard .Makefile.after)","")
include .Makefile.after
endif
