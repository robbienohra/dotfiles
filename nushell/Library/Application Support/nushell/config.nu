use git.nu *
use aliases.nu *
use utils.nu *

$env.config = {
	show_banner: false
	keybindings: [
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
		  name: open_br
		  modifier: control
		  keycode: char_o
		  mode: emacs
		  event: {
			send: executehostcommand,
			cmd: "br"
		  }
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

source /Users/robbienohra/.config/broot/launcher/nushell/br

### packer.nu ###
# load packer api
overlay use /Users/robbienohra/.local/share/nushell/packer/start/packer.nu/api_layer/packer_api.nu
# load packages
overlay use /Users/robbienohra/.local/share/nushell/packer/packer_packages.nu
# load conditional packages
#overlay use /Users/robbienohra/.local/share/nushell/packer/conditional_packages.nu