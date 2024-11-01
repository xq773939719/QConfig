alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
	items=("Default" "LazyVim" "NvChad" "AstroNvim")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "Default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
