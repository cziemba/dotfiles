# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Disable auto titling
DISABLE_AUTO_TITLE="false"

CASE_SENSITIVE="true"

# A lot (a lot) of history
HISTSIZE=10000000
SAVEHIST=10000000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew common-aliases git zsh-syntax-highlighting osx history-substring-search)

# User path configuration
export PATH="/opt/eb/linux/python2.7:$PATH"
export PATH="/opt/android-studio/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/sbin:/sbin:/usr/bin:/bin:$PATH"
export PATH="$HOME/workspace/LiveJQ:$PATH"

# usr/local > all
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Ensure brazil cli path is before SDEFools
export PATH="$BRAZIL_CLI_BIN:$PATH"
export BRAZIL_BUILD_HOME="$BRAZIL_CLI_BIN"

export PATH="$HOME/.toolbox/bin:$PATH"
export RPROMPT="%{%}%B%(7~,.../,)%6~%b%{%}"

# rbenv and init
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PATH="$(pyenv root)/shims:$PATH"

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
alias sshec2='et czziemba.aka.corp.amazon.com'
alias bbs='brazil-build server'
alias bb='brazil-build'
alias bbb='brazil-build build'
alias bre='brazil-runtime-exec'
alias bws='brazil ws show'
alias b='brazil'
alias gsdir='for d in ./*/ ; do (cd "$d" && echo "\n\n$d" && git status); done'

# hist substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
