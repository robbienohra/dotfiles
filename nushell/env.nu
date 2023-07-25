# Nushell Environment Config File
#
# version = 0.82.0

let-env PATH = ($env.PATH 
	| split row (char esep) 
	| prepend '/opt/homebrew/bin' 
	| append $'($env.HOME)/.cargo/bin' 
	| append $'($env.HOME)/Downloads/google-cloud-sdk/bin'
	| append $'/usr/local/bin'
	| append $'/usr/local/go/bin')

let-env PATH = ($env.PATH | append $'(go env GOPATH)/bin')

let-env STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { || create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = ""
let-env PROMPT_INDICATOR_VI_INSERT = ": "
let-env PROMPT_INDICATOR_VI_NORMAL = "〉"
let-env PROMPT_MULTILINE_INDICATOR = "::: "

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = {|| create_left_prompt }
# let-env PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

zoxide init nushell | save -f ~/.zoxide.nu

if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  let-env PATH = ($env.PATH | prepend [
	$"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}

let DARK0 = ""#0D0E0F"
let DARK = "#0D0E0F"
let BACKGROUND_DARK = "#171A1A"
let BACKGROUND = "#1D2021"
let BACKGROUND_LIGHT = "#32302F"
let FOREGROUND = "#EBDBB2"
let GRAY = "#DEDEDE"
let MEDIUM_GRAY = "#504945"
let COMMENT = "#665C54"
let MILK = "#E7D7AD"
let ERROR_RED = "#CC241D"
let RED = "#FB4934"
let ORANGE = "#D65D0E"
let BRIGHT_YELLOW = "#FABD2F"
let SOFT_YELLOW = "#EEBD35"
let PINK = "#D4879C"
let MAGENTA = "#B16286"
let SOFT_GREEN = "#98971A"
let FOREST_GREEN = "#689D6A"
let CLEAN_GREEN = "#8EC07C"
let BLUE_GRAY = "#458588"
let DARK_GRAY = "#83A598"
let LIGHT_BLUE = "#7FA2AC"

let-env FZF_DEFAULT_OPTS = $"--history=($env.HOME)/.fzf_history 
--bind ctrl-d:page-down,ctrl-u:page-up 
--bind ctrl-p:previous-history 
--bind ctrl-f:next-history 
--bind F2:toggle-preview 
--info=hidden 
--color=fg:($FOREGROUND) 
--color=bg:($BACKGROUND) 
--color=hl:($BRIGHT_YELLOW) 
--color=fg+:bold:($FOREGROUND) 
--color=bg+:($COMMENT) 
--color=hl+:($BRIGHT_YELLOW) 
--color=gutter:($BACKGROUND) 
--color=info:($ORANGE) 
--color=separator:($BACKGROUND) 
--color=border:($MILK) 
--color=label:($SOFT_YELLOW) 
--color=prompt:($LIGHT_BLUE) 
--color=spinner:($BRIGHT_YELLOW) 
--color=pointer:bold:($BRIGHT_YELLOW) 
--color=marker:($ERROR_RED) 
--color=header:($ORANGE) 
--color=preview-fg:($FOREGROUND)
--color=preview-bg:($BACKGROUND)"

let-env FZF_DEFAULT_COMMAND = "fd --type f --follow --hidden --exclude .git"

# for glow
let-env EDITOR = "nvim"

let-env RIPGREP_CONFIG_PATH = $"($env.HOME)/.ripgreprc"


# todo
# let-env PYENV_ROOT = $"($env.HOME)/.pyenv"
# I cannot recall where exactly these are needed
# let-env LDFLAGS = "-L/opt/homebrew/opt/llvm/lib"
# let-env CPPFLAGS = "-I/opt/homebrew/opt/llvm/include"
# let-env PATH = "/opt/homebrew/opt/llvm/bin"
# "/opt/homebrew/opt/openjdk@11/bin"
# "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
