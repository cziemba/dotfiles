# Path to your oh-my-zsh installation.
export ZSH=/home/cziemba/.dotfiles/zsh

# Set name of the theme to load.
ZSH_THEME="bira"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zsh-syntax-highlighting virtualenv virtualenvwrapper)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH="$PATH:/opt/eb/linux/python2.7"
export PATH="$PATH:/opt/android-studio/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# virtualenvwrapper initialization
if [[ -f "/usr/local/bin/virtualenvwrapper.sh" ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [[ -f "$HOME/.secrets" ]]; then
    source $HOME/.secrets
fi
