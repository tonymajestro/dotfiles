if status is-interactive
    set -gx EDITOR nvim

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
end
