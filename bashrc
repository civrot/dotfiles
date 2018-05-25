export EDITOR="vim -v"
source ~/.aliases
source /usr/local/etc/bash_completion

# ==================
#     tmux
# =================
export TERM="xterm-256color"
export PLATFORM="mac" # used by powerline

# ====================
#        git
# ====================
source ~/.git_prompt
git_prompt="\$(git_info)"
if [[ $git_prompt != "" ]]; then
  export PS1="$git_prompt\W \$ "
else
  export PS1="\W \$ "
fi
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# ====================
#      brew
# ====================
source `brew --prefix`/etc/bash_completion.d/brew
PATH=$HOME/bin:/usr/local/bin:$PATH:
PATH=$HOME/.nodebrew/current/bin:$PATH

# =====================
#    RBENV
# ====================
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export CONFIGURE_OPTS="--with-readline-dir=/usr/local/opt/readline --with-gcc=clang --with-openssl-dir=/usr/local/opt/openssl"
# Following line is commented out, because the brew look up was slowing down bash startup
# export CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-gcc=clang --with-openssl-dir=`brew --prefix openssl`"

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

# ====================
#      nvm
# ====================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ====================
#      local bashrc
# ====================
if [ -f ~/.dotfiles.local/bashrc ]
then
    source ~/.dotfiles.local/bashrc
fi
