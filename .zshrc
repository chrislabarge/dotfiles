## If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [[ ! -d ~/.zplug ]];then git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "robbyrussell/oh-my-zsh"
zplug "dracula/zsh", as:theme
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rake vi-mode colorize colored-man-pages docker)

source $ZSH/oh-my-zsh.sh

HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# This allows for navigating the history list with my vim up/down
bindkey "^k" history-beginning-search-backward
bindkey "^j" history-beginning-search-forward

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
source /home/chris/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval `dircolors ~/Utilities/gnome-terminal-colors-dracula/dircolors`


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export GL_TOKEN='oTG_Am3PEwX-G_1wkmiK'
export GL_PROJECT_ID='6944112'

bindkey -M viins 'jk' vi-cmd-mode

# This is for the colorizie plugin
export ZSH_COLORIZE_TOOL=chroma

# Alias's
alias vim="nvim"
alias cat="ccat"
alias less="cless"
alias tmux="env TERM=screen-256color tmux"

alias dcr='docker-compose run web'
alias dcrspec='docker-compose run -e RAILS_ENV=test web rspec'
alias mount-remote='sshfs pi@192.168.0.31:/HDD-SEAGATE /HDD-REMOTE'
alias mount-documents='sshfs pi@192.168.0.31:/Documents /Documents'
alias mount-docs='mount-documents'

# git alias's
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gca='git commit --amend'
alias gd='git diff'
alias gdc='git diff --cached'
alias gco='git checkout '
alias gpom='git push origin master'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

# This is for oa dir env variable manager
eval "$(direnv hook zsh)"

# GO LANG
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export PATH="$PATH:~/Utilities/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Where Pip3 python install executables
export PATH="$PATH:$HOME/.local/bin"

# Add JAVA executable
export PATH="$PATH:/usr/java/jre1.8.0_261/bin"

# Add Custom Executables
export PATH="$PATH:~/Utilities/bin"

source /home/chris/.config/broot/launcher/bash/br
