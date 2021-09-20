export EDITOR="nvim"
source ~/.aliases

set -o vi
shopt -s autocd cdspell checkjobs direxpand dirspell nocaseglob nocasematch

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
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
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
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# ====================
#      heroku
# ====================
export PATH="~/.bin:/usr/local/heroku/bin:$PATH"

# ====================
#      pg
# ====================
export PATH=$PATH:/usr/local/opt/postgresql@10/bin

# ====================
#      nvm
# ===================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm without use until manuall called
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ====================
# fzf ripgrep
# ====================
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# =================
#      history
# ================
shopt -s histappend cmdhist
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND='history -a'

# ====================
#      local bashrc
# ====================
if [ -f ~/.dotfiles.local/bashrc ]
then
    source ~/.dotfiles.local/bashrc
fi

