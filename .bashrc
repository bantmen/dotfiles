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

# git branch status
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias l=ls

# git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

alias gvim=/Applications/MacVim.app/Contents/bin/gvim

alias gsed=/usr/local/bin/sed
