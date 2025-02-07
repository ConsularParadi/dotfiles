set PATH $PATH /home/consularparadi/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -u QT_QPA_PLATFORM xcb

#Starship
starship init fish| source

#Zoxide
zoxide init fish | source

set -u GITHUB_ACCESS_TOKEN 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
