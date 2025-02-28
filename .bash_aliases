alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias python="python3"
alias venv="source venv/bin/activate"
alias gooba="cd ~/AI/text-generation-webui/"
alias roci="python server.py --model TheDrummer_Rocinante-12B-v1.1-GGUF --n_ctx 16384 --auto-devices --listen --api --extensions api_openai --api-port 5000 --n-gpu-layers 30 --gpu-memory 20"
alias grepy="ps aux | grep python"
alias nvid="watch -n 2 nvidia-smi"
alias smi="nvidia-smi"
alias sooba="pkill -f server.py"
alias golama="cd ~/.ollama/"
alias olla="ollama --model magnum --prompt ':'"
