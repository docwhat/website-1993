#
# .zlogin file by <docwhat@uiuc.edu>
#
# $Id: .zlogin,v 1.4 1996/01/20 19:58:32 docwhat Exp $
#
# .zlogin is sourced in login shells.  It should
# contain commands that should be executed only in
# login shells.  It should be used to set the terminal
# type and run a series of external commands (fortune,
# msgs, from, etc).
#
# $Log: .zlogin,v $
# Revision 1.4  1996/01/20  19:58:32  docwhat
# Cleaned up possibly non-existant files/programs
#
# Revision 1.3  1996/01/20  17:02:29  root
# Changed "---" length
#
# Revision 1.2  1996/01/13  21:38:56  docwhat
# Added loging and version control
#
#

# Do Site Specifc Initializations
[[ -f ~/.zlogin.ext ]] && source ~/.zlogin.ext
clear

#stty dec new cr0 -tabs
stty erase 
ttyctl -f  # freeze the terminal modes... can't change without a ttyctl -u
echo "Hello, Master Höltje! Welcome."
echo "-------------------------------------------------------------"
mesg y
uptime
[[ -x /usr/local/games/pom ]] && /usr/local/games/pom
echo "-------------------------------------------------------------"
[[ -n `which fortune` ]] && fortune
log

# Create notes file if it doesn't exist
if [[ ! -f ~/notes ]]
then
echo '[44m[36m-------------------------------------------------------------------------------' > ~/notes
echo '-------------------------------------------------------------------------------' >> ~/notes
echo '[35m' >> ~/notes ; echo >> ~/notes ; echo '[40m' >> ~/notes
fi

# View notes file
cat ~/notes

[[ -d ~/PrintMe ]] && [[ -n `ls ~/PrintMe/` ]]\
    && echo "  Print Me:" && ls ~/PrintMe/
#msgs -fp
[[ -n `which calendar` ]] && calendar

export XMCD_LIBDIR=/usr/lib/X11/xmcd

#EOF
