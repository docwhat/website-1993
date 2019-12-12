#
# .zshrc file by <docwhat@uiuc.edu>
#
# $Id: .zshrc,v 1.10 1996/02/11 08:35:18 docwhat Exp $
#
# .zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# $Log: .zshrc,v $
# Revision 1.10  1996/02/11  08:35:18  docwhat
# Removed globcomplete option
#
# Revision 1.9  1996/02/04  06:54:33  root
# Added correct color ls setup
#
# Revision 1.8  1996/02/04  01:29:24  root
# Changed ls alias
#
# Revision 1.7  1996/02/02  06:00:01  docwhat
# Turned off beeping altogether
#
# Revision 1.6  1996/02/02  05:59:15  docwhat
# typo
#
# Revision 1.5  1996/02/02  05:57:59  docwhat
# Changed some setopts
#
# Revision 1.4  1996/01/21  07:04:36  docwhat
# Updated Completion for chown,write,ytalk
#
# Revision 1.3  1996/01/20  19:58:32  docwhat
# Added some simple completion control
# made 'make' noncorrecting
#
# Revision 1.2  1996/01/13  21:38:56  docwhat
# Added loging and version control
#
#

# search path for the cd command
cdpath=(. .. ~ ~/src)

# where to look for function definitions
fpath=(~/.zfunc)

# use hard limits, except for a smaller stack and no core dumps
rehash -f
unlimit
limit stack 8192
limit core 0
# It seems broken
# limit -s

umask 022

################
# set up aliases
################

### Standard Shell aliases
alias mv='nocorrect mv -i'    # no spelling correction on mv
alias cp='nocorrect cp -i'    # no spelling correction on cp
alias make='nocorrect make'
alias md=mkdir
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias grep=egrep
alias ll='ls -l'
alias la='ls -a'
alias z=suspend
alias zmore='zless'
alias md='mkdir'
alias rd='rmdir'
alias cp='cp -i'
alias fl='find | grep'

alias a:\='cd /mount/fd0'
alias b:\='cd /mount/fd1'

if [[ $USERNAME = "root" ]]
then
# Usefull for root only.
alias -- halt='shutdown -h now'
alias reboot='shutdown -r now'

alias -- ls0='m0; ls -s /mount/fd0; u0'
alias -- ls0d='m0d; ls -s /mount/fd0; u0'
alias -- ls0m='m0m; ls -s /mount/fd0; u0'
alias -- ls0u='m0u; ls -s /mount/fd0; u0'
alias -- ls1='m1; ls -s /mount/fd1; u1'
alias -- ls1d='m1d; ls -s /mount/fd1; u1'
alias -- ls1m='m1m; ls -s /mount/fd1; u1'
alias -- ls1u='m1u; ls -s /mount/fd1; u1'
alias -- lscd='mcd; ls -s /mount/cdrom; ucd'
alias -- lscdd='mcdd; ls -s /mount/cdrom; ucd'
alias -- lscde='mcde; ls -s /mount/cdrom; ucd'
alias -- lscdm='mcdn; ls -s /mount/cdrom; ucd'
alias -- lscdu='mcdu; ls -s /mount/cdrom; ucd'
alias -- m0='mount /dev/fd0'
alias -- m0d='mount -t msdos /dev/fd0 /mount/fd0'
alias -- m0m='mount /dev/fd0 /mount/fd0'
alias -- m0u='mount -t umsdos /dev/fd0 /mount/fd0'
alias -- m1='mount /dev/fd1'
alias -- m1d='mount -t msdos /dev/fd1 /mount/fd1'
alias -- m1m='mount -t minix /dev/fd1 /mount/fd1'
alias -- m1u='mount -t umsdos /dev/fd1 /mount/fd1'
alias -- mcd='mount /dev/scd0'
alias -- mcdd='mount -t msdos /dev/scd0 /mount/cdrom'
alias -- mcde='mount -t ext2 /dev/scd0 /mount/cdrom'
alias -- mcdm='mount -t minix /dev/scd0 /mount/cdrom'
alias -- mcdu='mount -t umsdos /dev/scd0 /mount/cdrom'
alias -- u0='umount /dev/fd0'
alias -- u1='umount /dev/fd1'
alias -- ucd='umount /dev/scd0'
fi

