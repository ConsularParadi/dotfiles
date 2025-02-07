if status is-interactive
    #     # Configure auto-attach/exit to your likings (default is off).
    set ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)
end

if not set -q ZELLIJ
    if test "$ZELLIJ_AUTO_ATTACH" = true
        zellij attach -c
    else
        zellij
    end

    if test "$ZELLIJ_AUTO_EXIT" = true
        kill $fish_pid
    end
end
