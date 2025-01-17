function zd
    set dir (zoxide query --interactive)
    if test $status -eq 0
        cd $dir
    end
end
