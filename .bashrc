# grep
function g { grep -nr --include "*.$2" "$1" . --color --exclude='*.min.*'; }
function gi { grep -nri --include "*.$2" "$1" . --color; }
function ga { grep -nr --include "*" "$1" . --color; }
function gai { grep -nri --include "*" "$1" . --color; }
#function gr { git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"; }
function gr { git log --graph --oneline --decorate --all; }

# find
function f { find . -iname "$1"; }

# git diff
function d { git diff --color | diff-so-fancy; }
function ds { git show --color | diff-so-fancy; }
function db { git diff --color $1 | diff-so-fancy; }

# clang-format
function cf { clang-format -style=file -i $1; }

# git branch status in the prompt, handles venv
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export VIRTUAL_ENV_DISABLE_PROMPT=1 # prevent double adding
venv_prompt='${VIRTUAL_ENV:+(${VIRTUAL_ENV##*/}) }'
export PS1="${venv_prompt}\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias l=ls
alias gpom="git pull origin main"
alias gcom="git co main"
alias gam="git a -u && git c --amend --no-edit"
alias gpush="git a -u && git c --amend --no-edit && git p -f"
alias grbm="git fetch origin main && git rb origin/main"

# git aliases
git config --global alias.a add
git config --global alias.b branch
git config --global alias.br branch
git config --global alias.c commit
git config --global alias.s status
git config --global alias.st status
git config --global alias.d diff
git config --global alias.p push
git config --global alias.sh show
git config --global alias.co checkout
git config --global alias.cp cherry-pick
git config --global alias.rb rebase

# git diff-so-fancy setup
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

alias gvim=/Applications/MacVim.app/Contents/bin/gvim

alias gsed=/usr/local/bin/sed

gif_maker() {
    in=$1
    out=$2
    ffmpeg -y -i $in -vf fps=10,scale=320:-1:flags=lanczos,palettegen palette.png
    ffmpeg -i $in -i palette.png -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" $out
}

# vim
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias gvim=/Applications/MacVim.app/Contents/bin/gvim
alias vimdiff="gvim -d"
