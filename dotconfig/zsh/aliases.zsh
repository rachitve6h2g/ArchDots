alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim"
alias ffetch="fastfetch"

# Aliases for colored outputs
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias -g ip='ip -color=auto'
alias -g ls='eza --icons=auto'
alias -g la='eza --color=auto -al'

# Alias for editting sensitive files
alias suvim='sudo nvim'

# Alias for colored helps 
# Also see the help function in .zshrc
# The aliases have been set keeping in mind 
# the oh-my-zsh issue about diagnostics.zsh
alias -g -- :B='-h 2>&1 | bat --language=help --style=plain'
alias -g -- :b='--help 2>&1 | bat --language=help --style=plain'

# alias for editing .zshrc files directly
alias -g -- ba="vim ~/.config/zsh/"

