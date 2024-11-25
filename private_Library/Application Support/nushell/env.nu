use std

$env.PATH = ($env.PATH
  | split row (char esep)
  | prepend '/opt/homebrew/bin'
  | append $'($env.HOME)/.cargo/bin'
  | append $'($env.HOME)/Downloads/google-cloud-sdk/bin'
  | append $'/usr/local/bin'
  | append $'/usr/local/go/bin'
  | append $'($env.HOME)/go/bin'
  | append $'/usr/local/texlive/2024basic/bin/universal-darwin/')

$env.SHELL = "nu"
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"

$env.NUPM_HOME = $'($env.HOME)/nupm'

$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
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
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# https://github.com/Schniz/fnm/issues/463#issuecomment-1784926846
if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  $env.PATH = ($env.PATH | prepend [
  $"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}

$env.RIPGREP_CONFIG_PATH = $"($env.HOME)/.ripgreprc"

$env.JAVA_HOME = "/opt/homebrew/opt/openjdk@11"

$env.EDITOR = "nvim"

$env.LANG = "en_US.UTF-8"

# https://github.com/pnpm/pnpm/issues/5000
$env.PNPM_HOME = $"($env.HOME)/.local/share/pnpm"
$env.PATH = ($env.PATH | split row (char esep) | prepend $env.PNPM_HOME )

$env.FZF_DEFAULT_OPTS = $"--history=($env.HOME)/.fzf_history
--bind ctrl-d:page-down,ctrl-u:page-up
--bind ctrl-p:previous-history
--bind ctrl-f:next-history
--bind F2:toggle-preview
--info=hidden
--color=bg:#1a1b26
--color=bg+:#1a1b26"
