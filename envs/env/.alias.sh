alias wl='ll | wc -l'
alias l='ls -l'
alias lh='ls -lh'
alias grep='grep -i --color' #用颜色标识，更醒目；忽略大小写
alias vi=vim
alias c='clear' # 快速清屏
alias p='pwd'
# 进入目录并列出文件，如 cdl ../conf.d/
cdl() {
  cd "$@" && pwd
  ls -alF
}

alias ..="cdl .."
alias ...="cd ../.." # 快速进入上上层目录
alias .3="cd ../../.."
alias cd..='cdl ..'

# alias cp="cp -iv"      # interactive, verbose
alias rm="rm -i" # interactive
# alias mv="mv -iv"       # interactive, verbose

alias psg='\ps aux | grep -v grep | grep --color' # 查看进程信息

# alias hg='history|grep'

alias netp='netstat -tulanp' # 查看服务器端口连接信息

alias lvim="vim -c \"normal '0\"" # 编辑vim最近打开的文件

alias tf='tail -f ' # 快速查看文件末尾输出

# 自动在文件末尾加上 .bak-日期 来备份文件，如 bu nginx.conf
bak() {
  cp "$@" "$@.bak"-$(date +%y%m%d)
  echo "$(date +%Y-%m-%d) backed up $PWD/$@"
}

# 级联创建目录并进入，如 mcd a/b/c
mcd() { mkdir -p $1 && cd $1 && pwd; }

# 查看去掉#注释和空行的配置文件，如 nocomm /etc/squid/squid.conf
alias nocomm='grep -Ev '\''^(#|$)'\'''

# 快速根据进程号pid杀死进程，如 psid tomcat， 然后 kill9 两个tab键提示要kill的进程号
alias kill9='kill -9'
psid() {
  [[ ! -n ${1} ]] && return                                                            # bail if no argument
  pro="[${1:0:1}]${1:1}"                                                               # process-name –> [p]rocess-name (makes grep better)
  ps axo pid,user,command | grep -v grep | grep -i --color ${pro}                      # show matching processes
  pids="$(ps axo pid,user,command | grep -v grep | grep -i ${pro} | awk '{print $1}')" # get pids
  complete -W "${pids}" kill9                                                          # make a completion list for kk
}

# 解压所有归档文件工具
function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
      *.tar.bz2) tar xvjf $1 ;;
      *.tar.gz) tar xvzf $1 ;;
      *.tar.xz) tar xvJf $1 ;;
      *.lzma) unlzma $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar x -ad $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xvf $1 ;;
      *.tbz2) tar xvjf $1 ;;
      *.tgz) tar xvzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *.xz) unxz $1 ;;
      *.exe) cabextract $1 ;;
      *) echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

# 其它
alias cr="clear"
alias h='history'
alias j='ls -F --color 2>/dev/null || ls -FG'
alias lsd='ls --color -d *(-/DN) 2>/dev/null || ls -dG *(-/DN)'
alias ll='ls --color -Fl --time-style=long-iso 2>/dev/null || ls -FGlT'
alias la='ls --color -FA 2>/dev/null || ls -FAG'
alias lla='ls -F --color --time-style=long-iso -lA 2>/dev/null || ls -lAFGT'
alias l='ls --color --time-style=long-iso -lFh 2>/dev/null || ls -lFhGT'
alias lsc='t=(*); echo $#t; unset t'
alias lscc='t=(* .*); echo $#t; unset t'
alias g='grep'
alias gv='grep -v'
alias rd='rmdir'
alias md='mkdir -p'
alias dh='df -h'
alias psa='ps aux'
alias psg='psa | grep -v grep | grep'
alias pk='pkill'
alias pk9='pkill -9'
alias ka='killall'
alias ka9='killall -9'
alias pst='pstree'
alias mt="top -u $USER"
alias ctime='time cat'
alias wi='which'
alias redir='rmdir **/*(/^F)'
alias cpui='grep MHz /proc/cpuinfo'
alias fng='find | grep -P'
alias ua='uname -a'
alias cu='curl -L'
alias tn='telnet'
alias to='touch'
alias hig='history 1 | grep -i'
alias lv='/Users/xq/.local/bin/lvim'
alias fixapp='sudo xattr -rd com.apple.quarantine'
alias vm=nvim
# alias ll='colorls -lA --sd --gs --group-directories-first'
# alias ls='colorls --group-directories-first'
# alias lc='colorls'                              # Colorls with no options
# alias l='colorls -l --sort-dirs'                # List
# alias ll='colorls -lA --git-status --sort-dirs' # List, show almost all files (excludes ./ and ../)
# alias la='colorls -la --sort-dirs'              # List, show all files
# alias lt='colorls -lt  --git-status'            # List, sort by modification time (newest first)
# alias lS='colorls -lS  --git-status'            # List, sort by size (largest first)
# alias lr='colorls --tree=5'                     # Show tree heirarchy, capped at depth 5 just in case
# alias lx='colorls -lAX --git-status'            # List, Sort by file type
alias gitpullall='find . -maxdepth 3 -type d -name .git  -exec sh -c "cd \"{}\"/../ && pwd && git  pull --rebase" \;'
alias o='open .'
alias e='code .'
alias abrew='arch -arm64 /opt/homebrew/bin/brew'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias sb='sh build.sh'

function Bili {
  alias bbgf='./bbgit fetch'
  alias bbgp='./bbgit pull'
  alias bbgc='./bbgit checkout'
  alias bbgr='./bbgit reset --hard'
  alias bbgd='./bbgit diff'
  alias bbgmr='./bbgit mr -t'
  alias bbgprune='./bbgit prune'
  alias bbsh='sh build.sh'
}
Bili

alias qCodes='cd /Volumes/Data/Codes'
alias chronos='qCodes && cd ./Bilibili/chronos'
alias loktar='qCodes && cd ./Bilibili/loktar'
alias andruid='qCodes && cd ./Bilibili/andruid'
