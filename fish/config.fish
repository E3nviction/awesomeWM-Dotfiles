set -U fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# config
set HISTFILE ~/.histfile
set HISTSIZE 1000
set SAVEHIST 1000
# ZSH setopt autocd
# ZSH bindkey -e


# Config Files
source ~/.config/fish/functions/on_exit.fish


# Fuctions
source ~/.config/fish/functions/hydra.fish
source ~/.config/fish/functions/mountall.fish

# Custom Commands
alias c="clear"
alias h="cd ~/"
alias ll="eza --color=always --long --icons=always --no-time --no-user"
alias llall="eza --color=always --long --icons=always --no-time --no-user --all"
#alias tree="eza --tree --level=3 --color=always --long --icons=always --no-time --no-user"
#alias treeall="eza --tree --level=$1 --color=always --long --icons=always --no-time --no-user --all"
#unalias tree treeall
alias reload="source ~/.config/fish/config.fish;clear"
alias cll="c;ll"
alias q="exit"
alias chill="pipes.sh -p9 -t1 -t2 -t3 -t4 -t5 -t6 -t7 -t8 -t9 -r0"
alias pipes="pipes.sh -r0"
alias matrix="unimatrix -a -f -n -s 95"
# alias fetch="fastfetch"
# alias fortunedragon="cowsay -f dragon '$(fortune)' | lolcat"
alias bonsaiLinux="cbonsai -lt 5 -w 0,1 -L64 -p -m 'Hyprland'"
alias clock="tty-clock -c"
alias doom="emacs"
alias XPID="sleep 2;hyprctl activewindow"
alias zshconfig="$EDITOR .zshrc"
alias runapp="hyprctl dispatch exec"
alias welcome="/home/enviction/.config/scripts/welcome.sh"
alias fireplace="fireplace -t 15"
alias gay="echo Shut the FUCK up!"
alias asq="asciiquarium -t"

alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias code-oss="code-oss --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias discord="discord --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias spotify="spotify --enable-features=UseOzonePlatform --ozone-platform=wayland"
# alias obsidian="flatpak run md.obsidian.Obsidian"#XDG_SESSION_TYPE=x11 DISPLAY=:0 flatpak run md.obsidian.Obsidian"

# EVALS
#eval "$(fzf --zsh)"
#eval $(thefuck --alias f)
eval "$(starship init fish)"
#eval "$(starship completions fish)"


# Exports
export XCURSOR_THEME=Bibata-Modern-Classic
export PATH="$PATH:~/.config/emacs/bin"
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/enviction/.local/share/flatpak/exports/share
export XDG_SESSION_TYPE=x11
export DISPLAY=:0


# Autostarts
# systemctl start bluetooth.service

