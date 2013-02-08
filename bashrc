export EDITOR="/usr/bin/vi"
. ~/.aliases

# should add a ~/.custom that pulls in custom config
# ===================
# clymb specifics
# =================
alias pr='pry -r ./config/environment'
export PRY_ENABLED=true

# ==================
#     tmux
# =================
export TERM="xterm-256color"
export PLATFORM="mac" # used by powerline

# ====================
#        git
# ====================
. ~/.git_prompt
. /usr/local/Cellar/git/1.7.11.1/etc/bash_completion.d/git-completion.bash
export PS1="\$(git_info)\W:\u \$ "
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# ====================
#      todotxt
# ====================
alias t='todo.sh -d ~/.todo.txt/todo.cfg'
export TODOTXT_DEFAULT_ACTION=ls
export TODO_DIR=~/.todo.txt
#. $TODO_DIR/todo_completion
complete -F _todo t


alias ls='ls -G'
PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin:/usr/local/mysql/bin


# ====================
#     RVM
# ====================
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
. ~/.rvm/scripts/rvm

source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
