if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

starship init fish | source
zoxide init fish --cmd cd | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /mnt/Data/Coding/Dev/conda/bin/conda
    eval /mnt/Data/Coding/Dev/conda/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

