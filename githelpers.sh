#!/bin/bash
 
function delete_local_merged_branches() {
  git branch --merged master | grep -v master | xargs git branch -d
}
 
function delete_remote_merged_branches() {
  for BRANCH in `git branch -r --merged origin/master |\
                 grep -v master |\
                 cut -d/ -f2-`
  do
    git push origin :$BRANCH
  done
}