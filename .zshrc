# Using custom software:
# - https://ohmyz.sh
# - https://github.com/sindresorhus/pure
# - https://github.com/lukechilds/zsh-nvm
# - https://github.com/zsh-users/zsh-autosuggestions
# - https://github.com/zsh-users/zsh-syntax-highlighting

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Disable automatic url escape
DISABLE_MAGIC_FUNCTIONS=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Leave this empty if using pure prompt
ZSH_THEME=""

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="%a %d-%m-%Y"

# Enable nvm lazy loading before loading the plugin
export NVM_LAZY_LOAD=false

# Disable syntax highlight for long strings (slows down paste)
export ZSH_HIGHLIGHT_MAXLENGTH=60

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages zsh-nvm zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Enable completion
autoload -Uz compinit && compinit

# Enable case sensitivity in globs
setopt NO_CASE_GLOB

# Enable automatic cd
setopt AUTO_CD

# Share history across multiple zsh sessions
setopt SHARE_HISTORY

# Append to history
setopt APPEND_HISTORY

# Adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# Expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST

# Do not store duplications
setopt HIST_IGNORE_DUPS

# Ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# Removes blank lines from history
setopt HIST_REDUCE_BLANKS

ZSH_HIGHLIGHT_STYLES[cursor]='bg=white'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# Add custom functions
fpath+="$HOME/.zsh/functions"

# Autoload all custom functions
for function in ~/.zsh/functions/*; do
  local fn=(${(s:/:)function})
  autoload -Uz $fn[-1]
done

# Prevents Pure from checking whether the current Git remote has been updated.
# This prevents excessive ssh verifications to be issued
PURE_GIT_PULL=0

# Initialize pure prompt
fpath+="$HOME/.zsh/pure"
autoload -Uz promptinit && promptinit
prompt pure

# Load local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Shortcuts
alias d="cd ~/Development"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
