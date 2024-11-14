export ANDROID_HOME=/Users/tldo/Library/Android/sdk 
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias rmvimbuf="rm -f /Users/tldo/.local/state/nvim/swap/*"
alias lsvimbuf="l /Users/tldo/.local/state/nvim/swap"
alias cleanvim="rm -rf ~/.local/state/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim"

brewSize(){
  for pkg in `brew list --formula -1 | grep -vE '\.|\.\.'`
    do echo $pkg `brew info $pkg | grep -E '[0-9]* files, ' | sed 's/^.*[0-9]* files, \(.*\)).*$/\1/' | awk '{print $1;}/[0-9]$/{s+=$1};/[mM][bB]$/{s+=$1*(1024*1024);next};/[kK][bB]$/{s+=$1*1024;next} END { suffix=" KMGT"; for(i=1; s>1024 && i < length(suffix); i++) s/=1024; printf "\t(all versions: %0.1f%s)",s,substr(suffix, i, 1), $3; }'`
  done
}

notifyMe() {
  if [ $? -eq 0 ]; then
    osascript -e 'display notification "The command worked" with title "Success"'
    say "I completed successfully"
  else
    osascript -e 'display notification "The command failed" with title "Failed"'
    say "I failed to run successfully"
  fi
}

# Dynamically add all node versions installed via nvm to beginning of PATH,
# to take precedence over any other node version 
# (i.e. installed via brew install node or any formula dependencies)
#for f in $HOME/.nvm/versions/node/*; do
#  if [ -d "$f" ]; then
#      PATH=$f/bin:$PATH
#  fi
#done

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
  fi

alias todo="nvim ~/vaults/work/todo.md"
alias func="nvim ~/Desktop/Basket/funckage/"

# System
alias edit="nvim ~/.config/.zprofile"
alias config="cd ~/.config/ && nvim ~/.config/"
alias ez="nvim ~/.zshrc"
alias l="ls -a"
alias ek="nvim ~/.config/kitty/kitty.conf"
alias labs="z ~/Desktop/Ajian/"
alias submit="source ~/.config/.zprofile"
alias desktop="z ~/Desktop"
alias downloads="z ~/Downloads"
alias basket="z ~/Desktop/Basket/"
alias configs="z ~/Desktop/Basket/config/ && nvim"
alias cl="clear"
alias tmp="z ~/Desktop/tmp"

alias work="z ~/vaults/work/ && nvim ."
alias personal="z ~/vaults/personal/ && nvim ."

# Nix Shell
alias nx="nix-shell"
alias nxcl="nix-collect-garbage"
# Git
alias gpom="git pull origin main"

# Task
alias taskui="taskwarrior-tui"

# Git
alias addssh="ssh-add ~/.ssh/git"
alias lzg="lazygit"

# Docker
alias lzd="lazydocker"
alias dps="docker ps"
alias dcd="docker-compose down"
alias dcud="docker-compose up -d"
alias dcu="docker-compose up"
alias dco='docker container'
alias dcol='docker container ls'
alias dcola='docker container ls -a'


# Hacks
alias hacks="z ~/Desktop/Hacks"
alias ganache_cli="docker rm -f ganache_cli && docker run -d -p 7545:8545 --name ganache_cli -v ganache-db:/data/db igmrrf/ganache_cli:latest ganache-cli -h 0.0.0.0 -m 'achieve broken shop annual ugly dirt bottom mandate popular federal two vast' -e 10 -a 100 -g 0x77359400 --db /data/db"
alias ganache="docker rm -f ganache && docker run -d -p 7545:8545 --name ganache -v ganache-db:/data/db igmrrf/ganache:latest ganache -h 0.0.0.0 -m 'achieve broken shop annual ugly dirt bottom mandate popular federal two vast' -e 10 -a 100 -g 0x77359400 --db /data/db"

# Nvim
alias ev="cd ~/.config/nvim && nvim"
alias v="nvim"
alias vim="vim"
alias notes="z ~/notes/ && nvim ~/notes/"
alias vaults="z ~/vaults/ && nvim ~/vaults/"
alias ss="nvim ~/notes/sync"
alias ez="nvim ~/.zshrc"
alias clvi="rm -rf ~/.cache/nvim ~/.local/state/nvim ~/.local/share/nvim"

#Android Studio
alias sdkmanager="~/Library/Android/sdk/cmdline-tools/latest/bin/sdkmanager"

