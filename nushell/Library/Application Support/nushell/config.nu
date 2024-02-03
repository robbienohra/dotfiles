use git.nu *
use aliases.nu *
use utils.nu *

$env.config = {
show_banner: false
keybindings: [
{
  name: open_br
  modifier: control
  keycode: char_o
  mode: emacs
  event: {
    send: executehostcommand,
    cmd: "br -hI"
  }
}
]
  hooks: {
    env_change: {
      PWD: [{ |before, after|
        let is_node_dir = [.nvmrc .node-version] | path exists | any { |it| $it }
        if ('FNM_DIR' in $env) and $is_node_dir {
          fnm use # Personally I prefer to use fnm --log-level=quiet use
        }
      }]
    }
  }
}

# sourcing

source ~/.zoxide.nu
source ~/.cache/starship/init.nu
source ~/.cache/carapace/init.nu
source ~/.local/share/atuin/init.nu

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
