# launchctl setenv OLLAMA_HOST "0.0.0.0"
# launchctl setenv OLLAMA_MODELS /Volumes/Data/AI/ollama/models
ulimit -S -n 1024
export OLLAMA_API_BASE=http://127.0.0.1:11434 # Mac/Linux
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi