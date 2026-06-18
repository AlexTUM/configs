# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# main shortcuts
alias ls='lsd' # use lsd instead of ls -> e.g. adds icons
alias ll='lsd -l'
alias lla='lsd -la'


# program shortcuts
alias pdfview='evince -f'
alias fvim='nvim $(fzf -m --preview="bat --color=always --style=plain {}")'

# global aliases
alias -g NE='2>/dev/null'
