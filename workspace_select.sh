#/bin/bash

ENV_DIR=~/.env
WID_WORKSPACES=~/code/WID

PS3="Choose workspace (0 to cancel) :"

select workspace in `ls $WID_WORKSPACES`;
#select workspace in `ls $WID_WORKSPACES`;
do
  case $workspace in
    "")
      break
    ;;
    *)
      echo "Switching to $WID_WORKSPACE_NAME"
      export WID_WORKSPACE_NAME=$workspace
      export WID_WORKSPACE_DIR="$WID_WORKSPACES/$workspace"
      export PS1="\e[1;35mWID - $WID_WORKSPACE_NAME\n\e[0;37m[\u@\h \W]\$ "
      cd $WID_WORKSPACE_DIR
      break
    ;;
  esac
done


