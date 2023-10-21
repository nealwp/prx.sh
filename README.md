# prx.sh

Apply changes across multiple GitHub repositories

## About

Ever needed the same change in a bunch of repos? Look no further. Save yourself some time with prx.sh. For every repo in a list, this will:

* Clone the repo into a temp folder
* Checkout to a new branch
* Make the desired change
* Commit and push the changes
* Open a PR to merge to a target branch
* Clean up the temp folder

## Prereqs

* Ensure `gh` CLI is installed
* Run `gh auth login` and authenticate with your GitHub account

## How to Use

1. Clone this repo

    ```bash
    git clone git@github.com:nealwp/prx.sh.git
    ```

2. Update the repo list with the repos you want to affect. This list should be newline-delimited, not comma-delimited.

    ```bash
    REPOS=(
        "owner/repo1"
        "owner/repo2"
        "owner/repo3"
    )
    ```

3. Update the branch name, target branch, commit message, PR title, and PR body to the desired values

    ```bash
    BRANCH_NAME="example-branch-name" 
    TARGET_BRANCH="main"
    COMMIT_MESSAGE="example commit message"
    PR_TITLE="example pr title"
    PR_BODY="example pr body"
    ```

4. Add whatever changes you want applied to each repo

5. Save `prx.sh` and run `./prx.sh`
