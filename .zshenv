#
# .zshenv script by <docwhat@uiuc.edu>
#
# $Id: .zshenv,v 1.13 1996/03/05 23:05:18 docwhat Exp $
#
# .zshenv is sourced on all invocations of the
# shell, unless the -f option is set.  It should
# contain commands to set the command search path,
# plus other important environment variables.
# .zshenv should not contain commands that product
# output or assume the shell is attached to a tty.
#
# $Log: .zshenv,v $
# Revision 1.13  1996/03/05  23:05:18  docwhat
# re-adjusted lclint settings
#
# Revision 1.12  1996/03/05  23:00:36  root
# Added LCLint env variables
#
# Revision 1.11  1996/02/28  05:57:40  docwhat
# restructured path setup
#
# Revision 1.10  1996/02/15  04:59:00  docwhat
# Added openwin directory find.
#
# Revision 1.9  1996/02/15  03:52:18  docwhat
# re-ordered search path
#
# Revision 1.8  1996/02/06  07:04:00  docwhat
# Added Povray include line
#
# Revision 1.7  1996/02/04  06:54:33  root
# Added correct color ls setup
#
# Revision 1.6  1996/02/04  01:28:53  root
# Changed Less options
#
# Revision 1.5  1996/02/02  06:25:34  docwhat
# ZSH didn't like ~ vs $HOME
#
# Revision 1.4  1996/02/02  05:57:59  docwhat
# Updated MANPATH and PATH search routines
#
# Revision 1.3  1996/01/18  04:23:21  root
# Updated EDITOR var
#
# Revision 1.2  1996/01/13  21:38:56  docwhat
# Added loging and version control
#
#
unset searchpath

export EDITOR=vi

#
# Locate Motif home directory
#
MotifHome=NotFound
searchpath="/usr/dt /usr/local/lib/Motif-2.0 /usr/lib/Motif-2.0 \
/usr/local/lib/Motif /usr/lib/Motif"
for newpath in ${=searchpath}
do
[[ -d $newpath ]] && MotifHome=$newpath
done
export MotifHome

#
# Locate X11 home directory
#
X11Home=NotFound
searchpath="/usr/openwin /usr/X11R6 /usr/X386 /usr/X11"
for newpath in ${=searchpath}
do
[[ -d $newpath ]] && X11Home=$newpath
done
export X11Home

#
# Locate Openwin home directory
#
OPENWINHOME=NotFound
searchpath="/usr/openwin /usr/local/openwin"
for newpath in ${=searchpath}
do
[[ -d $newpath ]] && OPENWINHOME=$newpath
done
export OPENWINHOME

#
# Locate TeX home Directory
#
TeXHome=NotFound
searchpath="/usr/lib/TeX /usr/local/lib/TeX /usr/lib/teTeX \
/usr/local/lib/teTeX"
for newpath in ${=searchpath}
do
[[ -d $newpath ]] && TeXHome=$newpath
done
export TeXHome

export PATH=""
# Let's set the Paths now...
searchpath="\
/sbin \
/usr/sbin \
/usr/local/sbin \
/bin \
/usr/bin \
/usr/bin/mh \
$MotifHome/bin \
/usr/bin/X11 \
/usr/X11/bin \
/usr/openwin/bin \
/opt/SUNWspro/bin \
/opt/SUNWmfwm/bin \
/usr/openwin/demo \
/usr/ccs/bin \
/usr/scripts \
/usr/local/bin \
/usr/local/bin/pix \
/usr/local/cap \
/usr/local/samba/bin \
/usr/local/bin/ccs \
/usr/local/gnubin \
/usr/games \
/usr/games/bin \
$TeXHome/bin \
$HOME/bin \
$HOME/Scripts \
~jwessel/bin \
~smcmilla/bin \
/usr/ucb \
/usr/ucb/bin \
/usr/bin/sound \
"
for newpath in ${=searchpath}
do
[[ -d $newpath ]] && PATH=$PATH:$newpath
done
export PATH


#
# Hunt down and MANPATH all man directories
#
export MANPATH=""
searchpath="\
/usr/man \
/usr/local/man \
/usr/lang/man \
$X11Home/man \
/usr/openwin/man \
/opt/SUNWspro/man \
/opt/SUNWguide \
/opt/SUNWmfwm/man \
$MotifHome/man \
$TeXHome/man \
$HOME/man \
/export/home/mcnabb/man \
"
for newpath in ${=searchpath}
do
[[ -d $newpath ]] && MANPATH=$MANPATH:$newpath
done
export MANPATH


# 
# For when I've su'ed and screwed up the original files.
#
#if [[ $USERNAME != $USER ]]
#then
#echo "Hmmm...su'ed, eh?"
#export HOME=~$USERNAME
#[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
#[[ -d $HOME/Scripts ]] && PATH=$PATH:$HOME/Scripts
#[[ -d $HOME/man ]] && MANPATH=$MANPATH:$HOME/man
#fi

export PATH MANPATH;

# This sets up the color ls functions, if ls is color...
[[ -x /usr/bin/dircolors ]] || [[ -x /bin/dircolors ]] && eval `dircolors`
alias dir='ls -al'

# Set up the info paths
[[ -d /usr/info ]] && INFODIR=/usr/info
[[ -d /usr/local/info ]] && INFODIR=$INFODIR:/usr/local/info
[[ -d /usr/local/lib/teTeX/info ]] && INFODIR=$INFODIR:/usr/local/lib/teTeX/info
export INFODIR;

# some environment variables
#export MAIL=/usr/spool/mail/$USER
export MAILCALL='NEW MAIL! '
export YOUSAID='In %C you wrote:'
export ATTRIBUTION='%f wrote:'
export LESS='-CMMix3'
export LESSCHARSET=dos
export GSVGAMODE='G320x200x256'
export HELPDIR=/usr/local/lib/zsh/help  # directory for run-help function to find docs


# Find the system mailbox
[[ -d /usr/spool/mail ]] && MAIL=/usr/spool/mail/$LOGNAME
[[ -d /var/spool/mail ]] && MAIL=/var/spool/mail/$LOGNAME
[[ -d /usr/spool/mail/d ]] && MAIL=/usr/spool/mail/d/$LOGNAME
[[ -d /var/mail/d ]] && MAIL=/var/mail/d/$LOGNAME

unset searchpath

# POVray Settings
[[ -d /usr/local/lib/pov ]] && export POVRAYOPT='-l/usr/local/lib/pov/include'

# LCLint's Settings
LARCH_PATH=/usr/lib/lclint; export LARCH_PATH
LCLIMPORTDIR=/usr/lib/lclint/imports; export LCLIMPORT
LCLINT_CPPCMD=/lib/cpp; export LCLINT_CPPCMD


# End of ZSHENV
