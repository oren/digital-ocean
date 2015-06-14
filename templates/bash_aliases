# bash function to decompress archives - http://www.shell-fu.org/lister.php?id=375
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

pg() {
  if [ $1 == "start" ]
  then
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
  else
    pg_ctl -D /usr/local/var/postgres stop -s -m fast
  fi
}

# Kudos to djanowski for this. Use ack to search files and open it in
# `vi` with the searched text as the last searched phrase in vi.
vack() {
  vi -p -c "/$1" $(ack -al $@)
}

function take() {
    mkdir -p "$1"
    cd "$1"
}

# git
ghpage() {

  git symbolic-ref HEAD refs/heads/gh-pages
  rm .git/index
  git clean -fdx
}

gush() {
  REMOTE_EXISTS=$(git branch -r | grep $(br))

  if [ -n "$REMOTE_EXISTS" ]; then
    git push origin $(br)
  else
    git push -u origin $(br)
  fi
}

gush() {
  REMOTE_EXISTS=$(git branch -r | grep $(br))

  if [ -n "$REMOTE_EXISTS" ]; then
    git push origin $(br)
  else
    git push -u origin $(br)
  fi
}

gup() {
  git pull origin $(br)
}

br() {
  test -d .git && git symbolic-ref HEAD 2> /dev/null | sed 's/refs\/heads\///'
}

# STEP 1: Run tunnel <hostname>
# STEP 2: Go to network, SOCKS proxy, and specify localhost 9999
# STEP 3: BAM, profit :-)
function tunnel() {
  ssh -ND 9999 $1
}

function reversproxy() {
  ssh $1 -R :9393:127.0.0.1:8080 sleep 99999
}

function encrypt-file() {
  cat "$1" | openssl des3 -salt -pass env:SECRET | openssl base64
}

function decrypt-file() {
 cat "$1" | openssl base64 -d | openssl des3 -salt -pass env:SECRET -d
}

# gsay -zh 你好
# curl -A "Mozilla/5.0" "http://translate.google.com/translate_tts?ie=UTF-8&tl=zh-cn&q=你好" 2>/dev/null > niaho.mp3
function gsay() {
  if [[ "${1}" =~ -[a-z]{2} ]]
  then
    local lang=${1#-}
    local text="${*#$1}"
  else
    local lang=${LANG%_*}
    local text="$*";fi
    mpv "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null
}

# gtrans "I live in Los Angeles"
gtrans() {
  if [[ "${1}" =~ -[a-z]{2} ]] && [[ "${2}" =~ -[a-z]{2} ]]
  then
          local slang=${1#-}
          local tlang=${2#-}
          local text="${@:3}"
          local text="${text// /+}"
  else
          local slang="auto"
          local tlang="zh-TW"
          local text="${*// /+}"
  fi

  # With pinyin
  curl -sLA "Mozilla/5.0" "http://translate.google.com/translate_a/t?client=p&ie=UTF8&oe=UTF8&sl=${slang}&tl=${tlang}&text="${text}"" | python -m json.tool | jq '.sentences' | sort -r | grep -oP 'trans(lit)?": "\K.*(?=",)'

  # Without pinyin
  #curl -sLA "Mozilla/5.0" "http://translate.google.com/translate_a/t?client=p&ie=UTF8&oe=UTF8&sl=${slang}&tl=${tlang}&text="${text}"" | python -m json.tool | jq '.sentences' | grep -oP '(?<=trans": ").*(?=",)'
}

## Search all files by default. This fixes the problem that *.css, *.less,
## *.sass files aren't usually seacrched.
alias ack="ack -a"
alias ..="cd .."  # Go up one dir.
alias c='cd'
alias l='ls --color'
alias ls='ls --color'
alias la='ls -Fa'
alias ld='ls -al -d * | egrep "^d"' # only subdirectories

alias in='sudo apt-get install -y'
alias pu='sudo apt-get purge'
alias se='aptitude search'
alias sh='apt-cache show'

alias r='reset'

# git
alias git=hub
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gpp='git pull && git push'
alias gco='git checkout'
alias gd='git diff'
alias gdm='git diff master'
alias gst='tig status'
alias g='git status -sb'
alias gpr='git pull --rebase'
alias gf='git fetch --prune'
alias gb='git branch'
alias ga='git add --all'
alias gcl='git clone'

# apps
alias v='vim'
alias pastebinit='pastebinit -a me -i'
alias s='python -m SimpleHTTPServer'
alias drm='docker stop $(docker ps -q) ; docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -f "dangling=true" -q)'

# docker
alias d='docker'
alias dc='docker-compose'
