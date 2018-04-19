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
export PATH="/opt/eb/linux/python2.7:$PATH"
export PATH="/opt/android-studio/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/sbin:/sbin:/usr/bin:/bin:$PATH"

# usr/local > all
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Ensure brazil cli path is before SDEFools
export PATH="$BRAZIL_CLI_BIN:$PATH"
export BRAZIL_BUILD_HOME="$BRAZIL_CLI_BIN"

# rbenv and init
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

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
alias bbs='brazil-build server'
alias bb='brazil-build'
alias bws='brazil ws show'
alias b='brazil'
alias chrome='open -a "/Applications/Google Chrome.app" --args'

# Bark Aliases
alias barkiad="bark -ConfigFile=/home/czziemba/.barkIAD"

# Conditional mwinit
SSH_CERT=~/.ssh/id_rsa-cert.pub
if (! test -f "$SSH_CERT") || (test "`find ~/.ssh/id_rsa-cert.pub -mmin +1220`"); then
    echo "Midway expired"
    if mwinit -o; then
        ssh-add -D ~/.ssh/*_rsa
        ssh-add ~/.ssh/*_rsa
    else
        echo "Failed to authenticate."
        exit 1
    fi
fi

# Conditional kinit
if ! klist -s; then
    echo 'Kerberos expired'
    kinit -f
fi


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
