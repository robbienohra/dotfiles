use scripts/git.nu *
use scripts/aliases.nu *
use scripts/utils.nu *

$env.config = {
show_banner: false
keybindings: [
{
  name: open_nvim
  modifier: control
  keycode: char_n
  mode: emacs
  event: {
    send: executehostcommand,
    cmd: "nvim ."
  }
},
{
  name: open_session
  modifier: control
  keycode: char_n
  mode: emacs
  event: {
    send: executehostcommand,
    cmd: "nvim"
  }
}
]
  hooks: {
    pre_prompt: [{||
      if "LAST_CMD" in $env {
        print -n $"(ansi title)(pwd | str replace "/Users/robbienohra" "~") > ($env.LAST_CMD)(ansi st)"
      } else {
        print -n $"(ansi title)(pwd | str replace "/Users/robbienohra" "~")(ansi st)"
      }
    }]
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

$env.OPENAI_API_KEY = (open $"($env.HOME)/openapikey")
