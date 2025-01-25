function brightness
    ddcutil setvcp 10 $argv &>/dev/null
end
