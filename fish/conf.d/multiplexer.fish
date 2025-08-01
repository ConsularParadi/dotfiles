if status is-interactive
and not set -q ZELLIJ
  # set ZELLIJ_AUTO_EXIT true
  # eval (zellij setup --generate-auto-start fish | string collect)
  zellij attach --create "home"
end
#
#    if test "$ZELLIJ_AUTO_ATTACH" = true
#        zellij attach -c
#    else
#        zellij
#    end
#
#    if test "$ZELLIJ_AUTO_EXIT" = true
#        kill $fish_pid
#    end
#end
