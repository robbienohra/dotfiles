[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


DARK0=#0D0E0F
DARK=#0D0E0F
BACKGROUND_DARK=#171A1A
BACKGROUND=#1D2021
BACKGROUND_LIGHT=#32302F
FOREGROUND=#EBDBB2
GRAY=#DEDEDE
MEDIUM_GRAY=#504945
COMMENT=#665C54
MILK=#E7D7AD
ERROR_RED=#CC241D
RED=#FB4934
ORANGE=#D65D0E
BRIGHT_YELLOW=#FABD2F
SOFT_YELLOW=#EEBD35
PINK=#D4879C
MAGENTA=#B16286
SOFT_GREEN=#98971A
FOREST_GREEN=#689D6A
CLEAN_GREEN=#8EC07C
BLUE_GRAY=#458588
DARK_GRAY=#83A598
LIGHT_BLUE=#7FA2AC


export FZF_DEFAULT_OPTS="
--history=$HOME/.fzf_history \
--bind ctrl-d:page-down,ctrl-u:page-up \
--bind ctrl-p:previous-history \
--bind ctrl-f:next-history \
--bind ctrl-/:toggle-preview \
--info=hidden \
--color=fg:${FOREGROUND} \
--color=bg:${BACKGROUND} \
--color=hl:${BRIGHT_YELLOW} \
--color=fg+:bold:${FOREGROUND} \
--color=bg+:${COMMENT} \
--color=hl+:${BRIGHT_YELLOW} \
--color=gutter:${BACKGROUND} \
--color=info:${ORANGE} \
--color=separator:${BACKGROUND} \
--color=border:${MILK} \
--color=label:${SOFT_YELLOW} \
--color=prompt:${LIGHT_BLUE} \
--color=spinner:${BRIGHT_YELLOW} \
--color=pointer:bold:${BRIGHT_YELLOW} \
--color=marker:${ERROR_RED} \
--color=header:${ORANGE} \
--color=preview-fg:${FOREGROUND} \
--color=preview-bg:${BACKGROUND}"

export FZF_DEFAULT_COMMAND="rg --files --follow" # picked up by vim
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function fzf-down() {
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window down:60% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/origin/##'
}
