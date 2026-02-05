ulimit -S -n 1024
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
