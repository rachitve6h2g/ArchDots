# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This only works in .zshrc 
####################################
export PATH=$PATH:$HOME/.local/bin #
####################################
# and nowhere else 

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/hashdirs.zsh

# For yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Enabling Portage completions 
export HISTSIZE=2000
export HISTFILE="$ZDOTDIR/.history"
# export SAVEHIST="$HISTFILE"
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Using antigen to load the zsh-syntax highlighting plugin
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh

# Use the oh-my-zsh plugins from here
antigen bundle emotty
antigen bundle emoji
antigen bundle git
antigen bundle command-not-found

# use custom theme instead of premade theme
antigen theme romkatv/powerlevel10k

# Source the catppuccin zsh-syntax-highlighting before
# loading the zsh-syntax-highlighting plugin
source $ZDOTDIR/catppuccin_mocha-zsh-syntax-highlighting.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Here is the real theme
# antigen theme random

antigen apply

# Source modifications in plugins here 
source $ZDOTDIR/plugin_mod.zsh
export MANPAGER="nvim +Man!"

# For bat themed help command 
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

# For finding and streaming audio using mpv
function yta() {
    mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"
}

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
