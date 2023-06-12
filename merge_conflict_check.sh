#!/bin/bash

# Check out the main branch
git checkout staging

# Merge staging into main and capture the output
merge_output=$(git merge main)

# Check if the merge output contains conflict markers
if [[ $merge_output == *"<<<<<<< HEAD"* ]]; then
  echo "Merge conflict found!"
  exit 1
else
  echo "Merge conflict not found."
fi
