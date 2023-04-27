#!/bin/bash

# Getting started. If the user provided the right number of arguments.

if [ $# -ne 2 ]; then
  echo "Usage: $0 <from_version> <to_version>"
  exit 1
fi

# Assigning those arguments to the variables.

from_version=$1
to_version=$2

# Definding pattern that is allowed and exceptions.

allowed="^POD(A|C)-[0-9]+ .+|MGMT-[0-9]+ .+"
exceptions="^Merge|Revert"

# Definding variable with a Git command that will pull up commits.
# %h - SHA of the commit; %s - message in commit; %an - author of commit.

commits=$(git log --pretty=format:"%h %s %an" "$from_version"..."$to_version")

# Creating a loop that will process each commit.

echo "$commits" | while IFS= read -r commit; do
  sha=$(echo "$commit" | cut -d ' ' -f1)
  message=$(echo "$commit" | awk '{sub(/^[0-9]+[[:space:]]*/,""); $NF=""; print $0}')
  author=$(echo "$commit" | awk '{print $NF}')
  
  if [[ $message =~ $allowed ]] || [[ $message =~ $exceptions ]]; then
    valid="TRUE"
  else
    valid="FALSE"
  fi

   echo "$sha $valid $author"
done