#!/bin/bash

# 通过输入命令运行: bash easychromium.sh

# 需要: XCode 5以上版本, OSX 10.9以上, 约10-20GB空间, 约3-5小时(16GB内存, 内存更少则时间更长)

# 本脚本用于从源代码构建最新版本的开源Chromium浏览器, 适用于OS X
# 完成后将[your folder]/src/out/Release/Chromium.app文件复制到/Applications/目录下

# 会检查是否已下载源码
# 会检查最新版本是否比本地安装版本更新


##############################
# 日志函数
##############################

LOGFILE="$(pwd)/logeasychromium.log"

log() {
    echo "$1" | tee -a "$LOGFILE"
}

##############################
# 版本比较函数
##############################

versions_check() {
    # 如果 $1 > $2 返回0, 否则返回1
    local ver1=$1 ver2=$2
    IFS='.' read -r -a ver1_parts <<< "$ver1"
    IFS='.' read -r -a ver2_parts <<< "$ver2"

    local i=0
    while [[ $i -lt ${#ver1_parts[@]} || $i -lt ${#ver2_parts[@]} ]]; do
        local part1=${ver1_parts[i]:-0}
        local part2=${ver2_parts[i]:-0}
        if ((10#$part1 > 10#$part2)); then
            return 0
        elif ((10#$part1 < 10#$part2)); then
            return 1
        fi
        ((i++))
    done
    return 1
}

##############################
# 环境检查函数
##############################

check_git() {
    # 检查git版本是否满足要求
    if command -V git >/dev/null 2>&1; then
        for cmd in git; do
            [[ $("$cmd" --version) =~ ([0-9][.][0-9.]*) ]] && version="${BASH_REMATCH[1]}"
            var1=$(echo "$version" | cut -d. -f1)
            var2=$(echo "$version" | cut -d. -f2)
            var3=$(echo "$version" | cut -d. -f3)

            if [[ $var1 -lt 2 ]]; then
                log "错误: 需要git版本2.2.1或更高"
                exit 1
            fi
            if [[ $var1 -eq 2 && $var2 -lt 2 ]]; then
                log "错误: 需要git版本2.2.1或更高"
                exit 1
            fi
            if [[ $var1 -eq 2 && $var2 -eq 2 && $var3 -lt 1 ]]; then
                log "错误: 需要git版本2.2.1或更高"
                exit 1
            fi
        done
    else
        log "错误: 未安装git, 请安装Xcode和xcode-cli获取git, 或使用brew安装git"
        exit 1
    fi
}

check_xcode() {
    # 检查Xcode版本是否满足要求
    local XCODE_CHECK
    XCODE_CHECK="$(command xcodebuild -version 2>&1)"
    if [[ "$XCODE_CHECK" =~ "requires" ]]; then
        log "未找到Xcode, 请查看本仓库中的xcodehelp.txt并安装Xcode。"
        exit 1
    elif [[ "$XCODE_CHECK" =~ "note" ]]; then
        log "未找到Xcode和xcode-cli, 请查看本仓库中的xcodehelp.txt并安装Xcode。"
        exit 1
    else
        log "检测到Xcode, 测试版本"
        for cmd in xcodebuild; do
            [[ $("$cmd" -version) =~ ([0-9][.][0-9.]*) ]] && version="${BASH_REMATCH[1]}"
            if ! awk -v ver="$version" 'BEGIN { if (ver < 5.0) exit 1; }'; then
                log "错误: 需要xcodebuild版本5.0或更高"
                log "检测到的XCode版本为: $version"
                exit 1
            fi
            log "检测到的XCode版本为: $version"
        done
    fi
}

check_depot_tools() {
    # 检查depot_tools目录并更新PATH
    if [ -d ./depot_tools/ ]; then
        log "检测到./depot_tools/, 更新PATH"
    else
        log "未检测到./depot_tools/, 通过git clone获取"
        git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
        if [[ $? -eq 0 ]]; then
            log "git clone depot_tools成功"
        else
            log "git clone depot_tools失败, 退出"
            exit 1
        fi
    fi

    export PATH=$(pwd)/depot_tools:"$PATH"
    if [[ $? -eq 0 ]]; then
        log "PATH成功更新为 $PATH"
        log "此PATH更新为非永久, 仅对当前shell会话有效"
    else
        log "更新PATH以包含depot_tools失败, 退出"
        exit 1
    fi
}

check_chromium_version() {
	# 获取当前Chromium版本的CSV, 保存为文件"releasestargets"无扩展名
	curl https://omahaproxy.appspot.com/all -o releasestargets

	# 返回mac平台当前稳定版Chromium版本号, 按逗号切割
	# 示例: 48.0.2564.116
	TARGET=$(grep mac,stable, releasestargets | cut -d, -f3)
	log "目标Chromium版本为: $TARGET"
	rm releasestargets

	if [ -d /Applications/Chromium.app/ ]; then
			log "检测到/Applications/中已有Chromium"
			log "检查最新稳定版本是否比当前安装版本更新"
			CURRENT=$(mdls -name kMDItemVersion /Applications/Chromium.app/ | awk '/kMDItemVersion/{print $NF}' | sed 's/"//g')
			log "当前版本为: $CURRENT"

			# if versions_check "$TARGET" "$CURRENT"; then
			# 		log "目标版本比当前版本新, 继续更新"
			# else
			# 		log "目标版本不比当前版本新, 终止"
			# 		exit 1
			# fi
	else
			log "未检测到/Applications/中的Chromium, 准备从最新稳定版构建"
	fi
}

##############################
# 同步
##############################

sync_chromium() {
    local SKIP_FETCH=0

    # 检查参数
    if [ "$1" = "--skip-fetch" ]; then
        SKIP_FETCH=1
        log "跳过 git fetch / checkout / gclient sync 步骤"
    fi

    if [ -d ./src/ ]; then
        log "检测到./src/, 执行gclient sync master"
    else
        log "未检测到./src/, 假设为全新安装, 获取chromium源码"
        fetch chromium
        if [[ $? -ne 0 ]]; then
            log "fetch chromium失败, 退出"
            exit 1
        fi
    fi

    cd src
    SRC_PATH=$(pwd)
    log "源码路径: $SRC_PATH"

    if [ "$SKIP_FETCH" -eq 0 ]; then
        git fetch --tags origin
        git checkout -B new_release$TARGET tags/$TARGET
        gclient sync --verbose --with_branch_heads --jobs 16
    else
        log "跳过 fetch/checkout/sync"
    fi

    # git status >/dev/null 2>&1
}

##############################
# 生成&&构建
##############################

build_chromium() {
    log "开始生成 GN 构建文件"

    common='target_os="mac" target_cpu="arm64"'

    # 发布版构建参数
    release='is_debug=false symbol_level=1 is_component_build=false enable_stripping=true ffmpeg_branding="Chromium" proprietary_codecs=false use_thin_lto=true'

    # 调试版构建参数
    debug='is_debug=true symbol_level=2 is_component_build=true dcheck_always_on=true'

    # 获取模式参数，默认使用 debug
    mode=${1:-debug}
    build_dir="out/${mode}"

    # 选择对应参数
    if [ "$mode" = "debug" ]; then
        args="$common $debug"
    elif [ "$mode" = "release" ]; then
        args="$common $release"
    else
        echo "❌ 未知构建模式：$mode(应为 debug 或 release)"
        return 1
    fi

    log "当前构建参数 $args"
    log "生成 $mode 模式的 GN 构建文件到 $build_dir"
    gn gen "$build_dir" --args="${args}"

    log "开始使用 ninja 构建 Chromium"
    ninja -C "$build_dir" chrome
}

##############################
# 主脚本开始
##############################

# log "=========新的构建尝试========="
# log "$(date)"
# log "=========新的构建尝试========="

OS_VERSION=$(sw_vers -productVersion)
log "检测到的OS X版本 $OS_VERSION"

log "开始软件版本检查"

check_git
check_xcode
check_depot_tools
check_chromium_version

log "#### 构建前检查完成 ####"

log "#### 开始构建 ####"

sync_chromium --skip-fetch
build_chromium debug