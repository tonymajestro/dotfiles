function brightness
    if test (count $argv) -eq 0
        ddcutil getvcp 10 --bus 4 2>/dev/null | awk '{ print substr($9, 1, length($9)-1) }'
    else
        ddcutil setvcp 10 $argv --bus 4 &>/dev/null
    end

end
