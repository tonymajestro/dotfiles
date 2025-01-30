function brightness
    if test (count $argv) -eq 0
        ddcutil getvcp 10 --bus 4 --brief 2>/dev/null | awk '{ print $4 }'
    else
        ddcutil setvcp 10 $argv --bus 4 --noverify &>/dev/null
    end

end
