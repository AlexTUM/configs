# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# ssh aliases
alias dse_graham='SSH_AUTH_SOCK= ssh -v -F /dev/null -i $HOME/.ssh/github_tum -oProxyCommand="ssh tunnel@login.dos.cit.tum.de -i $HOME/.ssh/github_tum -W %h:%p" alexander@graham.dos.cit.tum.de'
alias dse='SSH_AUTH_SOCK= ssh -v -F /dev/null -i $HOME/.ssh/github_tum -oProxyCommand="ssh tunnel@login.dos.cit.tum.de -i $HOME/.ssh/github_tum -W %h:%p" alexander@ryan.dos.cit.tum.de'
alias lrz='ssh -Y lxlogin1.lrz.de -l ga27yol2'
alias aer='ssh -Y aschindler@yoko.aer.mw.tum.de'


# program shortcuts
alias pdfview='evince -f'
alias fvim='nvim $(fzf -m --preview="bat --color=always --style=plain {}")'
alias ll='ls -al'
