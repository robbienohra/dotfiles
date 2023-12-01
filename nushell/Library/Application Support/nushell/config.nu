use git.nu *
use aliases.nu *

let dark_theme = {
    separator: "#d5c4a1"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b8bb26" attr: "b" }
    empty: "#83a598"
    bool: {|| if $in { "#8ec07c" } else { "light_gray" } }
    int: "#d5c4a1"
    filesize: {|e|
        if $e == 0b {
            "#d5c4a1"
        } else if $e < 1mb {
            "#8ec07c"
        } else {{ fg: "#83a598" }}
    }
    duration: "#d5c4a1"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fb4934" attr: "b" }
        } else if $in < 6hr {
            "#fb4934"
        } else if $in < 1day {
            "#fabd2f"
        } else if $in < 3day {
            "#b8bb26"
        } else if $in < 1wk {
            { fg: "#b8bb26" attr: "b" }
        } else if $in < 6wk {
            "#8ec07c"
        } else if $in < 52wk {
            "#83a598"
        } else { "dark_gray" }
    }
    range: "#d5c4a1"
    float: "#d5c4a1"
    string: "#d5c4a1"
    nothing: "#d5c4a1"
    binary: "#d5c4a1"
    cellpath: "#d5c4a1"
    row_index: { fg: "#b8bb26" attr: "b" }
    record: "#d5c4a1"
    list: "#d5c4a1"
    block: "#d5c4a1"
    hints: "dark_gray"
    search_result: { fg: "#fb4934" bg: "#d5c4a1" }

    shape_and: { fg: "#d3869b" attr: "b" }
    shape_binary: { fg: "#d3869b" attr: "b" }
    shape_block: { fg: "#83a598" attr: "b" }
    shape_bool: "#8ec07c"
    shape_custom: "#b8bb26"
    shape_datetime: { fg: "#8ec07c" attr: "b" }
    shape_directory: "#8ec07c"
    shape_external: "#8ec07c"
    shape_externalarg: { fg: "#b8bb26" attr: "b" }
    shape_filepath: "#8ec07c"
    shape_flag: { fg: "#83a598" attr: "b" }
    shape_float: { fg: "#d3869b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8ec07c" attr: "b" }
    shape_int: { fg: "#d3869b" attr: "b" }
    shape_internalcall: { fg: "#8ec07c" attr: "b" }
    shape_list: { fg: "#8ec07c" attr: "b" }
    shape_literal: "#83a598"
    shape_match_pattern: "#b8bb26"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8ec07c"
    shape_operator: "#fabd2f"
    shape_or: { fg: "#d3869b" attr: "b" }
    shape_pipe: { fg: "#d3869b" attr: "b" }
    shape_range: { fg: "#fabd2f" attr: "b" }
    shape_record: { fg: "#8ec07c" attr: "b" }
    shape_redirection: { fg: "#d3869b" attr: "b" }
    shape_signature: { fg: "#b8bb26" attr: "b" }
    shape_string: "#b8bb26"
    shape_string_interpolation: { fg: "#8ec07c" attr: "b" }
    shape_table: { fg: "#83a598" attr: "b" }
    shape_variable: "#d3869b"

    background: "#1d2021"
    foreground: "#d5c4a1"
    cursor: "#d5c4a1" 
}

$env.config = {
	show_banner: false
	keybindings: [
	    {
      name: fuzzy_history
      modifier: control
      keycode: char_r
      mode: emacs
      event: {
        send: executehostcommand
        cmd: "commandline (history | each { |it| $it.command } | uniq | reverse | str join (char nl) | fzf --layout=reverse --height=40% -q (commandline) | decode utf-8 | str trim)"
      }
    }
	{
    name: fuzzy_dir
    modifier: alt
    keycode: char_s
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: "commandline -a (
            ls **/*
            | where type == dir
            | get name
            | input list --fuzzy
                $'Please choose a (ansi magenta)directory(ansi reset) to (ansi cyan_underline)insert(ansi reset):'
        )"
    }
}
	 {
	 	  name: cd_with_zi
	 	  modifier: control
	 	  keycode: char_z
	 	  mode: emacs
	 	  event: {
	 		send: executehostcommand,
	 		cmd: "zi"
	 	  }
	 }
	 {
		  name: open_file_with_fzf
		  modifier: control
		  keycode: char_o
		  mode: emacs
		  event: {
			send: executehostcommand,
			cmd: "fzf --bind 'enter:become(nvim {})'"
		  }
	}
	{
		  name: open_recent_file_with_fzf
		  modifier: control
		  keycode: char_k
		  mode: emacs
		  event: {
			send: executehostcommand,
			cmd: "nvim -c 'FzfLua oldfiles'"
		  }
	}
	{
			 name: change_dir_with_fzf
			 modifier: alt
			 keycode: Char_c
			 mode: emacs
			 event:[
					 { edit: Clear }
					 { edit: InsertString,
						 value: "cd (fd --hidden --exclude .git | str join (char nl) | fzf | decode utf-8 | str trim)"
					 }
					 { send: Enter }
				 ]
		 }
	]
}

# sourcing

source ~/.zoxide.nu
source ~/.cache/starship/init.nu
source ~/.cache/carapace/init.nu
source ~/.local/share/atuin/init.nu

# aliases



# fnm
# https://github.com/Schniz/fnm/issues/463#issuecomment-1602216687
if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  $env.PATH = ($env.PATH | prepend [
	$"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}

# atuin
$env.config = (
	$env.config | upsert keybindings (
		$env.config.keybindings
		| append {
			name: atuin
			modifier: control
			keycode: char_y
			mode: [emacs, vi_normal, vi_insert]
			event: { send: executehostcommand cmd: (_atuin_search_cmd) }
		}
	)
)

# tree-sitter-nu

# https://github.com/nushell/tree-sitter-nu/blob/main/installation/neovim.md
let remote = "https://raw.githubusercontent.com/nushell/tree-sitter-nu/main/queries/"
let local = (
	$env.XDG_DATA_HOME?
	| default ($env.HOME | path join ".local" "share")
	| path join "nvim" "lazy" "nvim-treesitter" "queries" "nu"
)

let file = "highlights.scm"

mkdir $local
http get ([$remote $file] | str join "/") | save --force ($local | path join $file)


