# Nushell Config File
#
# version = 0.82.0

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

# The default config record. This is where much of your global configuration is setup.
let-env config = {
  show_banner: false
  ls: {
    use_ls_colors: true # use the LS_COLORS environment variable to colorize output
    clickable_links: true # enable or disable clickable links. Your terminal has to support links.
  }
  rm: {
    always_trash: false # always act as if -t was given. Can be overridden with -p
  }
  cd: {
    abbreviations: false # allows `cd s/o/f` to expand to `cd some/other/folder`
  }
  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    show_empty: true # show 'empty list' and 'empty record' placeholders for command output
    trim: {
      methodology: wrapping # wrapping or truncating
      wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
      truncating_suffix: "..." # A suffix used by the 'truncating' methodology
    }
  }

  # datetime_format determines what a datetime rendered in the shell would look like.
  # Behavior without this configuration point will be to "humanize" the datetime display,
  # showing something like "a day ago."

  datetime_format: {
    normal: '%a, %d %b %Y %H:%M:%S %z'  # shows up in displays of variables or other datetime's outside of tables
    # table: '%m/%d/%y %I:%M:%S%p'        # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
  }

  explore: {
    help_banner: true
    exit_esc: true

    command_bar_text: '#C4C9C6'
    # command_bar: {fg: '#C4C9C6' bg: '#223311' }

    status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6' }
    # status_bar_text: {fg: '#C4C9C6' bg: '#223311' }

    highlight: {bg: 'yellow' fg: 'black' }

    status: {
      # warn: {bg: 'yellow', fg: 'blue'}
      # error: {bg: 'yellow', fg: 'blue'}
      # info: {bg: 'yellow', fg: 'blue'}
    }

    try: {
      # border_color: 'red'
      # highlighted_color: 'blue'

      # reactive: false
    }

    table: {
      split_line: '#404040'

      cursor: true

      line_index: true
      line_shift: true
      line_head_top: true
      line_head_bottom: true

      show_head: true
      show_index: true

      # selected_cell: {fg: 'white', bg: '#777777'}
      # selected_row: {fg: 'yellow', bg: '#C1C2A3'}
      # selected_column: blue

      # padding_column_right: 2
      # padding_column_left: 2

      # padding_index_left: 2
      # padding_index_right: 1
    }

    config: {
      cursor_color: {bg: 'yellow' fg: 'black' }

      # border_color: white
      # list_color: green
    }
  }

  history: {
    max_size: 100_000 # Session has to be reloaded for this to take effect
    sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
    file_format: "plaintext" # "sqlite" or "plaintext"
    isolation: true # true enables history isolation, false disables it. true will allow the history to be isolated to the current session. false will allow the history to be shared across all sessions.
  }
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    quick: true  # set this to false to prevent auto-selecting completions when only one remains
    partial: true  # set this to false to prevent partial filling of the prompt
    algorithm: "fuzzy"  # prefix or fuzzy
    external: {
      enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
      max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
      completer: null # check 'carapace_completer' above as an example
    }
  }
  filesize: {
    metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
  }
  cursor_shape: {
    emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line (line is the default)
    vi_insert: block # block, underscore, line , blink_block, blink_underscore, blink_line (block is the default)
    vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line (underscore is the default)
  }
  color_config: $dark_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  float_precision: 2 # the precision for displaying floats in tables
  buffer_editor: "nvim" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  use_ansi_coloring: true
  bracketed_paste: true # enable bracketed paste, currently useless on windows
  edit_mode: emacs # emacs, vi
  shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.

  hooks: {
    pre_prompt: [{||
      null  # replace with source code to run before the prompt is shown
    }]
    pre_execution: [{||
      null  # replace with source code to run before the repl input is run
    }]
    env_change: {
      PWD: [{|before, after|
        null  # replace with source code to run if the PWD environment is different since the last repl input
      }]
    }
    display_output: {||
      if (term size).columns >= 100 { table -e } else { table }
    }
    command_not_found: {||
      null  # replace with source code to return an error message when a command is not found
    }
  }
  menus: [
      # Configuration for default nushell menus
      # Note the lack of source parameter
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      # Example of extra menus created using a nushell source
      # Use the source field to create a list of records that populates
      # the menu
      {
        name: commands_menu
        only_buffer_difference: false
        marker: "# "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            scope commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            scope variables
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            scope commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
  ]
  # https://github.com/nushell/nushell/issues/5785#issuecomment-1243733398
  keybindings: [
    {
   	 name: reload_config
   	 modifier: none
   	 keycode: f5
   	 mode: emacs
   	 event: {
   	   send: executehostcommand,
   	   cmd: $"source '($nu.config-path)'"
   	 }
    }
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
      event: { send: menuprevious }
    }
    {
      name: next_page
      modifier: control
      keycode: char_x
      mode: emacs
      event: { send: menupagenext }
    }
    {
      name: undo_or_previous_page
      modifier: control
      keycode: char_z
      mode: emacs
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
       }
    }
    {
      name: yank
      modifier: control
      keycode: char_y
      mode: emacs
      event: {
        until: [
          {edit: pastecutbufferafter}
        ]
      }
    }
    {
      name: unix-line-discard
      modifier: control
      keycode: char_u
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cutfromlinestart}
        ]
      }
    }
    {
      name: kill-line
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cuttolineend}
        ]
      }
    }
    # Keybindings used to trigger the user defined menus
    {
      name: commands_menu
      modifier: control
      keycode: char_t
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_menu }
    }
    # {
    #   name: vars_menu
    #   modifier: alt
    #   keycode: char_o
    #   mode: [emacs, vi_normal, vi_insert]
    #   event: { send: menu name: vars_menu }
    # }
    {
      name: commands_with_description
      modifier: control
      keycode: char_s
      mode: [emacs, vi_normal, vi_insert]
      event: { send: menu name: commands_with_description }
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

source ~/.cache/starship/init.nu
source ~/.zoxide.nu

# aliases

alias l = ls
alias la = ls -la
alias k = kubectl
alias g = git
alias ynw = yarn workspace
alias n = nvim .

# https://github.com/nushell/nu_scripts/blob/a61256da0ee77a29b478877b47eea88f522a6c11/custom-completions/auto-generate/completions/git.nu

def "nu-complete git available upstream" [] {
  ^git branch -a | lines | each { |line| $line | str replace '\* ' "" | str trim }
}

def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

def "nu-complete git log" [] {
  ^git log --pretty=%h | lines | each { |line| $line | str trim }
}

# Yield all existing commits in descending chronological order.
def "nu-complete git commits all" [] {
  ^git rev-list --all --remotes --pretty=oneline | lines | parse "{value} {description}"
}

# Yield commits of current branch only. This is useful for e.g. cut points in
# `git rebase`.
def "nu-complete git commits current branch" [] {
  ^git log --pretty="%h %s" | lines | parse "{value} {description}"
}

# Yield local branches like `main`, `feature/typo_fix`
def "nu-complete git local branches" [] {
  ^git branch | lines | each { |line| $line | str replace '\* ' "" | str trim }
}

# Yield remote branches like `origin/main`, `upstream/feature-a`
def "nu-complete git remote branches with prefix" [] {
  ^git branch -r | lines | parse -r '^\*?(\s*|\s*\S* -> )(?P<branch>\S*$)' | get branch | uniq
}

# Yield remote branches *without* prefix which do not have a local counterpart.
# E.g. `upstream/feature-a` as `feature-a` to checkout and track in one command
# with `git checkout` or `git switch`.
def "nu-complete git remote branches nonlocal without prefix" [] {
  # Get regex to strip remotes prefixes. It will look like `(origin|upstream)`
  # for the two remotes `origin` and `upstream`.
  let remotes_regex = (["(", ((nu-complete git remotes | each {|r| [$r, '/'] | str join}) | str join "|"), ")"] | str join)
  let local_branches = (nu-complete git local branches)
  ^git branch -r | lines | parse -r (['^[\* ]+', $remotes_regex, '?(?P<branch>\S+)'] | flatten | str join) | get branch | uniq | where {|branch| $branch != "HEAD"} | where {|branch| $branch not-in $local_branches }
}

def "nu-complete git switch" [] {
  (nu-complete git local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete git remote branches nonlocal without prefix
			| parse "{value}"
			| insert description "remote branch")
}

def "nu-complete git checkout" [] {
  (nu-complete git local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete git remote branches nonlocal without prefix
			| parse "{value}"
			| insert description "remote branch")
  | append (nu-complete git remote branches with prefix
			| parse "{value}"
			| insert description "remote branch")
  | append (nu-complete git commits all)
}

# Arguments to `git rebase --onto <arg1> <arg2>`
def "nu-complete git rebase" [] {
  (nu-complete git local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete git remote branches with prefix
			| parse "{value}"
			| insert description "remote branch")
  | append (nu-complete git commits all)
}

def "nu-complete git stash-list" [] {
  git stash list | lines | parse "{value}: {description}"
}

def "nu-complete git tags" [] {
  ^git tag | lines
}

def "nu-complete git built-in-refs" [] {
  [HEAD FETCH_HEAD ORIG_HEAD]
}

def "nu-complete git refs" [] {
  nu-complete git switchable branches
  | parse "{value}"
  | insert description Branch
  | append (nu-complete git tags | parse "{value}" | insert description Tag)
  | append (nu-complete git built-in-refs)
}

def "nu-complete git subcommands" [] {
  ^git help -a | lines | where $it starts-with "   " | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

# Check out git branches and files
export extern "git checkout" [
  ...targets: string@"nu-complete git checkout"   # name of the branch or files to checkout
  --conflict: string                              # conflict style (merge or diff3)
  --detach(-d)                                    # detach HEAD at named commit
  --force(-f)                                     # force checkout (throw away local modifications)
  --guess                                         # second guess 'git checkout <no-such-branch>' (default)
  --ignore-other-worktrees                        # do not check if another worktree is holding the given ref
  --ignore-skip-worktree-bits                     # do not limit pathspecs to sparse entries only
  --merge(-m)                                     # perform a 3-way merge with the new branch
  --orphan: string                                # new unparented branch
  --ours(-2)                                      # checkout our version for unmerged files
  --overlay                                       # use overlay mode (default)
  --overwrite-ignore                              # update ignored files (default)
  --patch(-p)                                     # select hunks interactively
  --pathspec-from-file: string                    # read pathspec from file
  --progress                                      # force progress reporting
  --quiet(-q)                                     # suppress progress reporting
  --recurse-submodules: string                    # control recursive updating of submodules
  --theirs(-3)                                    # checkout their version for unmerged files
  --track(-t)                                     # set upstream info for new branch
  -b: string                                      # create and checkout a new branch
  -B: string                                      # create/reset and checkout a branch
  -l                                              # create reflog for new branch
]

# Download objects and refs from another repository
export extern "git fetch" [
  repository?: string@"nu-complete git remotes" # name of the branch to fetch
  --all                                         # Fetch all remotes
  --append(-a)                                  # Append ref names and object names to .git/FETCH_HEAD
  --atomic                                      # Use an atomic transaction to update local refs.
  --depth: int                                  # Limit fetching to n commits from the tip
  --deepen: int                                 # Limit fetching to n commits from the current shallow boundary
  --shallow-since: string                       # Deepen or shorten the history by date
  --shallow-exclude: string                     # Deepen or shorten the history by branch/tag
  --unshallow                                   # Fetch all available history
  --update-shallow                              # Update .git/shallow to accept new refs
  --negotiation-tip: string                     # Specify which commit/glob to report while fetching
  --negotiate-only                              # Do not fetch, only print common ancestors
  --dry-run                                     # Show what would be done
  --write-fetch-head                            # Write fetched refs in FETCH_HEAD (default)
  --no-write-fetch-head                         # Do not write FETCH_HEAD
  --force(-f)                                   # Always update the local branch
  --keep(-k)                                    # Keep dowloaded pack
  --multiple                                    # Allow several arguments to be specified
  --auto-maintenance                            # Run 'git maintenance run --auto' at the end (default)
  --no-auto-maintenance                         # Don't run 'git maintenance' at the end
  --auto-gc                                     # Run 'git maintenance run --auto' at the end (default)
  --no-auto-gc                                  # Don't run 'git maintenance' at the end
  --write-commit-graph                          # Write a commit-graph after fetching
  --no-write-commit-graph                       # Don't write a commit-graph after fetching
  --prefetch                                    # Place all refs into the refs/prefetch/ namespace
  --prune(-p)                                   # Remove obsolete remote-tracking references
  --prune-tags(-P)                              # Remove any local tags that do not exist on the remote
  --no-tags(-n)                                 # Disable automatic tag following
  --refmap: string                              # Use this refspec to map the refs to remote-tracking branches
  --tags(-t)                                    # Fetch all tags
  --recurse-submodules: string                  # Fetch new commits of populated submodules (yes/on-demand/no)
  --jobs(-j): int                               # Number of parallel children
  --no-recurse-submodules                       # Disable recursive fetching of submodules
  --set-upstream                                # Add upstream (tracking) reference
  --submodule-prefix: string                    # Prepend to paths printed in informative messages
  --upload-pack: string                         # Non-default path for remote command
  --quiet(-q)                                   # Silence internally used git commands
  --verbose(-v)                                 # Be verbose
  --progress                                    # Report progress on stderr
  --server-option(-o): string                   # Pass options for the server to handle
  --show-forced-updates                         # Check if a branch is force-updated
  --no-show-forced-updates                      # Don't check if a branch is force-updated
  -4                                            # Use IPv4 addresses, ignore IPv6 addresses
  -6                                            # Use IPv6 addresses, ignore IPv4 addresses
]

# Push changes
export extern "git push" [
  remote?: string@"nu-complete git remotes",         # the name of the remote
  ...refs: string@"nu-complete git local branches"   # the branch / refspec
  --all                                              # push all refs
  --atomic                                           # request atomic transaction on remote side
  --delete(-d)                                       # delete refs
  --dry-run(-n)                                      # dry run
  --exec: string                                     # receive pack program
  --follow-tags                                      # push missing but relevant tags
  --force-with-lease                                 # require old value of ref to be at this value
  --force(-f)                                        # force updates
  --ipv4(-4)                                         # use IPv4 addresses only
  --ipv6(-6)                                         # use IPv6 addresses only
  --mirror                                           # mirror all refs
  --no-verify                                        # bypass pre-push hook
  --porcelain                                        # machine-readable output
  --progress                                         # force progress reporting
  --prune                                            # prune locally removed refs
  --push-option(-o): string                          # option to transmit
  --quiet(-q)                                        # be more quiet
  --receive-pack: string                             # receive pack program
  --recurse-submodules: string                       # control recursive pushing of submodules
  --repo: string                                     # repository
  --set-upstream(-u)                                 # set upstream for git pull/status
  --signed: string                                   # GPG sign the push
  --tags                                             # push tags (can't be used with --all or --mirror)
  --thin                                             # use thin pack
  --verbose(-v)                                      # be more verbose
]

# Pull changes
export extern "git pull" [
  remote?: string@"nu-complete git remotes",         # the name of the remote
  ...refs: string@"nu-complete git local branches"   # the branch / refspec
  --rebase                                           # rebase current branch on top of upstream after fetching
]

# Switch between branches and commits
export extern "git switch" [
  switch?: string@"nu-complete git switch"        # name of branch to switch to
  --create(-c): string                            # create a new branch
  --detach(-d): string@"nu-complete git log"      # switch to a commit in a detatched state
  --force-create(-C): string                      # forces creation of new branch, if it exists then the existing branch will be reset to starting point
  --force(-f)                                     # alias for --discard-changes
  --guess                                         # if there is no local branch which matches then name but there is a remote one then this is checked out
  --ignore-other-worktrees                        # switch even if the ref is held by another worktree
  --merge(-m)                                     # attempts to merge changes when switching branches if there are local changes
  --no-guess                                      # do not attempt to match remote branch names
  --no-progress                                   # do not report progress
  --no-recurse-submodules                         # do not update the contents of sub-modules
  --no-track                                      # do not set "upstream" configuration
  --orphan: string                                # create a new orphaned branch
  --progress                                      # report progress status
  --quiet(-q)                                     # suppress feedback messages
  --recurse-submodules                            # update the contents of sub-modules
  --track(-t)                                     # set "upstream" configuration
]

# Apply the change introduced by an existing commit
export extern "git cherry-pick" [
  commit?: string@"nu-complete git commits all" # The commit ID to be cherry-picked
  --edit(-e)                                    # Edit the commit message prior to committing
  --no-commit(-n)                               # Apply changes without making any commit
  --signoff(-s)                                 # Add Signed-off-by line to the commit message
  --ff                                          # Fast-forward if possible
  --continue                                    # Continue the operation in progress
  --abort                                       # Cancel the operation
  --skip                                        # Skip the current commit and continue with the rest of the sequence
]

# Rebase the current branch
export extern "git rebase" [
  branch?: string@"nu-complete git rebase"    # name of the branch to rebase onto
  upstream?: string@"nu-complete git rebase"  # upstream branch to compare against
  --continue                                  # restart rebasing process after editing/resolving a conflict
  --abort                                     # abort rebase and reset HEAD to original branch
  --quit                                      # abort rebase but do not reset HEAD
  --interactive(-i)                           # rebase interactively with list of commits in editor
  --onto?: string@"nu-complete git rebase"    # starting point at which to create the new commits
  --root                                      # start rebase from root commit
]

# List or change branches
export extern "git branch" [
  branch?: string@"nu-complete git local branches"               # name of branch to operate on
  --abbrev                                                       # use short commit hash prefixes
  --edit-description                                             # open editor to edit branch description
  --merged                                                       # list reachable branches
  --no-merged                                                    # list unreachable branches
  --set-upstream-to: string@"nu-complete git available upstream" # set upstream for branch
  --unset-upstream                                               # remote upstream for branch
  --all                                                          # list both remote and local branches
  --copy                                                         # copy branch together with config and reflog
  --format                                                       # specify format for listing branches
  --move                                                         # rename branch
  --points-at                                                    # list branches that point at an object
  --show-current                                                 # print the name of the current branch
  --verbose                                                      # show commit and upstream for each branch
  --color                                                        # use color in output
  --quiet                                                        # suppress messages except errors
  --delete(-d)                                                   # delete branch
  --list                                                         # list branches
  --contains: string@"nu-complete git commits all"               # show only branches that contain the specified commit
  --no-contains                                                  # show only branches that don't contain specified commit
  --track(-t)                                                    # when creating a branch, set upstream
]

# List or change tracked repositories
export extern "git remote" [
  --verbose(-v)                            # Show URL for remotes
]

# Add a new tracked repository
export extern "git remote add" [
]

# Rename a tracked repository
export extern "git remote rename" [
  remote: string@"nu-complete git remotes"             # remote to rename
  new_name: string                                     # new name for remote
]

# Remove a tracked repository
export extern "git remote remove" [
  remote: string@"nu-complete git remotes"             # remote to remove
]

# Get the URL for a tracked repository
export extern "git remote get-url" [
  remote: string@"nu-complete git remotes"             # remote to get URL for
]

# Set the URL for a tracked repository
export extern "git remote set-url" [
  remote: string@"nu-complete git remotes"             # remote to set URL for
  url: string                                          # new URL for remote
]

# Show changes between commits, working tree etc
export extern "git diff" [
  rev1?: string@"nu-complete git refs"
  rev2?: string@"nu-complete git refs"
  --cached                                             # show staged changes
  --name-only                                          # only show names of changed files
  --name-status                                        # show changed files and kind of change
  --no-color                                           # disable color output
]

# Commit changes
export extern "git commit" [
  --all(-a)                                           # automatically stage all modified and deleted files
  --amend                                             # amend the previous commit rather than adding a new one
  --message(-m): string                               # specify the commit message rather than opening an editor
  --no-edit                                           # don't edit the commit message (useful with --amend)
]

# List commits
export extern "git log" [
  # Ideally we'd allow completion of revisions here, but that would make completion of filenames not work.
  -U                                                  # show diffs
  --follow                                            # show history beyond renames (single file only)
  --grep: string                                      # show log entries matching supplied regular expression
]

# Show or change the reflog
export extern "git reflog" [
]

# Stage files
export extern "git add" [
  --patch(-p)                                         # interactively choose hunks to stage
]

# Delete file from the working tree and the index
export extern "git rm" [
  -r                                                   # recursive
]

# Show the working tree status
export extern "git status" [
  --verbose(-v)                                       # verbose
]

# Stash changes for later
export extern "git stash push" [
  --patch(-p)                                         # interactively choose hunks to stash
]

# Unstash previously stashed changes
export extern "git stash pop" [
]

# List stashed changes
export extern "git stash list" [
]

# Show a stashed change
export extern "git stash show" [
  stash: string@"nu-complete git stash-list"
  -U                                                  # show diff
]

# Drop a stashed change
export extern "git stash drop" [
  stash: string@"nu-complete git stash-list"
]

# Create a new git repository
export extern "git init" [
  --initial-branch(-b)                                # initial branch name
]

# List or manipulate tags
export extern "git tag" [
  --delete(-d): string@"nu-complete git tags"         # delete a tag
]

# Start a binary search to find the commit that introduced a bug
export extern "git bisect start" [
  bad?: string                 # a commit that has the bug
  good?: string                # a commit that doesn't have the bug
]

# Mark the current (or specified) revision as bad
export extern "git bisect bad" [
]

# Mark the current (or specified) revision as good
export extern "git bisect good" [
]

# Skip the current (or specified) revision
export extern "git bisect skip" [
]

# End bisection
export extern "git bisect reset" [
]

# Show help for a git subcommand
export extern "git help" [
  command: string@"nu-complete git subcommands"       # subcommand to show help for
]

# https://github.com/Schniz/fnm/issues/463#issuecomment-1602216687
if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  let-env PATH = ($env.PATH | prepend [
	$"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}

source ~/.local/share/atuin/init.nu
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

#bind to ctrl-r in emacs, vi_normal and vi_insert modes, add any other bindings you want here too

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

def diary [] {
 let today = (date now | date format "%Y-%m-%d")
 let note = $"($env.HOME)/.nb/diary/($today).md"
 if ($note | path exists) {
	nb e $"diary:($today)"
 } else {
	nb add diary: --title $today
 }
}

def wglow [] {
  watch ~/.nb --glob=**/*.md {|op, path, new_path| clear; glow $path}
}

def compile_and_run [file] {
  clang++ $file -o output -std=c++17; ./output; rm output
}

def rconf [] {
	let a = $"(git diff --name-only --diff-filter=U | sed -n 1p)"
	if a != "" {
		nvim -c 'Gvdiffsplit!' "$a"
	}
}

# # echo next file with conflict
# def conf [] {
# 	let a = $"(git diff --name-only --diff-filter=U | sed -n 1p)"
# 	if a != "" {
# 		echo $a
# 	}
# }
#
# def ours [] {
# 	let FILE = $"(conf)"
# 	echo $FILE | git checkout --ours $in
# 	git add $FILE
# }
#
# # take local change
# function theirs() {
# 	FILE=$(conf)
# 	echo $FILE | xargs git checkout --theirs
# 	git add $FILE
# }
