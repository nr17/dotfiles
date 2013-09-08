# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

check-ssh-add() {
if [[ `ssh-add -l` != *internal* ]]; then
  echo "no keys added. Adding..."
  ssh-add ~/.ssh/active/current-internal 
  ssh-add ~/.ssh/active/current-external 
  ssh-add ~/.ssh/active/current-deployed 
fi
}

check-ssh-add

keychain ~/.ssh/active/current-internal ~/.ssh/active/current-external ~/.ssh/active/current-deployed
#[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
#[ -f $HOME/.keychain/$HOSTNAME-sh ] && . $HOME/.keychain/$HOSTNAME-sh
#[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && . $HOME/.keychain/$HOSTNAME-sh-gpg
#OR
#ssh-add ~/.ssh/active/current-internal 
#ssh-add ~/.ssh/active/current-external 
#ssh-add ~/.ssh/active/current-deployed 

#source ~/.aliases
source ~/mysetup/cv.sh

P4EDITOR=/usr/bin/vim
P4USER=$USER
P4PORT=rsh:crackpipe ssh -1 -a -c blowfish -l p4ssh -q -x perforce.akamai.com /bin/true
P4CONFIG=.perforce

export LD_LIBRARY_PATH=/home/nirana/sublimePlugins/SublimeClang

#if [ -d /home/nirana/VIEWS/vroot6 ]; then

if [ ! -e /in_chroot ]
then
### Real OS
   export BASE_PATH=NOT_IN_CHROOT_DONT_BUILD
else ### Inside chroot jail
   export PS1='\n[\d \t] \w\n\u@\h (VBE)$ '     
   export PACK_LOCAL_OS='alsi6.stage2.686'
   export BUNDLERFLAGS='--os="alsi6 common"'
fi


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_colored_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# .bashrc

# User specific aliases and functions
# User specific aliases and functions
alias c=clear
alias ll='ls -ltrh'
alias ..='cd ..'
alias ...='cd ../../'


#alias vim='~/bin/vim70/src/vim'
alias gvim='gvim -geometry 80x50'
alias vi=vim

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export ANT_HOME=/root/installers/apache-ant-1.6.5
export JAVA_HOME=/root/installers/jdk1.5.0_11
export PATH=$PATH:.
export PATH=$PATH:/home/nirana/mysetup/:/home/nirana/mysetup/machines

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


#export VIMRUNTIME=/home/nirana/winph/my_tools/vim70/runtime

export HISTFILESIZE=10000
export HISTSIZE=10000

# User specific aliases and functions
alias c=clear
alias ll='ls -ltrh'
alias ..='cd ..'
alias ...='cd ../../'
alias view='cd $SRC_ROOT'
alias rc='source ~/.bashrc'
alias b='vim ~/.bashrc'
alias h='vim ~/help.txt'
alias s='gvim /u4/nirana/akamai/scratch.txt'
alias gvim='UBUNTU_MENUPROXY= gvim'
alias ipt='echo -e "\n.......RAW......\n" && sudo iptables -t raw -L -n -v && echo -e "\n.......MANGLE.......\n" && sudo iptables -t mangle -L -n && echo -e "\n.......NAT......\n" && sudo iptables -t nat -L -n && echo -e "\n.......FILTER......\n" && sudo iptables -L -n -v'
alias pl='cd $SRC_ROOT/sandbox/bigsky/app_acceleration_plugins'
alias aa='cd $SRC_ROOT/app_acc_common/src'
alias cax='cd $SRC_ROOT/app_acc_cax/'
alias cifs='cd $SRC_ROOT/chimera_mod_cifs/src'

#source the cv function
source /home/nirana/mysetup/cv.sh

ulimit -c unlimited
ulimit -s unlimited

xhost +
#echo "setting display to:192.168.116.101:0.0"
#export DISPLAY=192.168.116.101:0.0

#P4 server related settings
export P4DIFF=tkdiff
set bell-style none
