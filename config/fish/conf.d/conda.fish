# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/consularparadi/Coding/Dev/conda/bin/conda
    eval /home/consularparadi/Coding/Dev/conda/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/consularparadi/Coding/Dev/conda/etc/fish/conf.d/conda.fish"
        . "/home/consularparadi/Coding/Dev/conda/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/consularparadi/Coding/Dev/conda/bin" $PATH
    end
end
# <<< conda initialize <<<

