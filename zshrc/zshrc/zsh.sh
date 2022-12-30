# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
ZSH_DISABLE_COMPFIX=true
local WORDCHARS='*?_[]~=&;!#$%^(){}<>'
setopt auto_cd
setopt globdots
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY
bindkey -r '^T'
bindkey -r '^R'
bindkey -r '^A'
bindkey -r '^G'
bindkey '^[a' beginning-of-line
bindkey '^[r' end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=$HOME/.istioctl/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export EDITOR=nvim

# PASS=${HOME}/pass.sh
# if [ -f $PASS ]; then export SUDO_ASKPASS=$PASS; fi

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/780

if [[ $TERM == "alacritty" ]]; then ZSH_HIGHLIGHT_STYLES[comment]="fg=whatever_color,bold"; fi
