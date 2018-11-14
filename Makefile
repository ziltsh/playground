#
# Makefile for github respository playground
# $Id$

MAKEFLAGS = 
#MAKEFLAGS = -s

INSTALL = /usr/bin/install
I_OPT   = -p

PKG     = playground
DESTDIR = debian
# from the environment, hopefully the users homedir
HOMEDIR = ${DESTDIR}${HOME}
AVAILABLE_DIR =	${HOMEDIR}/.bashrc-avail.d
ENABLED_DIR =		${HOMEDIR}/.bashrc-enabled.d

default:
	make -s usage
.PHONY: default

i: install
install: install_dir install_file
install_dir:
	-${INSTALL} ${I_OPT} -m 0750 -d ${DESTDIR}
	-${INSTALL} ${I_OPT} -d ${HOMEDIR}
	${INSTALL} ${I_OPT} -m 0750 -d ${AVAILABLE_DIR}
install_file:
	${INSTALL} bashrc.common ${HOMEDIR}/.bashrc.common
	${INSTALL} avail.d/bak ${AVAILABLE_DIR}/bak
	${INSTALL} avail.d/cvs ${AVAILABLE_DIR}/cvs
	${INSTALL} avail.d/ssh-agent ${AVAILABLE_DIR}/ssh-agent
	${INSTALL} avail.d/zz-tmux-list-sessions ${AVAILABLE_DIR}/zz-tmux-list-sessions
	make -s install_instructions printtree
.PHONY: i install install_dir install_file

u: uninstall
uninstall: uninstall_file uninstall_dir
	make -s printtree
uninstall_dir:
	-rmdir ${AVAILABLE_DIR}
uninstall_file:
	rm -fv ${HOMEDIR}/.bashrc.common
	rm -fv ${AVAILABLE_DIR}/bak
	rm -fv ${AVAILABLE_DIR}/cvs
	rm -fv ${AVAILABLE_DIR}/ssh-agent
	rm -fv ${AVAILABLE_DIR}/zz-tmux-list-sessions
.PHONY: u uninstall uninstall_dir uninstall_file


#homedir:
#	printf "# homedir: %s\n" "${HOMEDIR}"
#.PHONY: homedir

install_instructions:
	printf "+ hook-up to the ~/.bashrc script with:\n"
	printf "\n   [ -r ~/.bashrc.common] && . ~/.bashrc.common\n\n"
.PHONY: install_instructions

uninstall_instructions:
	printf "+ comment out in ~/.bashrc\n"
	printf "\n#   [ -r ~/.bashrc.common] && . ~/.bashrc.common\n\n"
.PHONY: uninstall_instructions

printtree:
	printf "+ instal tree:\n"
	#find ./${DESTDIR} -ls
	find ./${HOMEDIR} -ls
.PHONY: printtree

usage:
	printf "\n"
	printf "  Usage: make [-s] {default|usage}\n"
	printf "                   {install|uninstall}\n"
	printf "                   {printtree}\n"
	printf "\n"
.PHONY: usage


#.