#Ranma Specific Aliases
alias -- encap='a2ps -2 -nd -nL -nc -nf -nH -nP -Xletter'
alias -- imake='imake -I/usr/lib/X11/config/'
alias -- mod='tracker -mix 24 -tolerant -verbose'


# Aliases to machines
alias -- crane='telnet crane.cso.uiuc.edu'
alias -- students='telnet students.cso.uiuc.edu'
alias -- balrog='telnet balrog.itek.net'


# shell functions
setenv() { export $1=$2 }  # csh compatibility
clean() {
foreach FILE ( (*~|*.bak|core|\#*\#) )
  rm $FILE
end
}
ccd () { cd `xd $*` }
ff () { grep $* /.find.file }
pdir () { ls -alF $* | less -ri }
pls () { ls -CF $* | less -ri }

# bigger shell functions to autoload
autoload zed
autoload run-help

# global aliases
#alias -g 'GF'='| fgrep -f ~/.friends' G='| grep' M='| less' cex='/u/pup/centrex'

# filename completion suffixes to ignore
fignore=(.o .c~ .old -)

# hosts to use for completion
hosts=($HOST uiarchive.cso.uiuc.edu prep.ai.mit.edu wuarchive.wustl.edu gatekeeper.dec.com)

# set prompts
#PROMPT='%m%# '    # default prompt
#RPROMPT=' %~'     # prompt for right side of screen

export PROMPT='%B%{[36m%}%m,%b%{[36m%} %t %w> %b'
export RPROMPT=" %{[36m%}$USERNAME:%{[32m%}%~%b"

MAILCHECK=300
HISTSIZE=300
DIRSTACKSIZE=30

# set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   sunkeyboardhack correctall autocd longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
setopt   ignoreeof appendhistory autonamedirs listtypes
setopt   hashcmds hashdirs histnostore nobeep
setopt   nohistbeep pathdirs printexitvalue pushdignoredups
unsetopt bgnice

# watch for my friends
[[ -f ~/.friends ]] && watch=($(cat ~/.friends))
#watch=($(cat ~/.mon | grep -v '#'))

#WATCHFMT='%n %a %l from %m at %t.'
WATCHFMT='%B[32m%n%b %a %l from %M at %t.'

#LOGCHECK=0
LOGCHECK=10

#unhash p

# some nice bindings
#bindkey '^X^Z' universal-argument ' ' magic-space
#bindkey '^X^A' vi-find-prev-char-skip
#bindkey '^Z' accept-and-hold
#bindkey -s '\M-/' \\\\
#bindkey -s '\M-=' \|

bindkey -e       # emacs key bindings
# bindkey -v       # vi key bindings

# Completion control stuff
compctl -r disown
compctl -u chown write ytalk
[[ -f /etc/ftpsites ]] && FTP=/etc/ftpsites 
[[ -f ~/.ftpsites ]] && FTP="$FTP ~/.ftpsites"
compctl -s '`cat $FTP`' ftp ncftp

[[ -f /etc/telnetsites ]] && TELNET=/etc/telnetsites
[[ -f ~/.telnetsites ]] && TELNET="$TELNET ~/.telnetsites"
compctl -s '`cat $TELNET`' telnet rlogin

unset FTP TELNET

# Set up XWindows stuff :)
if [[ $TERM = "xterm" ]]
then
~/.zfunc/xtitle -t "$USERNAME@$HOST: $PWD"
function chpwd () {
  ~/.zfunc/xtitle -t "$USERNAME@$HOST: $PWD"
}
RPROMPT=' %~'
fi

# Do Site Specifc Initializations
[[ -f ~/.zshrc.ext ]] && source ~/.zshrc.ext

# End Of ZSHRC
