if status is-interactive
    set -gx EDITOR nvim
    fish_config theme choose CatppuccinMacchiato

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
end
