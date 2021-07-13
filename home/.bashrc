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

export TERM=xterm-256color
# export TERM=screen-256color
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

PATH="$PATH:${HOME}/git/chromium/depot_tools"
PATH=/opt/local/bin:/usr/local/bin/usr/local/share/python@2:~/Library/Python/2.7/bin:~/bin/:~/.local/bin/:/usr/local/sbin:$PATH export PATH
#export PS1="[\[\033[1;34m\w\[\033[0m]$ "
export EDITOR=`which vim`
function  hgrep() { history | grep -P -- "$*"; } #Requires one input
bind 'C-r:reverse-search-history'
alias tree='tree -C'
alias pstree='pstree -g3'
alias vim='nvim'




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

export HISTSIZE=-1 
export HISTFILESIZE=-1
export GOPATH=$HOME/work
PATH=/usr/local/go/bin:$HOME/.rvm/bin:$PATH:$GOPATH/bin # Add RVM to PATH for scripting
export PATH
alias android-connect='mtpfs -o allow_other /media/nexus10 ' 
alias android-disconnect='fusermount -u /media/nexus10'

export SELECTA_IGNORE='(.*node_modules.*)|(.*.git.*)|(.*.hg.*)'

alias tmxs='tmux attach -t `tmux ls | selecta | cut -f1 -d:`'
alias vims='vim `find . -type f | grep -v "^\./\."  | selecta`'
alias kills='kill `ps aux | selecta | awk '"'"'{print $2 }'"'"'`'

# Will return non-zero status if the current directory is not managed by git
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

gb() {
  is_in_git_repo || return
  # git branch -a --color=always | grep -v '/HEAD\s' | sort |
  git for-each-ref --sort=committerdate refs/heads/ | 
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}


# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# frm - remove selected file
frm() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && rm "$file"
}

# fea - search hidden files and open matching in vim
fea() {
  local file
  file=$(ag -l --hidden -g "" | fzf --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fd - cd to selected directory
cdd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fkill - kill process
fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# fbs - get branch/tag name
fbs() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf --ansi +m -d "\t" -n 2) || return
  echo "$target" | awk '{print $2}'
}

# fco - checkout git branch/tag
fco() {
  git checkout $(fbs)
}

# gbs - open selected branch in tig
gbs() {
  tig $(fbs)
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s -m --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# fcoc - checkout git commit
fcoc() {
  git checkout $(fcs)
}

# gcs - open selected commit in tig
gcs() {
  tig show $(fcs)
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
    while out=$(
      git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
      fzf --ansi --no-sort --query="$q" --print-query \
          --expect=ctrl-d,ctrl-b);
    do
      q=$(head -1 <<< "$out")
      k=$(head -2 <<< "$out" | tail -1)
      sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
      [ -z "$sha" ] && continue
      if [ "$k" = 'ctrl-d' ]; then
        git diff $sha
      elif [ "$k" = 'ctrl-b' ]; then
        git stash branch "stash-$sha" $sha
        break;
      else
        git stash show -p $sha
      fi
    done
}

# Run single test from rails application
ftest() {
  local file
  file=$(
    git ls-files test/ |
    grep -v '\(factories\|fixtures\|test_helper\|gitkeep\)' |
    fzf --query="$1" --select-1 --exit-0
  )
  [ -n "$file" ] && echo "ruby -I test $file" | writecmd -run
}

# fh - repeat history
fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# fhe - repeat history with edit
fhe() {
  print -z $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
bind '"\er": redraw-current-line'
bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
bind '"\C-g\C-r": "$(gr)\e\C-e\er"'

export NVM_DIR="/home/chrisf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/Users/chrisf/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

cr_diff() {
    local current_branch=""
    local prev_branch=""
    if [ $# -eq 1 ]; then
        current_branch=$(git symbolic-ref --short HEAD)
        prev_branch=$1
    else
        current_branch=$1
        prev_branch=$2
    fi
    git log --pretty=format:%s -n100 "$current_branch" > "$current_branch.log"
    git log --pretty=format:%s -n100 "origin/$prev_branch" > "$prev_branch.log"
    diff -y "$current_branch.log" "$prev_branch.log"
    rm "$current_branch.log" "$prev_branch.log"
    echo "\n"
}
export -f cr_diff

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
