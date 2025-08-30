{ # Path
  export PATH=$PATH:$HOME/bin
  export PATH=$PATH:$HOME/cmd
  export PATH=$PATH:$HOME/.local/bin
  export PATH=$PATH:$HOME/.npm-global/bin
  export PATH=$PATH:$HOME/bin/depot_tools
  export PATH=$PATH:$HOME/bin/flutter/bin
  export PATH=$PATH:$HOME/bin/memos
  export PATH=$PATH:$HOME/.deno/bin:$PATH
  export PATH=$PATH:/usr/local/opt/bison/bin:/opt/homebrew/opt/bison/bin
  export PATH=$PATH:/bin:/usr/bin:/usr/local/bin
  export PATH=$PATH:'"$(python3 -m site --user-base)"'/bin
  export PATH=$PATH:/opt/homebrew/opt/make/libexec/gnubin
  # export PATH=$PATH:/opt/homebrew/opt/ruby/bin
  # export PATH=$PATH:/opt/homebrew/opt/ruby@3.2/bin
  # export PATH=$PATH:/opt/homebrew/opt/llvm/bin
  # export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/Library/Frameworks/Python3.framework/Versions/3.9/bin
}

{ # rbenv
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export RUBY_BUILD_MIRROR_URL=https://cache.ruby-china.com
}

{ # NVMD
  export NVMD_DIR="$HOME/.nvmd"
  export PATH="$NVMD_DIR/bin:$PATH"
}

{ # Args
  export PYTHONPATH=`lldb -P`
  # export BREW_ROOT=/opt/homebrew/Caskroom
  export GITLAB_HOME=$HOME/gitlab
  # export SKIP_XCODE_VERSION_CHECK=1
  # export USE_BAZEL_VERSION=latest
  # export USE_BAZEL_VERSION=7.3.1
  export BAZELISK_BASE_URL=https://github.com/bazelbuild/bazel/releases/download
  export GIT_CACHE_PATH=/Volumes/Data/Cache/.git_cache
  export MACH_IGNORE_HGRC_STATE_DIR_MISMATCH=1
  export MOZBUILD_STATE_PATH=$HOME/.mozbuild
  export CHROMIUM_BUILDTOOLS_PATH=$HOME/bin/buildtools
  export CHROMIUM_LLDBINIT_SOURCED=1
  # export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
  export C_INCLUDE_PATH="$C_INCLUDE_PATH:$HOME/env/include" # C
  export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:$HOME/env/include" # CPP
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node" # NVM
  export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo' # 当前repo主要用于同步AOSP、chromium及chromium 
  export CMAKE_EXPORT_COMPILE_COMMANDS=1
  # export CMAKE_C_COMPILER="$(xcrun -find cc)"
  # export CMAKE_CXX_COMPILER="$(xcrun -find c++)"
  # export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
  # export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
}

{ # Android
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/ndk-bundle
  export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle/
  export NDK_HOME=$ANDROID_NDK_HOME
  export NDK=$ANDROID_NDK_HOME
}

{ # Flutter
  export PUB_HOSTED_URL=https://pub.flutter-io.cn
  export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
  # 工程源码
  export FLUTTER_PROJECT_DIR=/Volumes/Data/Codes/Flutter

  ## 引擎层配置
  export FLUTTER_ENGINE_PROJECT_DIR=$FLUTTER_PROJECT_DIR/engine
  export FLUTTER_ENGINE_PROJECT_SRCROOT=$FLUTTER_ENGINE_PROJECT_DIR/src
  export FLUTTER_ENGINE_SRCROOT=$FLUTTER_ENGINE_PROJECT_SRCROOT/flutter
  ### Flutter lib/web_ui
  export FLUTTER_ENGINE_SRCWEBUI=$FLUTTER_ENGINE_SRCROOT/lib/web_ui
  export PATH=$FLUTTER_ENGINE_SRCWEBUI/dev:$PATH

  ## Framework(sdk)层配置
  export FLUTTER_SDK_PROJECT_DIR=$FLUTTER_PROJECT_DIR/flutter
  export FLUTTER_ROOT=$FLUTTER_SDK_PROJECT_DIR/bin
  export PATH=FLUTTER_ROOT:$PATH
  export FLUTTER_SDK_PACKAGES=$FLUTTER_SDK_PROJECT_DIR/packages
  export FLUTTER_SDK_SRCROOT=$FLUTTER_SDK_PACKAGES/flutter
}

{ # CCache
  export USE_CCACHE=1
  export CCACHE_DIR="/Volumes/Data/Cache/ccache"
  export CCACHE_MAXSIZE="100G"
  export CCACHE_SLOPPINESS=file_macro,include_file_mtime,time_macros
  export CCACHE_UMASK=002
  export SCCACHE_CACHE_SIZE=10G
  export CCACHE_CPP2=true
  export CCACHE_HARDLINK=true
  export CCACHE_SLOPPINESS=file_macro,time_macros,include_file_mtime,include_file_ctime,file_stat_matches
}

{ # Electron
  export ELECTRON_MIRROR=""
  # 工程源码
  export ELECTRON_PROJECT_DIR="" # /Volumes/Data/Codes/Electron/electron
  export ELECTRON_PROJECT_DIR_SRCROOT="" # $ELECTRON_PROJECT_DIR/src
  export ELECTRON_PROJECT_BUILD_TOOLS="" # $ELECTRON_PROJECT_DIR_SRCROOT/buildtools
}

{ # Chromium
  export ECTREON_MIRROR=""
  # 工程源码
  export ELECTRON_PROJECT_DIR="" # /Volumes/Data/Codes/Chromium/electron
  export ELECTRON_PROJECT_DIR_SRCROOT="" # $ELECTRON_PROJECT_DIR/src
  export ELECTRON_PROJECT_BUILD_TOOLS="" # $ELECTRON_PROJECT_DIR_SRCROOT/buildtools
}

{ # Chromium Embedded Framework 
  export CEF_ROOT_DIR=$HOME/bin/cef
  export CEF_LIBRARY_RELEASE=$CEF_ROOT_DIR
  export CEF_LIBRARY_WRAPPER_RELEASE=$CEF_ROOT_DIR/Release
  export CEF_INCLUDE_DIR=$CEF_ROOT_DIR/include
}

