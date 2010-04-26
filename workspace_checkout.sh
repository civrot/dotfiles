#/bin/bash

ENV_DIR=~/.env

SVN_URL=http://pgesvn/svn/WebSphereProgram/workspace/developer_workspaces/wid_projects

PS3="Choose workspace (0 to cancel) :"

select workspace in `svn ls $SVN_URL`;
do
  case $workspace in
    "")
      break
    ;;
    *)
      echo "Checking out $workspace"
      cd $WID_WORKSPACES
      svn co $SVN_URL/$workspace/trunk $workspace

      export WID_WORKSPACE_NAME=$workspace
      echo "Switching to $WID_WORKSPACE_NAME"
      export WID_WORKSPACE_DIR="$WID_WORKSPACES/$workspace"
      #export PS1="\e[1;35mWID - $WID_WORKSPACE_NAME\e[0;37m$(__git_ps1 " (%s)")\n[\u@\h \W]\$ "
      export PS1="\e[1;35m$WID_WORKSPACE_NAME  $LIGHT_CYAN\$(scm_display)$DEFAULT_COLOR\n[\u@\h \W]\$ "

	echo  $WID_WORKSPACE_DIR

      cd $WID_WORKSPACE_DIR 

      #./createWorkspace.sh
      break
    ;;
  esac
done


