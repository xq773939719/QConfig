launchctl setenv OLLAMA_HOST "0.0.0.0"
launchctl setenv OLLAMA_MODELS /Volumes/Data/AI/ollama/models

export LMSTUDIO_API_BASE=http://localhost:1234
export OLLAMA_API_BASE=http://localhost:11434

export ANTHROPIC_API_KEY=""

function ANTHROPIC_LMSTUDIO() {
  export ANTHROPIC_AUTH_TOKEN="lmstudio"
  export ANTHROPIC_BASE_URL="$LMSTUDIO_API_BASE"
}

function ANTHROPIC_OLLAMA() {
  export ANTHROPIC_AUTH_TOKEN="ollama"
  export ANTHROPIC_BASE_URL="$OLLAMA_API_BASE"
}

function ANTHROPIC_DEFAULT() {
  unset ANTHROPIC_AUTH_TOKEN
  unset ANTHROPIC_BASE_URL
}

ANTHROPIC_OLLAMA