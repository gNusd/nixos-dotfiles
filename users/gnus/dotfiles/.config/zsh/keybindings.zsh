# bind: "<ctrl>g" desc: "git add, commit, create buffer for commit message and push to github"
function git_prepare() {
if [ -n "$BUFFER" ];
		then
				BUFFER="git add . && git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
		then
				BUFFER="git add -A && git commit -v && git push"
		fi

		zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

# bind: "<ctrl>h" desc: "change directory to $HOME"
function home() {
		BUFFER="cd $HOME"
		zle accept-line
}
zle -N home
bindkey "^h" home
