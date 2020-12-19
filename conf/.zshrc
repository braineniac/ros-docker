# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

#######################################
# User config
#######################################

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
ZSH_DISABLE_COMPFIX=true

# workspace setup
if [ -f $HOME/.ws ]; then
				. $HOME/.ws
fi

# vcstool autocomplete
if [ -f /usr/share/vcstool-completion/vcs.zsh ]; then
				. /usr/share/vcstool-completion/vcs.zsh
fi

if [ -f /opt/ros/melodic/local_setup.zsh ]; then
				. /opt/ros/melodic/setup.zsh
fi

if [ -n "$SINGULARITY_CONTAINER" ]; then
				PS1="("$(echo ${$(basename $(echo $SINGULARITY_CONTAINER))%.*})") "$PS1
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
