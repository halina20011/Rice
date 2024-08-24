# The following lines were added by compinstall
zstyle :compinstall filename '/home/mario/.zshrc'

autoload -Uz compinit
compinit

function zle-line-init {
    marking=0
}
zle -N zle-line-init

function select-char-right {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .forward-char
}
zle -N select-char-right

function select-char-left {
    if (( $marking != 1 ))
    then
        marking=1
        zle set-mark-command
    fi
    zle .backward-char
}
zle -N select-char-left

function forward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .forward-char
}
zle -N forward-char

function backward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .backward-char
}
zle -N backward-char

function delete-char {
    if (( $marking == 1 ))
    then
        zle kill-region
        marking=0
    else
        zle .delete-char
    fi
}
zle -N delete-char

bindkey ';6D' select-word-left ## not working yet
bindkey ';6C' select-word-right ## not working yet
bindkey ';2D' select-char-left   # assuming xterm
bindkey ';2C' select-char-right  # assuming xterm
bindkey ';5D' backward-word
bindkey ';5C' forward-word
bindkey '^[[3~' delete-char

# End of lines added by compinstall
#
alias ls='ls --color=auto'
alias grep='grep --color=auto --exclude-dir=node_modules'
PS1='[%n@%M %C]$ '

function runAll {
    command=$1
    print $command
    containers=$(docker ps -q)

    # echo "$c" | while read -r $containers; 
    while read c; do
        echo "container $c"
        docker exec "$c" sh -c "$command"
    done <<< $containers

    # echo "$c"
}

function dockerExec {
    id=$2
    if [[ -z $id ]]; then
        id=$(docker ps -q | head -n 1)
    fi

    echo "container id: $id"

    docker exec -it $id $1
}

function healthCheck {
    docker inspect --format "{{json .State.Health }}" $1 | jq
}

alias l="ls"
alias nvim="nvim -p"
alias n="nvim"

# docker
alias dockerIp="docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
# alias di="dockerIp"
alias build="docker compose build --progress=plain"
alias buildN="docker compose build --progress=plain --no-cache"
alias up="docker compose down && docker compose up"
alias dp="docker ps"
alias dpa="docker ps -a"
alias dm="watch -n 1 docker ps"
alias dma="watch -n 1 docker ps -a"

alias dr="docker ps -q | xargs docker rm -f"
alias dre="docker ps -aq -f status=exited | xargs docker rm -f"
alias dra="docker ps -aq | xargs docker rm -f"

alias dn="docker network ls"
alias dnr="docker network prune -f"
alias de="runAll $1"
alias deb="dockerExec $1 bash"
alias dea="dockerExec $1 ash"
alias des="dockerExec $1 sh"
alias dh="healthCheck $1"


# ESP8266_RTOS_SDK
export PATH="$PATH:/usr/local/bin/xtensa-lx106-elf/bin"
export IDF_PATH=/home/mario/EE/ESP8266/ESP8266_RTOS_SDK

export PATH="$PATH:/home/mario/.local/bin/"

# Nodejs
VERSION=v20.11.0
DISTRO=linux-x64
PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

export COLUMNS=$(stty size | awk '{print $2}')
