# LEARN GIT BY EXAMPLES

## Revert to a previous commit

## # LEARN GIT BY EXAMPLES

## Revert to a previous commit

## How to remove second last commit and keep the last commit

To remove the second last commit while preserving the last commit, use:

```bash
git rebase -i HEAD~2
```

This will open an interactive rebase editor. In the editor:

1. You'll see the last 2 commits listed
2. Keep the last commit by leaving `pick` at the start
3. Delete the line with the second last commit (or change `pick` to `drop`)
4. Save and close the editor

Alternative method using reset:

```bash
# First, soft reset to go back 2 commits
git reset --soft HEAD~2

# Then create a new commit with all the changes
git commit -m "Combined commit message"
```

⚠️ Warning: Only use these commands on commits that haven't been pushed to a shared repository, as they modify git history.

```bash
git reset --hard HEAD~2
```
