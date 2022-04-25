# Nushell Environment Config File

let-env STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

#def create_left_prompt [] {
#    let path_segment = ($env.PWD)
#
#    $path_segment
#}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str collect)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { " 〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { " 〉" }
let-env PROMPT_INDICATOR_VI_NORMAL = { " :〉" }

let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

let-env PAGER = "bat"
let-env EDITOR = "nvim"

# Set the path
let-env PATH = ["/run/wrappers/bin",
                "/home/gnus/.nix-profile/bin",
                "/etc/profiles/per-user/gnus/bin",
                "/nix/var/nix/profiles/default/bin",
                "/run/current-system/sw/bin",
                "/home/gnus/.config/repos/dotfiles/bin"
                "/home/gnus/.local/bin"
                 ]

# aliases
alias vim = nvim
alias vi = nvim
alias suvi = sudo -e
alias :q = exit
alias ll = ls -l
alias la = ls -a
alias dotfiles = cd "~/.config/repos/dotfiles"
alias repos = cd "~/.config/repos"
alias bin = cd "~/.local/bin"
alias dl = cd "~/downloads"
alias iso = cd "~/iso"


# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | prepend '/some/path')
