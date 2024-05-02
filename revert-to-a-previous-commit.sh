#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: You must provide a branch name and a commit hash."
    echo "Usage: $0 branch_name commit_hash"
    exit 1
fi

# Assign command line arguments to variables
branch=$1
commit=$2

# step 1: create a temp branch from the commit you want to revert to
git branch $branch-$commit $commit

# step 2: checkout the temp branch
git checkout $branch-$commit

# step 3: squash merge the branch into the temp branch
git merge --squash $branch

# step 4: commit the changes
git commit -m "$branch after $commit"

# step 5: revert the recent commit without opening the editor
git revert --no-edit HEAD

# step 6: copy the commit hash of the latest commit
commit_hash=$(git log --pretty=format:'%h' -n 1)

# step 7: checkout branch and cherry pick the latest commit in temp branch
git checkout $branch

# step 8: checkout branch and cherry pick the latest commit in temp branch
git cherry-pick $commit_hash

# step 9: delete the temp branch
git branch -D $branch-$commit
