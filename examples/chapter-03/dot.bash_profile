################################################################################
#
# Bash configuration for interactive login shells.
#
# ~/.bash_profile
#
# More info: https://www.librobert.net/book/internet
#
################################################################################
#
# Copyright (c) 2019 Robert LA LAU < https://www.librobert.net/ >
#
# This work is licensed under the Creative Commons Attribution 4.0 International License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/
# or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#
################################################################################
#
# Save this file as .bash_profile in each user's home directory (including root)
# or merge them, if a file of that name already exists.
#
# Also save this file as /usr/share/skel/dot.bash_profile (FreeBSD)
# or /etc/skel/.bash_profile (Linux), or merge them.
#
# See bash(1) for documentation.
#
################################################################################

# Load ~/.bashrc, if that file exists.
[ -f "${HOME}/.bashrc" ] && source "${HOME}/.bashrc"
