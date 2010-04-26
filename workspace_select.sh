#/bin/bash

ENV_DIR=~/.env

PS3="Choose workspace (0 to cancel) :"

select workspace in `ls $WID_WORKSPACES`;
#select workspace in `ls $WID_WORKSPACES`;
do
  case $workspace in
    "")
      break
    ;;
    *)
      export WID_WORKSPACE_NAME=$workspace
      echo "Switching to $WID_WORKSPACE_NAME"
      export WID_WORKSPACE_DIR="$WID_WORKSPACES/$workspace"
      #export PS1="\e[1;35mWID - $WID_WORKSPACE_NAME\e[0;37m$(__git_ps1 " (%s)")\n[\u@\h \W]\$ "
      export PS1="\e[1;35m$WID_WORKSPACE_NAME  $LIGHT_CYAN\$(scm_display)$DEFAULT_COLOR\n[\u@\h \W]\$ "
      cd $WID_WORKSPACE_DIR
      break
    ;;
  esac
done


