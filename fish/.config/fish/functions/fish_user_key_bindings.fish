function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert

    bind \co --mode insert 'y; commandline -f repaint'

    bind -M insert -m default kj cancel repaint-mode
    set -g fish_sequence_key_delay_ms 150

    bind \cz --mode insert 'cd (zoxide query --interactive); commandline -f repaint'
end
