# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
## for git heighlight
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local WHITE="\[\033[1;37m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac
  PS1="${TITLEBAR}\u@\h:\w$RED\$(parse_git_branch)$LIGHT_GRAY$ "
  PS2='> '
  PS4='+ '
}

proml
# svn commit msg editor
export SVN_EDITOR=vim