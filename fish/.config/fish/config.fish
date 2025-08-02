if status is-interactive
    if test (uname) = Darwin
        set -x PATH /opt/homebrew/bin $PATH
    end

    set -l dev_config $HOME/.config/fish/dev/config.dev.fish
    if test -f "$dev_config"
        source "$dev_config"
    end

    fish_config theme choose CatppuccinMacchiato

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source

end