# Yabai
alias edityabai="nvim ~/.config/yabai/yabairc"

# Skhd
alias editskhd="nvim ~/.config/skhd/skhdrc"

# Kitten Terminal
alias s="kitten ssh"

# tmux 
alias tme="nvim ~/.config/.tmux.conf"
alias tn="tmux new -s"
alias tls="tmux ls"
alias tde="tmux detach"
alias tat="tmux attach -t"
alias tki="tmux kill-session -t"

# SmartX
alias smartxapi="z ~/Desktop/Ajian/Contract/smart/smartx_v2_api && nvim"
alias smartxadmin="z ~/Desktop/Ajian/Contracts/smartx/smartx_v2_admin && nvim"
alias smartxapp="z ~/Desktop/Ajian/Contracts/smartx/smartx_v2_app && nvim"
alias smartx="z ~/Desktop/Ajian/Contracts/smartx/"

# Kunda box
alias box="z ~/Desktop/Box"
alias kunda="z ~/Desktop/Box/kundabox/ && nvim"
alias ktools="z ~/Desktop/Box/kundatools && nvim"

# NPC
alias npc="z ~/Desktop/NPC"
alias nftclient="z ~/Desktop/NPC/npp_client/ && nvim"
alias nftserver="z ~/Desktop/NPC/npp_server/ && nvim"

alias python="python3"
alias create-django="python3 -m venv ussop && z ussop && source ./bin/activate && pip3 install django && django-admin startproject "
alias pymigrations="python3 manage.py makemigrations"
alias pymigrate="python3 manage.py migrate"
alias start-django="python3 manage.py runserver"
alias start-app="python3 manage.py startapp main"

dectohex(){
    echo "Type a dec number"
    read decNum
    printf "The hexadecimal value of $decNum=%x\n" $decNum
}

hextodec(){
    echo "Type a hex number"
    read hexNum
    printf "The decimal value of $hexNum=%d\n" $((16#$hexNum))
}

createdjango(){
    # -n options lets the next line stay on the same line
    echo -n "What do you want to name your virtual environment?: "
    read virtual_env
    # read supplies it's input to $REPLY if not named
    python3 -m venv $virtual_env

    z $virtual_env
    source ./bin/activate

    pip3 install django

    read -p "What do you want to name your project?: " project_name
    echo "Creating $project_name Project..."
    django-admin startproject $project_name

    z $project_name

    echo "Finally, what do you want to name your first app?(main)"
    read first_app_name
    python3 manage.py startapp $first_app_name
    # show text and take in password
    # read -sp "Password: " password
    #
    # set a time limit
    # read -t 5 -sp "Password: " password
    # 
    # set a length limit
    # read -n 18 -sp "Enter Password (Max-Lenght:18): " passwordk
    # echo "Enter five numeric values for the array with space:"
    # Read values for the array
    # read -a MyArr

    # Print all array values
    # echo  ${MyArr[@]}

    # Print the first value of the array
    # echo  ${MyArr[0]}

    # Print the first two values of the array
    # echo  ${MyArr[@]:0:2}

    # Print the last value of the array
    # echo  ${MyArr[4]}

    # show text and take in inputs
}

alias activate="source ./venv/bin/activate"

deactivate () {
	if [ -n "${_OLD_VIRTUAL_PATH:-}" ]
	then
		PATH="${_OLD_VIRTUAL_PATH:-}"
		export PATH
		unset _OLD_VIRTUAL_PATH
	fi
	if [ -n "${_OLD_VIRTUAL_PYTHONHOME:-}" ]
	then
		PYTHONHOME="${_OLD_VIRTUAL_PYTHONHOME:-}"
		export PYTHONHOME
		unset _OLD_VIRTUAL_PYTHONHOME
	fi
	if [ -n "${BASH:-}" -o -n "${ZSH_VERSION:-}" ]
	then
		hash -r 2> /dev/null
	fi
	if [ -n "${_OLD_VIRTUAL_PS1:-}" ]
	then
		PS1="${_OLD_VIRTUAL_PS1:-}"
		export PS1
		unset _OLD_VIRTUAL_PS1
	fi
	unset VIRTUAL_ENV
	if [ ! "${1:-}" = "nondestructive" ]
	then
		unset -f deactivate
	fi
}

# FZF - Fuzzy finder
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fdv() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  nvim "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

fzfv() {
  nvim $(fzf --preview="cat {}" --height 50% --reverse)
}

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

 export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


eval "$(starship init zsh)"

