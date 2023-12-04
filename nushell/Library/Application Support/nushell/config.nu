use git.nu *
use aliases.nu *
use utils.nu *

$env.config = {
	show_banner: false
	keybindings: [
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
		  keycode: char_r
		  mode: emacs
		  event: {
			send: executehostcommand,
			cmd: "nvim --headless -c 'source $HOME/dotfiles/process_oldfiles.vim' -c 'qa!' | open ~/oldfiles_output.txt | lines | uniq | reverse | str join (char nl) | fzf --bind 'enter:execute(nvim {})+abort' --height 25%"
		  }
	}
	 {
		  name: open_file_with_fzf
		  modifier: control
		  keycode: char_o
		  mode: emacs
		  event: {
			send: executehostcommand,
			cmd: "fzf --bind 'enter:become(nvim {})' --height 25%"
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


