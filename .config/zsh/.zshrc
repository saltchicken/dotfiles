
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/saltchicken/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

export DEFAULT_USER="saltchicken"
export TERM="xterm-256color"
export ZSH=/usr/share/oh-my-zsh
export ZSH_POWER_LEVEL_THEME=/usr/share/zsh-theme-powerlevel10k

source $ZSH_POWER_LEVEL_THEME/powerlevel10k.zsh-theme

plugins=(archlinux 
	bundler 
	docker 
	jsontools 
	vscode web-search 
	k 
	tig 
	gitfast 
	colored-man-pages
	colorize 
	command-not-found 
	cp 
	dirhistory 
	autojump 
	sudo
  zsh-vi-mode
	zsh-syntax-highlighting
	zsh-autosuggestions) 
# /!\ zsh-syntax-highlighting and then zsh-autosuggestions must be at the end

source $ZSH/oh-my-zsh.sh

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -s /home/saltchicken/.autojump/etc/profile.d/autojump.sh ]] && source /home/saltchicken/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u

source /home/saltchicken/.autoenv/activate.sh

# export PATH="$PATH:/home/saltchicken/bin"
#
# zle-line-finish() {
#   zle vi-insert
# }
#
# zle -N zle-line-finish
#
# echo "hello"
#
# Your custom widget
function my_custom_widget() {
  # zle vi-insert
  zle accept-line
  zvm_select_vi_mode 'i'
}

function test_widget() {
# autosuggest-accept
echo "hello"

}

# The plugin will auto execute this zvm_after_lazy_keybindings function
function zvm_after_lazy_keybindings() {
  # Here we define the custom widget
  zvm_define_widget my_custom_widget
  zvm_define_widget test_widget

  # In normal mode, press Ctrl-E to invoke this widget
  zvm_bindkey vicmd '^M' my_custom_widget
  # zvm_bindkey viins '^N' test_widget
}


# CUSTOM KEYBINDS


# bindkey '^l' autosuggest-accept
#
# bindkey "^k" up-line-or-beginning-search # Up
# bindkey "^j" down-line-or-beginning-search # Down
