{ # Path
  export PATH=$PATH:$HOME/bin
  export PATH=$PATH:$HOME/cmd
  export PATH=$PATH:$HOME/.local/bin
  export PATH=$PATH:$HOME/.npm-global/bin
  export PATH=$PATH:$HOME/bin/depot_tools/
  export PATH=$PATH:/opt/homebrew/opt/ruby/bin
  export PATH=$PATH:/usr/local/opt/bison/bin:/opt/homebrew/opt/bison/bin
  export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/Library/Frameworks/Python3.framework/Versions/3.9/bin

}

{ # Args
  export PYTHONPATH=`lldb -P`
  export BREW_ROOT=/opt/homebrew/Caskroom
  export PUB_HOSTED_URL=https://pub.flutter-io.cn
  export GITLAB_HOME=$HOME/gitlab
  export SKIP_XCODE_VERSION_CHECK=1
  export USE_BAZEL_VERSION=latest
  export GIT_CACHE_PATH=/Volumes/Data/Cache/.git_cache
  export CHROMIUM_LLDBINIT_SOURCED=1
  export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
  export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/QPath/C # C
  export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$HOME/QPath/CPP # CPP
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node" # NVM

}

{ # Android
  export ANDROID_HOME=/Volumes/Data/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/ndk-bundle
  export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle/
  export NDK=$ANDROID_HOME/ndk-bundle/
}

{ # Flutter
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

{ # Electron
  export ECTREON_MIRROR=""
  # 工程源码
  export ELECTRON_PROJECT_DIR=/Volumes/Data/Codes/Electron/electron
  export ELECTRON_PROJECT_DIR_SRCROOT=$ELECTRON_PROJECT_DIR/src
  export ELECTRON_PROJECT_BUILD_TOOLS=$ELECTRON_PROJECT_DIR_SRCROOT/buildtools
  export CHROMIUM_BUILDTOOLS_PATH=$ELECTRON_PROJECT_BUILD_TOOLS
}