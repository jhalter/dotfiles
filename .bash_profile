## General
export PATH=/opt/local/bin:/opt/local/sbin:~/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export EDITOR=mate
export CLICOLOR=1

## EC2
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

export GIT_MERGE_AUTOEDIT=no

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

[[ $(which /usr/bin/gnutar) ]] && alias tar='/usr/local/bin/gtar'
alias ll='ls -alF'
alias pp='git pull && git push'
alias pl='bin/git-push-loop'
alias gitclean='git reset --hard origin/master'
alias gendate="(TZ=UTC date '+%Y.%m.%d_%H.%M')"

# convert space delimited list into comma delimited list
function s2c {
  sed 's/ /,/g' $@
}

source ~/.bash/gitprompt.sh