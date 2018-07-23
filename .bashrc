# .bashrc
export INPUTRC=~/.inputrc
export SHELL=`which bash`

. $HOME/.colours.sh

if [ -f ~/.bash_completion ]; then
	. ~/.bash_completion
fi

# A VERY good umask
umask 022 022

export LC_ALL=en_US

export EDITOR=vim
# DEV env vars
export DEV_ROOT="$HOME/dev"

export PERLIO=stdio
# default to using the DEV $PERL5LIB ENV var

# User specific environment and startup programs
export TERMINFO='/usr/share/terminfo/x/xterm-256color'
export TERM=xterm-256color
export BASH_ENV=$HOME/.bashrc
#export TZ='America/Montreal'
# misc. variables
export PAGER="less"
export MANPAGER="less"
export MANPATH=$MANPATH:$EPS_UTILS_TRUNK/src/docs:$SPG_UTILS_TRUNK/src/docs
export PATH=/ms/dist/sec/PROJ/kwrap/prod/bin:/usr/bin:$HOME/.vim/bin:$HOME/bin:$HOME/scripts:$PATH
export PATH=$PATH:/sbin:/ms/dist/unixops/PROJ/rmc/incr/bin:$HOME/treadmill/support
export PATH=$PATH:/ms/dist/syb/dba/scripts/shl:/ms/dist/perl5/PROJ/MSDW-MDP/prod/bin:/opt/mqm/bin
export PATH=$PATH:$HOME/dev/virtual.vto/virtual/vto/master/src/bin://ms/dist/fsf/PROJ/tree/1.5.1/bin
export PATH=$PATH://ms/dist/fsf/PROJ/htop/1.0.3/bin:/usr/sbin
export PATH=$PATH://ms/dist/python/PROJ/setuptools/9.1-py27-64/bin
export PATH=$PATH:/ms/dist/fsf/PROJ/rrdtool/1.5.6-0/bin

# Perforce export P4CLIENT=boureric
export P4EDITOR='vim -X'
# Colours
. $HOME/.colours.sh

export CURR_TTY=$(temp=$(tty) ; echo ${temp:5})
PS1="$RED.:$WHITE\w$RED:.\n\
$LIGHT_GRAY\u$LIGHT_GRAY@$LIGHT_GRAY\h"

source ~/.git-completion.sh
source ~/.git-prompt.sh

export GIT_PS1='$(if [[ $PWD == *"v/global"* ]] || [[ $PWD == *"nfs"* ]]; then \
    echo ""; \
else \
    git branch > /dev/null 2>&1 ;\
    if [ $? -eq 0 ]; then \
      echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
      if [ "$?" -eq "0" ]; then \
        echo "'$GREEN'"$(__git_ps1 " (%s)"); \
      else \
        echo "'$IRED'"$(__git_ps1 " {%s}"); \
      fi)"; \
    fi \
fi)'

export PS1="${PS1}$GIT_PS1 \`if [ \$? = 0 ]; then echo '${GREEN}$'; else echo '${RED}$'; fi\`${NO_COLOUR} "

# export LS_COLORS=$'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'
export LS_COLORS=$'no=00:fi=00:di=00;34:ln=00;35:pi=40;33:so=00;32:bd=40;33;01:cd=40;33;01:or=01;37;41:mi=01;37;41:ex=00;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:'

alias ebash='vim -X ~/.bashrc'
# Application shortcuts
alias vim="vim -X -u ~/.vimrc"
alias vima='vim -X `find -type f|sort`'
alias vimp='vim -X `find -type f -name "*py"|sort`'
alias perlmake='perl Makefile.PL'
alias vncsshgate='ssh -L 5902:198.96.34.109:5901 198.96.34.109'
alias imap='imapfilter -c /home/erick/.imapfilter/config.lua -v'

alias dp='display'
# System program shortcuts
alias grep='grep --color=auto'
alias l='ls --color=auto -F'
alias ls='ls --color=auto -F'
alias ll='ls --color=auto -al'
alias llr='ls --color=auto -alrt'
alias lsl='ls --color=auto -al'
alias lc='rename.pl -vr "y/A-Z/a-z/;s/ /_/g"'
alias ctar='tar cvjf'
alias ctarg='tar cvzf'
alias utar='tar xvjf'
alias utarg='tar xvzf'
alias ex='exit'
alias cl='clear'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias ping='ping -c 1'
alias pinggo='ping -c 1 google.ca'
alias pingg='ping -c 1 gate'
alias cpd='cp -R'
alias h='history'
alias build='autoheader && aclocal && automake --add-missing --copy && autoconf'
alias xterm='xterm -bg black -fg'
alias so='. ~/.bashrc'
alias ltop='while (( 1 ))
	do
		sleep 1;
		top | grep pnl_
		exit="$?"
		date
		if [ $exit != 0 ]; then
			break
		fi
		echo "--"
	done'

alias dev="cd $DEV_ROOT"
alias ddl="cd $DEV_ROOT/ddl"

# Git
alias dig='/usr/bin/dig'
alias gita='git add'
alias gitb='git branch'
alias gitc='git commit'
alias gits='git status'
alias gg='git grep'
alias gitp='git pull'
alias gitcm='git checkout master'
alias gitcd='git checkout devel'
alias gitcn='git checkout next'
alias gitc2='git checkout rel-2'

alias tmux='tmux -2 -u'

alias psf="ps faux|perl -ne'use Term::ANSIColor qw(:constants);
    @_=split(/\s+/);
    \$line = \$_;
    \$cpu = \$_[2];
    \$mem = \$_[3];
    if ( \$mem < 1 || \$cpu < 1 ) { print \$line }
    if ( (\$mem >= 1 && \$mem < 2) || (\$cpu >= 1 && \$cpu < 2) ) { print YELLOW,\$line,RESET }
    if ( \$mem >= 2 || \$cpu >= 2 ) { print WHITE,ON_RED,\$line,RESET }'"

alias cprocs="ps aux|perl -ne '@_=split(/\s+/);print \$_ if \$_[2] > 2;'"
alias mprocs="ps aux|perl -ne '@_=split(/\s+/);print \$_ if \$_[3] > 2;'"

export HISTSIZE=5000
export HISTFILESIZE=10000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s no_empty_cmd_completion
set -o vi
shopt -s histappend
# must be last or we get everything up until this line
set -o history
