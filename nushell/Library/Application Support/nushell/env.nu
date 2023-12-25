use std

$env.PATH = ($env.PATH 
	| split row (char esep) 
	| prepend '/opt/homebrew/bin' 
	| prepend $'($env.HOME)/Library/Application Support/carapace/bin'
	| append $'($env.HOME)/.cargo/bin' 
	| append $'($env.HOME)/Library/Python/3.9/bin' 
	| append $'($env.HOME)/Downloads/google-cloud-sdk/bin'
	| append $'/usr/local/bin'
	| append $'/usr/local/go/bin'
	| append $'($env.HOME)/go/bin'
	| append $'/usr/local/texlive/2023/bin/universal-darwin/') 

$env.NUPM_HOME = $'($env.HOME)/nupm'

use '/Users/robbienohra/nupm/modules/nu-themes/catppuccin-mocha.nu'

$env.config.color_config = (catppuccin-mocha)

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
# $env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

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

if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  $env.PATH = ($env.PATH | prepend [
	$"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}

$env.RIPGREP_CONFIG_PATH = $"($env.HOME)/.ripgreprc"

$env.JAVA_HOME = "/opt/homebrew/opt/openjdk@11"

$env.EDITOR = "nvim"

# todo
# $env.PYENV_ROOT = $"($env.HOME)/.pyenv"
# I cannot recall where exactly these are needed
# $env.LDFLAGS = "-L/opt/homebrew/opt/llvm/lib"
# $env.CPPFLAGS = "-I/opt/homebrew/opt/llvm/include"
# $env.PATH = "/opt/homebrew/opt/llvm/bin"
# "/opt/homebrew/opt/gnu-sed/libexec/gnubin"

### packer.nu ###
load-env {NU_PACKER_HOME: '/Users/robbienohra/.local/share/nushell/packer'}
# recovery command
def 'packer compile' [] { nu -c $'use ($env.NU_PACKER_HOME)/start/packer.nu/api_layer/packer.nu; packer compile' }
# bootstrap packer.nu
if not ($'($env.NU_PACKER_HOME)/start/packer.nu/api_layer/packer_api.nu' | path exists) {
  print $'(ansi ub)Bootstrapping packer.nu...(ansi reset)'
  nu -c (http get https://raw.githubusercontent.com/jan9103/packer.nu/main/install.nu)
  print $'(ansi ub)Bootstrapped packer.nu.'
  print $'(ansi ub)Installing packages...(ansi reset)'
  nu -c $'use ($env.NU_PACKER_HOME)/start/packer.nu/api_layer/packer.nu; packer install'
  print $'(ansi ub)Installed packages.(ansi reset)'
}
# compile conditional package loader
# conditional packages have to be generated in the env, since you can't generate and import in the same file.
#nu -c 'use /Users/robbienohra/.local/share/nushell/packer/start/packer.nu/api_layer/packer.nu; packer compile_cond_init /Users/robbienohra/.local/share/nushell/packer/conditional_packages.nu'
if not ($'($env.NU_PACKER_HOME)/packer_packages.nu' | path exists) { 'export-env {}' | save $'($env.NU_PACKER_HOME)/packer_packages.nu' }
