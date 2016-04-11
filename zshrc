# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh-syntax-highlighting termsupport osx)

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

# Aliases
alias hg='history | grep'
alias sshec2='ssh czziemba.aka.corp.amazon.com'
