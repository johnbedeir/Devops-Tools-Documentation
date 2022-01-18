# Git Basics
[Watch Git, Github, GitLab, Bitbucket شرح step by step on YouTube](https://youtu.be/MC5ZAyGl2bw)

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
# Undo Changes
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
# Rewriting Git History 
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
# Git Branches
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
# Remote Repositories
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
#Git Config
Define the author name to be used for all commits by the current user.
```sh
git config --global user.name <name>
```
Define the author email to be used for all commits by the current user.
```sh
git config --global user.email <email>
```
Create shortcut for a Git command. E.g. alias.glog “log --graph
--oneline” will set ”git glog” equivalent to ”git log --graph --oneline.
```sh
git config --globalalias. <alias-name> <git-command>
```
Set text editor used by commands for all users on the machine. <editor>
arg should be the command that launches the desired editor.
```sh
git config --systemcore.editor <editor>
```
Open the global configuration file in a text editor for manual editing.
```sh
git config --global --edit
```
# Git Diff
Show difference between working directory and last commit.
```sh
git diff HEAD
```
Show difference between staged changes and last commit
```sh
git diff --cached
```
# Git Rebase
Interactively rebase current branch onto <base> . Launches editor to enter
commands for how each commit will be transferred to the new base.
```sh
git rebase -i <base>
```
# Git Pull
Fetch the remote’s copy of current branch and rebases it into the local
copy. Uses git rebase instead of merge to integrate the branches.
```sh
git pull --rebase <remote>
```
# Git Push
Forces the git push even if it results in a non-fast-forward merge. Do not use
the --force flag unless you’re absolutely sure you know what you’re doing.
```sh
git push <remote> --force
```
Push all of your local branches to the specified remote.
```sh
git push <remote> --all
```
Tags aren’t automatically pushed when you push a branch or use the
--all flag. The --tags flag sends all of your local tags to the remote repo.
```sh
git push <remote> --tags
```
# Git Log
Limit number of commits by <limit> .
E.g. ”git log -5” will limit to 5 commits.
```sh
git log -<limit>
```
Condense each commit to a single line.
```sh
git log --online
```
Display the full diff of each commit.
```sh
git log -p
```
Include which files were altered and the relative number of
lines that were added or deleted from each of them.
```sh
git log --stat
```
Search for commits by a particular author.
```sh
git log --author=”<pattern>”
```
Search for commits with a commit message that
matches <pattern> .
```sh
git log --grep=”<pattern>”
```
Show commits that occur between <since> and <until> . Args can be a
commit ID, branch name, HEAD , or any other kind of revision reference.
```sh
git log <since>..<until>
```
Only display commits that have the specified file.
```sh
git log -- <file>
```
--graph flag draws a text based graph of commits on left side of commit msgs. --decorate adds names of branches or tags of commits shown.
```sh
git log --graph --decorate
```