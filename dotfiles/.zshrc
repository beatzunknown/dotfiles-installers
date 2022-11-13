# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
zstyle ':autocomplete:*' min-input 1

plugins=(git z zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/mnt/d/development/scripts/python:$HOME/.local/bin:$HOME/.cargo/bin

setopt histignorespace

## LINUX ALIASES/FUNCTIONS

# some ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias modzsh="nvim ~/.zshrc && source ~/.zshrc"
alias pg="sudo service postgresql"
alias psql="sudo -u postgres psql"
alias update-upgrade="sudo apt update && sudo apt upgrade -y"
alias mipsy="/opt/mipsy/target/debug/mipsy"
alias megabasterd="java -jar /opt/megabasterd/megabasterd.jar"

# media aliases
alias spatialmedia="python2 /mnt/c/apps/spatial-media-2.1/spatialmedia"
alias cvr="spatialmedia -i -s left-right"
alias yt-1080-split='yt-dlp -f "worstvideo[height=1080]+bestaudio[ext=m4a]"'
alias yt-1080-combined='yt-dlp -f "b[height=1080]"'

## WINDOWS (WSL) ALIASES/FUNCTIONS
alias dex2jar="d2j-dex2jar.sh"
alias cmd="cmd.exe"
alias binja="binaryninja.exe"
alias jd-gui="jd-gui.exe"
alias jadx="jadx.exe"
alias jeb="cmd.exe /c jeb.jar"
alias bytecode-viewer="cmd.exe /c bytecode-viewer.jar"
alias adb="adb.exe"
alias stegsolve="cmd.exe /c stegsolve.jar"
alias exercism="exercism.exe"
alias downonspot="/mnt/c/apps/DownOnSpot/target/release/down_on_spot"
alias adb-sync-music="adb.exe push --sync D:\\\\music /storage/9C33-6BBD/"

### USEFUL FUNCTIONS ###

# remove matches from history file to prevent
# data leakage during recordings
history-delete () {
    sed -i "/$1/d" "$HISTFILE"
    sed -i "/$1/d" "$HOME/.local/share/autojump/autojump.txt"
}

# sync shared folders between vm guest and host
vm-sync-shared () {
    if [ $# -ne 1 ]; then
        echo "usage: sync_shared mount_dir" >&2
        exit 1
    fi

    if [ ! -d $1 ]; then
        echo "$0: error: mount_dir must exist" >&2
        exit 1
    fi

    sudo mount -t fuse.vmhgfs-fuse .host:/ $1 -o allow_other && echo ".host:/ $1 fuse.vmhgfs-fuse allow_other 0 0" >>/etc/fstab
}

# cycle through VPN locations
vpn-cycle () {
    for x in $(piactl get regions | grep -v "^auto"); do
        piactl set region "$x" &&
        sleep 3s &&
        piactl get region &&
        sleep 25m;
    done;
}

# remove dots (.) and apostrophes from mkv files
mkv-rename() {
    rename "s/\./ /g" "$@" &&
    rename "s/ mkv/\.mkv/" "$@" &&
    rename "s/\'//g" "$@"
}

# remove title and set first text track as default subtitle
# for mkv files
mkv-rm-title-set-sub() {
    for f in "$@"
    do
        mkvpropedit --edit track:s1 --set flag-default=1 "$f"
        mkvpropedit -d "title" "$f"
    done
}

# compile and run single c file
gcc-run-single() {
    gcc -O -o "$1" "$1".c && ./"$1"
}
