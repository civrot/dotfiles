export EDITOR="/usr/bin/vi"
source ~/.aliases

# should add a ~/.custom that pulls in custom config
# ===================
# clymb specifics
# =================
alias pr='pry -r ./config/environment'
export PRY_ENABLED=true

export BETTER_ERRORS_ENABLED=true
export BETTER_ERRORS_EDITOR="viminiterm"

# ==================
#     tmux
# =================
export TERM="xterm-256color"
export PLATFORM="mac" # used by powerline

# ====================
#        git
# ====================
source ~/.git_prompt
source `brew --prefix git`/etc/bash_completion.d/git-completion.bash
export PS1="\$(git_info)\n\W\$ "
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# ====================
#      todotxt
# ====================
alias t='todo.sh'
export TODOTXT_DEFAULT_ACTION=ls
#export TODO_DIR=~/.todo.txt
#source `brew --prefix todo-txt`/etc/bash_completion.d/todo_completion
complete -F _todo t

source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
PATH=$HOME/bin:/usr/local/bin:$PATH:

# =====================
#    RBENV
# ====================
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-gcc=clang --with-openssl-dir=`brew --prefix openssl`"

source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

### Added by the Heroku Toolbelt
export PATH="~/.bin:/usr/local/heroku/bin:$PATH"


set -o vi
