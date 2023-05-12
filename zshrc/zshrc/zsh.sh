autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
ZSH_DISABLE_COMPFIX=true
local WORDCHARS='*?.[]~=&;!#$%^(){}<>'
setopt auto_cd
setopt globdots
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
export PROMPT_EOL_MARK=''

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=$HOME/.istioctl/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export EDITOR=nvim

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
