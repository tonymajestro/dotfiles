if status is-interactive
    if test (uname) = Darwin
        set -x PATH /opt/homebrew/bin $PATH
    end

    fish_config theme choose CatppuccinMacchiato

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source

    source ~/.dev.fish
end
