export EDITOR="vim -v"
source ~/.aliases

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

# ====================
#      brew
# ====================
source `brew --prefix`/etc/bash_completion.d/brew
PATH=$HOME/bin:/usr/local/bin:$PATH:

# =====================
#    RBENV
# ====================
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-gcc=clang --with-openssl-dir=`brew --prefix openssl`"

# ====================
#      heroku
# ====================
export PATH="~/.bin:/usr/local/heroku/bin:$PATH"

# ====================
#      lunchy
# ====================
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
 if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
   . $LUNCHY_DIR/lunchy-completion.bash
 fi

# ====================
#      pg
# ====================
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
set -o vi

# ====================
#      awscli
# ====================
complete -C aws_completer aws

if [ -f ~/.dotfiles.local/bashrc ]
then
    source ~/.dotfiles.local/bashrc
fi

# Add the following to your ~/.bashrc or ~/.zshrc
#
# Alternatively, copy/symlink this file and source in your shell.  See `hitch --setup-path`.

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# Uncomment to persist pair info between terminal instances
hitch
