# .bashrc


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s extglob
shopt -s histappend

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

export PS1='$(prompt_command)\n'$PS1


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='history -a;echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    PROMPT_COMMAND='history -a'
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
    #alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# EXPORTS
#######################################################

PATH=$PATH:~/bin/:/usr/pkg/bin:/usr/cross-tools-str9/bin:/usr/cross-tools/bin:/var/lib/gems/1.8/bin/:/var/lib/gems/1.9/bin ; export PATH
#export PS1="[\[\033[1;34m\w\[\033[0m]$ "
export EDITOR=/usr/bin/vim
export HISTFILESIZE=8000 # the bash history should save 3000 commands
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.
alias hist='history | grep $1' #Requires one input




# ALIAS'S OF ALL TYPES SHAPES AND FORMS ;)
#######################################################

# Alias's to local workstations

# ALIAS TO REMOTE SERVERS
# My server info removed from above for obvious reasons ;)

# Alias's to TN5250 programs. AS400 access commands.
alias d1='xt5250 env.TERM = IBM-3477-FC env.DEVNAME=D1 192.168.2.5 &'
alias d2='xt5250 env.TERM = IBM-3477-FC env.DEVNAME=D2 192.168.2.5 &'
alias tn5250j='nohup java -jar /home/crouse/tn5250j/lib/tn5250j.jar 2>>error.log &'


# Alias's to control hardware
alias scan='scanimage -L'

# Alias's to modified commands
alias ps='ps auxf'
alias home='cd ~'
alias pg='ps aux | grep'  #requires an argument
alias un='tar -zxvf'
alias mountedinfo='df -hT'
alias ping='ping -c 10'
alias openports='netstat -nape --inet'
alias ns='netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'
alias du1='du -h --max-depth=1'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias ebrc='pico ~/.bashrc'

# Alias to multiple ls commands
alias la='ls -Al'               # show hidden files
alias ls='ls -aF' # add colors and file type extensions
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'      # sort by change time
alias lu='ls -lur'      # sort by access time
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al |more'         # pipe through 'more'

# Alias chmod commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

# Alias Shortcuts to graphical programs.

# Alias xterm and aterm
alias term='xterm -bg AntiqueWhite -fg Black &'
alias termb='xterm -bg AntiqueWhite -fg NavyBlue &'
alias termg='xterm -bg AntiqueWhite -fg OliveDrab &'
alias termr='xterm -bg AntiqueWhite -fg DarkRed &'
alias aterm='aterm -ls -fg gray -bg black'
alias xtop='xterm -fn 6x13 -bg LightSlateGray -fg black -e top &'
alias xsu='xterm -fn 7x14 -bg DarkOrange4 -fg white -e su &'

# Alias for lynx web browser
alias bbc='lynx -term=vt100 http://news.bbc.co.uk/text_only.stm'
alias dmregister='lynx -term=vt100 http://desmoinesregister.com'

function cgrep () { egrep -RnH --include=*.{h,c,cpp} -e "$1" *; }


# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS=-FGRX

# SOME OF MY UNUSED ALIAS's
#######################################################

# alias d=`echo "Good Morning Dave. today's date is" | festival --tts; date +'%A %B %e' | festival --tts`
# alias shrink84='/home/crouse/shrink84/shrink84.sh'
# alias tl='tail -f /var/log/apache/access.log'
# alias te='tail -f /var/log/apache/error.log'


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

# scpsend ()
# {
# scp -P PORTNUMBERHERE "$@"
# USERNAME@YOURWEBSITE.com:/var/www/html/pathtodirectoryonremoteserver/;
# }


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
#for i in `seq 1 15` ; do spin; done ;echo -ne "${WHITE} USA Linux Users
#Group ${NC}"; for i in `seq 1 15` ; do spin; done ;echo "";
echo -e ${LIGHTBLUE}`cat /etc/SUSE-release` ;
echo -e "Kernel Information: " `uname -smr`;
echo -e ${LIGHTBLUE}`bash --version`;echo ""
echo -ne "Hello $USER today is "; date
echo -e "${WHITE}"; cal ; echo "";
echo -ne "${CYAN}";netinfo;
mountedinfo ; echo ""
echo -ne "${LIGHTBLUE}Uptime for this computer is ";uptime | awk /'up/
{print $3,$4}'
#for i in `seq 1 15` ; do spin; done ;echo -ne "${WHITE} http://usalug.org
#${NC}"; for i in `seq 1 15` ; do spin; done ;echo "";
echo ""; echo ""










export CLICOLOR=exfxcxdxbxegedabagacad
alias cupq="cvs up 2>&1 |  egrep -hi '^[CM]'"
echo -e $GREEN

function convtags() { cp tags tags.uni ;  iconv -c -t WINDOWS-1251//IGNORE tags.uni > tags ; }
if [[ -s /home/chrisf/.rvm/scripts/rvm ]] ; then source /home/chrisf/.rvm/scripts/rvm ; fi


