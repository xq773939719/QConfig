#!/bin/bash
# ——————————————————————————————————————————————————————————————
cd
# 初始化Linux环境
sudo apt install git vim vim-gtk3 gnome tmux zsh npm nodejs cmake ssh synaptic terminator
sudo apt install build-essential linuxbrew-wrapper gnome-tweak-tool chrome-gnome-shell net-tools default-jdk

# 自定义环境
# "配置环境变量"
cd $HOME/QConfig/envs
cp .alias ~ && sudo echo "source '$HOME/.alias'" >> ~/.zshrc
cp .env ~ && sudo echo "source '$HOME/.env'" >> ~/.zshrc
cd $HOME/QConfig/
cp -R cmd $HOME/

# Linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> $HOME/.env

# 终端颜色
bash -c "$(wget -qO- https://git.io/vQgMr)" # 配置终端颜色

# https://www.94ish.me/
# http://www.mlxh.me/2743.htm
# 配置bbr
wget --no-check-certificate -O tcp.sh https://github.com/cx9208/Linux-NetSpeed/raw/master/tcp.sh && chmod +x tcp.sh && sudo ./tcp.sh
# 配置ssr
# wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh
# 配置V2ray
# https://github.com/233boy/v2ray/wiki/V2Ray
bash <(curl -s -L https://git.io/v2ray.sh)

# 设置默认终端
chsh -s `which zsh`
# 配置oh-my-zsh
cd
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo cat $HOME/QConfig/zsh/.zshrc > ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

# 配置tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
# 管理工具tpm 配置 使用 I 进行安装
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# 自定义tmux vi .tmux.conf 追加自定义内容
sudo cat $HOME/QConfig/tmux/.tmux.conf >> ~/.tmux.conf
tmux source ~/.tmux.conf

# 配置vim
cd
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# 管理工具 vim-plug 配置 使用 :PlugInstall 进行安装
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 自定义vim cd .vim_runtime 修改 my_configs.vim
touch ~/.vim_runtime/my_configs.vim

sudo cat $HOME/QConfig/vim/my_configs.vim > ~/.vim_runtime/my_configs.vim

# 配置spacevim
#SpaceVim curl -sLf https://spacevim.org/install.sh | bash
bash <(curl -fsSL https://git.io/vFUhE) # space-vim
# 添加我的自定义文件
sudo cat $HOME/QConfig/vim/.spacevim > ~/.spacevim
# 配置透明背景 放入.vimrc 软连接文件
# 配置vim 字体
# set gfn=monaco:h13 // mac
# set gfn=monaco:\h13 // mac
# colorscheme space-vim-dark
# hi Normal     ctermbg=NONE guibg=NONE
# hi LineNr     ctermbg=NONE guibg=NONE
# hi SignColumn ctermbg=NONE guibg=NONE


# 设置homebrew源
cd "$(brew --repo)" && git remote set-url origin https://git.coding.net/homebrew/homebrew.git
brew update

echo "配置命令行工具" >> configLinuxEnv.log
brew install archey protobuf graphicsmagick glew glfw llvm libimobiledevice
brew install ag htop thefuck tig tldr httpie nmap autojump cheat timothyye/tap/skm fzf you-get libav tree lolcat ffmpeg
brew install readline sqlite libpng pkg-config libtiff icu4c pcre gdbm git freetype xz imagemagick cmake
brew install tig mycli shellcheck yapf mosh fzf fpp axel ccache cloc mc icdiff pm ncdu ranger multitail bro
brew install bash-completion nmap screenfetch figlet tldr shellcheck cloc axel go coreutils lua tree luarocks

# 优秀的命令行工具
sudo apt install lolcat cloc mycli shellcheck mosh neofetch screenfetch ccache emacs awesome docky nload ncdu marble p7zip actiona cmatrix gnuplot
sudo npm config set registry https://registry.npm.taobao.org --global
sudo npm config set disturl https://npm.taobao.org/dist --global
sudo npm install figlet -g
sudo npm install gtop -g
sudo npm install bwm-ng -g
sudo npm install n -g
sudo npm install -g quicktype typescript
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install glances

# git clone https://gitee.com/wszqkzqk/deepin-wine-for-ubuntu.git deepin 架构
# 其他 minica mkcert gitlab

# manjaro https://zhuanlan.zhihu.com/p/50918522#%E5%AE%89%E8%A3%85
#         https://yqsas.com/2019/03/03/manjaro-in-t480s/
#         https://printempw.github.io/setting-up-manjaro-linux/
#         https://blog.triplez.cn/manjaro-quick-start/
#         https://yqc.im/linux-web-development-environment.html
#         https://www.yumenaka.net/2019/04/01/manjaroxfce/
#         https://www.jianshu.com/p/773344b619fe
#         https://hacpai.com/article/1572242922692
#         https://zhaoolee.com/GBlog/2019/07/02/install-manjaro/
#         http://panqiincs.me/2019/06/05/after-installing-manjaro/
# edebf798-1733-4c4e-b268-1d8d69aea614


# 以下是Manjaro配置

# pacman 安装方式
pacman -S package_name        # 安装软件
pacman -S extra/package_name  # 安装不同仓库中的版本
pacman -Syu                   # 升级整个系统，y 是更新数据库，yy 是强制更新，u 是升级软件
pacman -Ss string             # 在包数据库中查询软件
pacman -Si package_name       # 显示软件的详细信息
pacman -Sc                    # 清除软件缓存，即 /var/cache/pacman/pkg 目录下的文件
pacman -R package_name        # 删除单个软件
pacman -Rs package_name       # 删除指定软件及其没有被其他已安装软件使用的依赖关系
pacman -Qs string             # 查询已安装的软件包
pacman -Qi package_name       # 查询本地安装包的详细信息
pacman -Ql package_name       # 获取已安装软件所包含的文件的列表
pacman -U package.tar.zx      # 从本地文件安装
pactree package_name          # 显示软件的依赖树

# 换源
sudo pacman -Syy
sudo pacman-mirrors -i -c China -m rank
sudo pacman -Syyu
sudo vim /etc/pacman.conf
# [archlinuxcn]
# SigLevel = Optional TrustedOnly
# Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring

# 搜狗输入法
sudo pacman -S fcitx-sogoupinyin fcitx-im fcitx-configtool  # 输入法
# sudo pacman -S fcitx-lilydjwg-git fcitx-qt5
#常用拼音、日语输入法
# sudo pacman -S  fcitx fcitx-googlepinyin fcitx-mozc fcitx-cloudpinyin fcitx-configtool fcitx-gtk3 fcitx-gtk2
sudo vim ~/.xprofile
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS="@im=fcitx"

# 解决双系统时间不同步问题
sudo timedatectl set-local-rtc true

# HiDPI 设定 针对4k开启200%缩放 gnome 设定方式
gsettings set org.gnome.desktop.interface scaling-factor 2

# 通过pacman安装
sudo pacman -S vim git zsh tree \
     google-chrome netease-cloud-music virtualbox virtualbox-guest-dkms vmware-workstation \
     goldendict ttf-wps-fonts wps-office neofetch screenfetch lolcat \
     wiznote shadowsocks-qt5 electron-ssr proxychains-ng qtcreator visual-studio-code-bin make \
     screenfetch deepin.com.qq.im deepin.com.qq.office clang electronic-wechat-git gdb flameshot-git \
     wps-office net-tools base-devel docker docker-compose maven nodejs npm \
     telegram-desktop typora mailspring libsecret uget aria2 redshift deepin-screenshot \
     byobu cockpit aurman cockpit firefox firefox-i18n-zh-cn telegram-desktop dropbox chromium \
     simplescreensecorder kdenlive vlc deepin-movie foxitreader youdao-dict teamviewer file-roller \
     baidunetdisk deepin-picker rdesktop

# RIME 中州韵输入法是 Linux 下广受好评的中文输入法。鉴于搜狗输入法的 bug 不断（QT4），笔者更推荐 RIME 来作为中文输入法。
# sudo pacman -S fcitx-rime fcitx-cloudpinyin fcitx-googlepinyin 繁体可以配置成简体 上面网址有方法
# 设置普通用户使用 Docker 不需要使用 sudo
sudo groupadd docker
sudo usermod -aG docker $USER

# 字体
sudo pacman -S wqy-bitmapfont wqy-microhei \
  wqy-zenhei adobe-source-code-pro-fonts \
  adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts \
  adobe-source-han-sans-cn-fonts ttf-monaco ttf-dejavu ttf-hanazono \
  noto-fonts noto-fonts-cjk noto-fonts-emoji

# 通过yarout安装
sudo pacman -Sy yaourt
yaourt -S poppler-qt5 datagrip GitKraken
# 另一种方法
# yaourt -S visual-studio-code
# 有很多linux软件只提供.deb软件包，可以使用debtap将deb包转换成arch linxu包。
yaourt -S nvm debtap && sudo debtap -u
sudo debtap package_name.deb
sudo pacman -U package_name.pkg.tar.xz

# 通过yay安装
sudo pacman -S yay base-devel
# 设置 AUR 清华镜像源
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
# 开启 pacman 和 yay 的彩色输出
sudo sed -i "s/#Color/Color/g" /etc/pacman.conf
yay -S python-pip joplin deepin-wine-tim deepin-wine-wechat deepin-wine-thunderspeed tmux \
       yaru-gnome-shell-theme yaru-gtk-theme yaru-icon-theme yaru-session \
       deepin.com.qq.office lib32-freetype2-infinality-ultimate gimp noto-fonts-emoji \
       wps-office wps-office-fonts wps-office-mime ttf-wps-fonts gnome-tweak-tool \
# 高分屏 tim wechat
# env WINEPREFIX="$HOME/.deepinwine/Deepin-TIM" winecfg
# env WINEPREFIX="$HOME/.deepinwine/Deepin-WeChat" winecfg

# git 配置
$ git config --global user.name "Your_username"
$ git config --global user.email "your@email.com"
$ git config --global core.editor vim  # 使用 Vim 来编辑 Git 提交信息

# 开发配置
sudo pacman -S java-runtime-common java-environment-common
archlinux-java status
sudo archlinux-java set # status
sudo pacman -S redis
sudo systemctl start redis

yay -S sublime-text-dev

yay -S jetbrains-toolbox
yay -S postman
# 中文字体的最佳推荐，不然总会乱码。
yay -S wqy-bitmapfont
yay -S wqy-microhei
yay -S wqy-zenhei

sudo pacman -S ttf-roboto noto-fonts ttf-dejavu
# 文泉驿
sudo pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
# 思源字体
sudo pacman -S noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts

# mac 下的一些配置
# 终端信息显示脚本
# 英文版 原作者 https://github.com/obihann/archey-osx
# 中文版 https://github.com/athlonreg/archey-osx
sh -c "$(curl -fsSL https://raw.githubusercontent.com/athlonreg/archey-osx/master/bin/archey)"