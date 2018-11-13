#
# Makefile for github respository playground
# $Id$

MAKEFLAGS = 
#MAKEFLAGS = -s

INSTALL = /usr/bin/install
I_OPT   = -p

PKG     = playground
DESTDIR = debian
HOMEDIR = ${HOMEDIR}

default:
	make -s usage
.PHONY: default

usage:
	printf "\n"
	printf "  Usage: make [-s] {default|usage}\n"
	printf "\n"



#.
