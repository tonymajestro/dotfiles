if status is-interactive
    if test (uname) = Darwin
        set -x PATH /opt/homebrew/bin $PATH
        set -x PATH /opt/homebrew/opt/node@20/bin $PATH
    end

    set -gx EDITOR nvim
    fish_config theme choose CatppuccinMacchiato

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
end
