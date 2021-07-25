# Git Commands
Create empty Git repo in specified directory. Run with no
arguments to initialize the current directory as a git repository.

```sh
git init
```
Stage all changes in <directory> for the next commit.
Replace <directory> with a <file> to change a specific file.

```sh
git add
```
Clone repo located at <repo> onto local machine. Original repo can be
located on the local filesystem or on a remote machine via HTTP or SSH .

```sh
git clone <repo link>
```
Define author name to be used for all commits in current repo. Devs
commonly use --global flag to set config options for current user.

```sh
git config user.name <name>
```
Commit the staged snapshot, but instead of launching
a text editor, use <message> as the commit message.

```sh
git commit -m "<message>"
```
List which files are staged, unstaged, and untracked.

```sh
git status
```
Display the entire commit history using the default format.
For customization see additional options.
```sh
git log
```
Show unstaged changes between your index and
working directory.
```sh
git diff
```
Create new commit that undoes all of the changes made in
<commit> , then apply it to the current branch.
```sh
git revert <commit>
```
Remove <file> from the staging area, but leave the working directory
unchanged. This unstages a file without overwriting any changes.
```sh
git reset <file>
```
Shows which files would be removed from working directory.
Use the -f flag in place of the -n flag to execute the clean.
```sh
git clean -n
```
Replace the last commit with the staged changes and last commit
combined. Use with nothing staged to edit the last commit’s message.
```sh
git commit --amend
```
Rebase the current branch onto <base> . <base> can be a commit ID,
branch name, a tag, or a relative reference to HEAD.
```sh
git rebase <base>
```
Show a log of changes to the local repository’s HEAD .
Add --relative-date flag to show date info or --all to show all refs.
```sh
git reflog
```
List all of the branches in your repo. Add a <branch> argument to
create a new branch with the name <branch> .
```sh
git branch
```
Create and check out a new branch named <branch> .
Drop the -b flag to checkout an existing branch.
```sh
git checkout -b <branch>
```
Merge <branch> into the current branch.
```sh
git merge <branch>
```
Create a new connection to a remote repo. After adding a remote,
you can use <name> as a shortcut for <url> in other commands.
```sh
git remote add <name> <url>
```
Fetches a specific <branch> , from the repo. Leave off <branch>
to fetch all remote refs.
```sh
git fetch <remote> <branch>
```
Fetch the specified remote’s copy of current branch and
immediately merge it into the local copy.
```sh
git pull <remote>
```
Push the branch to <remote> , along with necessary commits and
objects. Creates named branch in the remote repo if it doesn’t exist.
```sh
git push <remote> <branch>
```