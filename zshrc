source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle autojump
antigen bundle common-aliases
antigen bundle git
antigen bundle jsontools
antigen bundle node
antigen bundle npm
antigen bundle nvm
antigen bundle osx
antigen bundle pip
antigen bundle python
antigen bundle sudo
antigen bundle tmux
antigen bundle vagrant
antigen bundle web-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle sindresorhus/pure

antigen apply

export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"
