#!/bin/bash

# depends on GitHub CLI to work

REPOS=(
    "nealwp/blobview"
    # ... put whatever repos you want here
)

BRANCH_NAME="example-branch-name" 
TARGET_BRANCH="main"
COMMIT_MESSAGE="commit msg"
PR_TITLE="pr title"
PR_BODY="pr body"

for REPO in "${REPOS[@]}"; do
    gh repo clone "$REPO" temp_repo > /dev/null 2>&1
    cd temp_repo

    git checkout -b "$BRANCH_NAME" > /dev/null 2>&1
    
    # do what you want to the repo here
    
    git add . > /dev/null 2>&1
    git commit -m "$COMMIT_MESSAGE" > /dev/null 2>&1
    git push -u origin "$BRANCH_NAME" > /dev/null 2>&1
    
    gh pr create --title "$PR_TITLE" --body "$PR_BODY" --head "$BRANCH_NAME" --base "$TARGET_BRANCH"
    
    cd ..
    rm -rf temp_repo
done

