if status is-interactive
    if test (uname) = Darwin
        set -x PATH /opt/homebrew/bin $PATH
    end

    set -l dev_dir $HOME/.config/fish/dev
    if test -d "$dev_dir"
        source "$dev_dir"/*.fish
    end

    fish_config theme choose CatppuccinMacchiato

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
end
