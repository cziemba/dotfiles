# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/zsh

# Set name of the theme to load.
ZSH_THEME="sorin"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Disable auto titling
DISABLE_AUTO_TITLE="false"

export MOSH_TITLE_NOPREFIX=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(common-aliases git zsh-syntax-highlighting termsupport osx)

# User path configuration
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH="$PATH:/opt/eb/linux/python2.7"
export PATH="$PATH:/opt/android-studio/bin"
export PATH="$PATH:$JAVA_HOME/bin"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

if [[ -f "$HOME/.secrets" ]]; then
    source $HOME/.secrets
fi

# Mosh failover to ssh
function mosh_failover() {
    mosh "$@"
    [ $? -eq 5 ] && ssh "$@"
}
alias ssh='mosh_failover'

# Git Aliases
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ga='git add'
alias gs='git status'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gc='git commit'
alias gca='git commit --amend'

# Work Aliases
alias sshec2='ssh czziemba.aka.corp.amazon.com'
alias cdw='cd ~/workspace'
alias bb='brazil-build'
alias b='brazil'
alias post-review='post-review -u ava-dev'
alias chrome='open -a "/Applications/Google Chrome.app" --args'

# My Aliases
alias adbHome='adb shell input keyevent 3'
alias adbBack='adb shell input keyevent 4'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
