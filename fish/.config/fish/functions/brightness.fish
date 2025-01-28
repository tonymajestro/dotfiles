function brightness
    if test (count $argv) -eq 0
        ddcutil getvcp 10 2>/dev/null | awk '{ print substr($9, 1, length($9)-1) }'
    else
        ddcutil setvcp 10 $argv &>/dev/null
    end

end
