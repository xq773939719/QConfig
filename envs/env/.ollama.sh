#!/bin/bash

# Ollama AI Model Launcher
# Usage: source ~/env/.ollama.sh or . ~/env/.ollama.sh

# Interactive launcher for ollama models
ollama_launcher() {
    # Get available models from ollama
    echo "Fetching available models..."
    available_models=$(ollama list 2>/dev/null | tail -n +2 | awk '{print $1}' | sort)
    
    if [ -z "$available_models" ]; then
        echo "No models available. Please install some Ollama models first."
        return 1
    fi
    
    # Display available models
    echo "Available models:"
    echo "$available_models" | nl
    
    # Prompt for model selection
    echo
    read -p "Enter model name or number (or press Enter for default): " model_input
    
    # Process model input (convert number to model name if needed)
    if [[ $model_input =~ ^[0-9]+$ ]]; then
        selected_model=$(echo "$available_models" | sed -n "${model_input}p")
        if [ -z "$selected_model" ]; then
            echo "Invalid selection. Exiting."
            return 1
        fi
    elif [ -n "$model_input" ]; then
        selected_model="$model_input"
    else
        selected_model=""
    fi
    
    # Display AI options
    echo
    echo "Available AI systems:"
    echo "1) Claude"
    echo "2) Codex"
    echo "3) OpenCode"
    echo "4) OpenClaw"
    echo "5) All models"
    
    # Prompt for AI selection
    read -p "Select AI system (1-5): " ai_choice
    
    # Execute the selected option
    case $ai_choice in
        1)
            if [ -n "$selected_model" ]; then
                echo "Launching Claude with model: $selected_model"
                ollama launch claude --model "$selected_model"
            else
                echo "Launching Claude with default model"
                ollama launch claude --model ""
            fi
            ;;
        2)
            if [ -n "$selected_model" ]; then
                echo "Launching Codex with model: $selected_model"
                ollama launch codex --model "$selected_model"
            else
                echo "Launching Codex with default model"
                ollama launch codex --model ""
            fi
            ;;
        3)
            if [ -n "$selected_model" ]; then
                echo "Launching OpenCode with model: $selected_model"
                ollama launch opencode --model "$selected_model"
            else
                echo "Launching OpenCode with default model"
                ollama launch opencode --model ""
            fi
            ;;
        4)
            if [ -n "$selected_model" ]; then
                echo "Launching OpenClaw with model: $selected_model"
                ollama launch openclaw --model "$selected_model"
            else
                echo "Launching OpenClaw with default model"
                ollama launch openclaw --model ""
            fi
            ;;
        5)
            if [ -n "$selected_model" ]; then
                echo "Launching all models with: $selected_model"
                echo "Launching Claude..."
                ollama launch claude --model "$selected_model"
                echo "Launching Codex..."
                ollama launch codex --model "$selected_model"
                echo "Launching OpenCode..."
                ollama launch opencode --model "$selected_model"
                echo "Launching OpenClaw..."
                ollama launch openclaw --model "$selected_model"
            else
                echo "Launching all models with default"
                ollama launch claude --model ""
                ollama launch codex --model ""
                ollama launch opencode --model ""
                ollama launch openclaw --model ""
            fi
            ;;
        *)
            echo "Invalid choice. Exiting."
            return 1
            ;;
    esac
}

# Simple launcher function that uses positional arguments
simple_ollama_launch() {
    if [ $# -eq 0 ]; then
        echo "Usage: simple_ollama_launch <ai_type> [model]"
        echo "AI types: claude, codex, opencode, openclaw, all"
        echo "Example: simple_ollama_launch claude llama3"
        return 1
    fi
    
    ai_type=$1
    model=${2:-""}
    
    case $ai_type in
        "claude")
            if [ -n "$model" ]; then
                ollama launch claude --model "$model"
            else
                ollama launch claude --model ""
            fi
            ;;
        "codex")
            if [ -n "$model" ]; then
                ollama launch codex --model "$model"
            else
                ollama launch codex --model ""
            fi
            ;;
        "opencode")
            if [ -n "$model" ]; then
                ollama launch opencode --model "$model"
            else
                ollama launch opencode --model ""
            fi
            ;;
        "openclaw")
            if [ -n "$model" ]; then
                ollama launch openclaw --model "$model"
            else
                ollama launch openclaw --model ""
            fi
            ;;
        "all")
            if [ -n "$model" ]; then
                echo "Launching all models with: $model"
                ollama launch claude --model "$model"
                ollama launch codex --model "$model"
                ollama launch opencode --model "$model"
                ollama launch openclaw --model "$model"
            else
                echo "Launching all models with default"
                ollama launch claude --model ""
                ollama launch codex --model ""
                ollama launch opencode --model ""
                ollama launch openclaw --model ""
            fi
            ;;
        *)
            echo "Unknown AI type: $ai_type"
            echo "Available types: claude, codex, opencode, openclaw, all"
            return 1
            ;;
    esac
}

# Quick launch function with option to list models
quick_ollama_launch() {
    if [ $# -eq 0 ]; then
        echo "Usage: quick_ollama_launch <ai_type> [model]"
        echo "AI types: claude, codex, opencode, openclaw, all"
        echo "Omit model to get a list of available models"
        return 1
    fi
    
    ai_type=$1
    model=${2:-"list"}
    
    if [ "$model" = "list" ]; then
        echo "Available models:"
        ollama list 2>/dev/null | tail -n +2 | awk '{print $1}'
        return 0
    fi
    
    case $ai_type in
        "claude"|"codex"|"opencode"|"openclaw")
            echo "Launching $ai_type with model: $model"
            ollama launch $ai_type --model "$model"
            ;;
        "all")
            echo "Launching all models with: $model"
            ollama launch claude --model "$model"
            ollama launch codex --model "$model"
            ollama launch opencode --model "$model"
            ollama launch openclaw --model "$model"
            ;;
        *)
            echo "Unknown AI type: $ai_type"
            echo "Available types: claude, codex, opencode, openclaw, all"
            return 1
            ;;
    esac
}

# Function to display help information
ollama_help() {
    echo "Ollama launcher scripts loaded!"
    echo "Available functions:"
    echo "  ollama_launcher                 - Interactive mode to select AI and model"
    echo "  simple_ollama_launch TYPE [MODEL] - Simple command with AI type and optional model"
    echo "  quick_ollama_launch TYPE [MODEL]  - Quick launch with optional model listing"
    echo "  ollama_help                       - Display this help information"
    echo "    Examples:"
    echo "      simple_ollama_launch claude llama3"
    echo "      simple_ollama_launch all mistral"
    echo "      quick_ollama_launch claude    # Lists available models for claude"
    echo "      quick_ollama_launch all llama3"
}

# Display help automatically when script is sourced
ollama_help