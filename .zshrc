# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/john/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnosterAfro"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git hacker-quotes)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle <<EOBUNDLES
antigen-bundle zsh-users/zsh-syntax-highlighting
git
zsh-users/zsh-history-substring-search
thefuck
sublime
z
colored-man-pages
zsh-users/zsh-completions
extract
djui/alias-tips
sudo
KasperChristensen/mylocation
zlsun/solarized-man
RobSis/zsh-completion-generator
joel-porquet/zsh-dircolors-solarized.git
akoenig/gulp-autocompletion-zsh
akoenig/npm-run.plugin.zsh
lukechilds/zsh-better-npm-completion
zsh-users/zsh-completions
edouard-lopez/yeoman-zsh-plugin
chrissicool/zsh-bash
Tarrasch/zsh-colors
desyncr/key-bindings
supercrabtree/k
hlissner/zsh-autopair
psprint/zsh-navigation-tools
  desyncr/watch
    djui/alias-tips
jimhester/per-directory-history
unixorn/autoupdate-antigen.zshplugin
EOBUNDLES


antigen bundle debian
# You probably will want to install powerline fonts https://github.com/powerline/fonts
antigen theme robbyrussell/oh-my-zsh themes/agnoster

# Tell antigen that you're done.
antigen apply

# Automatically list directory contents on `cd`.
auto-ls () { ls --classify; }
chpwd_functions=( auto-ls $chpwd_functions )

# wohwohwohowhohohoho!
# fortune -s -n 300 | cowsay | lolcat

# end_time="$(date +%s)"
# echo .zshrc: $((end_time - start_time)) seconds

motd_mode='updates'

multiline_prompt='true'
# THE FUCK
eval "$(thefuck --alias)"
# Autocompletion for various things
which grunt >/dev/null    && eval "$(grunt --completion=zsh)"


# Is website down for everyone or just me ?
down4me() { curl -s "http://www.isup.me/$1" | sed '/just you/!d;s/<[^>]*>//g'; }
# Cool CLI weather display
weather() { curl wttr.in/$1 }
# Get external IP
whatsmyip() { echo "My external IP :`curl -s httpbin.org/ip | grep origin | awk -F: '{print $2}'`" }
# List commands from commandlinefu website
cmdfu() {
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" \
    | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" ;
}
# Is website down for everyone or just me ?
down4me() { curl -s "http://www.isup.me/$1" | sed '/just you/!d;s/<[^>]*>//g'; }

# Automatically list directory contents on `cd`.
auto-ls () { ls; }


# `s` with no arguments opens the current directory in Sublime Text, otherwise
# opens the given location
function s() {
  if [ $# -eq 0 ]; then
    subl .;
  else
    subl "$@";
  fi;
}

# `a` with no arguments opens the current directory in Atom Editor, otherwise
# opens the given location
function a() {
  if [ $# -eq 0 ]; then
    atom .;
  else
    atom "$@";
  fi;
}
# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}
# ls after cd
function chpwd() {
    emulate -L zsh
    la -a
}

# cd into whatever is the forefront Finder window.
function cdf() {
    cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}
