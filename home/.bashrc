# .bashrc
if [ $(expr index "$-" i) -eq 0 ]; then
    return
fi


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.custom.comp ]; then
	. ~/.custom.comp
fi

# export TERM=xterm-256color
export TERM=screen-256color
#if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then                         
#    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')                  
#fi
# Define a few Color's
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color
# Sample Command using color: echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"


# If not running interactively, don't do anything

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
force_colored_prompt=yes

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

function hbar()
{
    eval printf '%.0s$2' {1..$1}
}
function prompt_command()
{
    local sv=$?
    local cols=`tput cols`
    hbar $[ $cols - 5 ] "_"
    printf "% 3d" $sv
}

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'
export PS1='$(prompt_command)\n'$PS1

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    # PROMPT_COMMAND='history -a;history -c;history -r;echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

if [ -f $HOME/.bashrc.local ]; then
    . $HOME/.bashrc.local 
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /usr/local/bin/aws_completer ]; then
    . /usr/local/bin/aws_completer
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
        source /usr/local/share/bash-completion/bash_completion.sh

if [ -f  ~/.hg/bash_completion ]; then
    source ~/.hg/bash_completion
fi

if [ -f  ~/.pip/bash_completion ]; then
    source ~/.pip/bash_completion
fi


if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/vagrant ]; then
. $(brew --prefix)/etc/bash_completion.d/vagrant
fi

# EXPORTS
#######################################################

PATH=/opt/local/bin:/usr/local/bin/usr/local/share/python@2:~/Library/Python/2.7/bin:~/bin/:~/.local/bin/:/usr/local/sbin:$PATH export PATH
#export PS1="[\[\033[1;34m\w\[\033[0m]$ "
export EDITOR=`which vim`
function  hgrep() { history | grep -P -- "$*"; } #Requires one input
bind 'C-r:reverse-search-history'
alias tree='tree -C'
alias pstree='pstree -g3'




# SOME OF MY UNUSED ALIAS's
#######################################################

# SPECIAL FUNCTIONS
#######################################################

netinfo()
{
    echo "--------------- Network Information ---------------"
    /sbin/ifconfig | awk /'inet addr/ {print $2}'
    echo ""
    /sbin/ifconfig | awk /'Bcast/ {print $3}'
    echo ""
    /sbin/ifconfig | awk /'inet addr/ {print $4}'

    /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
    echo "---------------------------------------------------"
}

spin ()
{
echo -ne "${RED}-"
echo -ne "${WHITE}\b|"
echo -ne "${BLUE}\bx"
sleep .02
echo -ne "${RED}\b+${NC}"
}

# NOTES
#######################################################

# To temporarily bypass an alias, we preceed the command with a \
# EG:  the ls command is aliased, but to use the normal ls command you would
# type \ls

# mount -o loop /home/crouse/NAMEOFISO.iso /home/crouse/ISOMOUNTDIR/
# umount /home/crouse/NAMEOFISO.iso
# Both commands done as root only.


# WELCOME SCREEN
#######################################################

clear
#Group ${NC}"; for i in `seq 1 15` ; do spin; done ;echo "";
echo -e "Kernel Information: " `uname -smr`;
echo -e ${LIGHTBLUE}`bash --version`;echo ""
echo -ne "Hello $USER today is "; date
echo -e "${WHITE}"; cal ; echo "";
echo -ne "${CYAN}";netinfo;
mountedinfo ; echo ""
echo -ne "${LIGHTBLUE}Uptime for this computer is ";uptime | awk /'up/
{print $3,$4}'
echo ""; echo ""
echo -e "${WHITE}" 

export CLICOLOR=exfxcxdxbxegedabagacad

function convtags() { cp tags tags.uni ;  iconv -c -t WINDOWS-1251//IGNORE tags.uni > tags ; }
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
if [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] ; then source $HOME/.tmuxinator/scripts/tmuxinator ; fi

# . tmuxinator_completion
export WORKON_HOME=$HOME/Envs
#export WORKON_HOME=/tmp/foo/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
   source /usr/local/bin/virtualenvwrapper.sh
else
   echo "WARNING: Can't find virtualenvwrapper.sh"
fi


export GOPATH=$HOME/work
PATH=/usr/local/go/bin:$HOME/.rvm/bin:$PATH:$GOPATH/bin # Add RVM to PATH for scripting
export PATH
alias android-connect='mtpfs -o allow_other /media/nexus10 ' 
alias android-disconnect='fusermount -u /media/nexus10'

export SELECTA_IGNORE='(.*node_modules.*)|(.*.git.*)|(.*.hg.*)'

alias tmxs='tmux attach -t `tmux ls | selecta | cut -f1 -d:`'
alias vims='vim `find . -type f | grep -v "^\./\."  | selecta`'
alias kills='kill `ps aux | selecta | awk '"'"'{print $2 }'"'"'`'

function ffiles() {
       find . -name \* -print | selecta
}
function greps(){
       grep -lr $1 ./* | selecta
}

function history_selecta() {
    tmpfile=(mktemp /tmp/history_selecta.XXXX)
    history | selecta > $tmpfile
    $(cat $tmpfile)
    rm $tmpfile
}


export NVM_DIR="/home/chrisf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
