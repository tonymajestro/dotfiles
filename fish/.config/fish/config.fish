if status is-interactive
end
set -gx EDITOR nvim

fzf --fish | source
zoxide init fish | source
starship init fish | source
