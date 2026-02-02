
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

# Function to list available TUI commands
function list_tui_commands() {
  echo "Available TUI commands:"
  echo "- opencode: Interactive coding interface"
  echo "- claudecode: Claude Code CLI"
  echo "- qodercli: Qwen coder CLI"
  echo "- codex: GitHub Copilot CLI"
  echo "- qwen: Qwen CLI"
  echo "- toad: Database management CLI"
  echo ""
  echo "Development & Code Editors:"
  echo "- vim/nvim: Text editors"
  echo "- emacs: Text editor"
  echo "- micro: Modern terminal-based editor"
  echo "- code: VS Code CLI"
  echo "- helix: Fast modal editor"
  echo "- zed: Zed editor CLI"
  echo ""
  echo "System Monitoring & Management:"
  echo "- htop/top: System monitoring"
  echo "- atop: Advanced system monitor"
  echo "- iotop: I/O monitoring"
  echo "- nethogs: Network bandwidth monitor"
  echo "- glances: System information tool"
  echo "- bpytop: Resource monitor"
  echo "- gotop: Terminal dashboard"
  echo ""
  echo "Version Control & Git:"
  echo "- git: Version control"
  echo "- lazygit: Git TUI"
  echo "- tig: Git text-mode interface"
  echo "- hub: GitHub CLI wrapper"
  echo ""
  echo "File Management & Navigation:"
  echo "- ranger: File manager"
  echo "- lf: File manager"
  echo "- fzf: Fuzzy finder"
  echo "- fd: File finder"
  echo "- tree: Directory tree viewer"
  echo "- lsd: Modern ls command"
  echo "- broot: Directory tree explorer"
  echo ""
  echo "Package Management:"
  echo "- npm/yarn/pnpm: Node.js package managers"
  echo "- pip/pipx: Python package managers"
  echo "- cargo: Rust package manager"
  echo "- gem: Ruby package manager"
  echo "- go: Go tools"
  echo "- brew: Homebrew package manager"
  echo "- apt/yum/dnf: Linux package managers"
}
