#!/bin/bash

git config user.name sharan
git config user.email sharan.vayakkady@gmail.com
git config pull.rebase false
git fetch --all
git branch
git checkout main 
git pull origin main
git checkout -b staging origin/staging
git pull origin staging

# Merge staging into main and capture the output
merge_output=$(git merge main)

# Check if the merge output contains conflict markers
if [[ $merge_output == *"<<<<<<< HEAD"* ]]; then
  echo "Merge conflict found!"
  exit 1
else
  echo "Merge conflict not found."
fi
