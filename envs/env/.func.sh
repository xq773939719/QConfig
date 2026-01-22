
function proxy_off() {
  unset no_proxy
  unset http_proxy
  unset https_proxy
  unset ftp_proxy
  unset rsync_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset FTP_PROXY
  unset RSYNC_PROXY
  env|grep -i proxy
  echo -e "已关闭代理"
}

function proxy_on() {
  export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy=$http_proxy
  export ftp_proxy=$http_proxy
  export rsync_proxy=$http_proxy
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$http_proxy
  export FTP_PROXY=$http_proxy
  export RSYNC_PROXY=$http_proxy
  env|grep -i proxy
  echo -e "已开启代理"
}

function daily_update() {
  brew update && brew upgrade
  rustup update
  pnpm self-update
  curl -fsSL https://bun.com/install | bash
  pip install --upgrade pip
  sdk selfupdate && sdk upgrade
  uv self update
  omz update
}
