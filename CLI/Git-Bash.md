- Source: https://www.atlassian.com/git/tutorials/git-bash
- *Git Bash is an application for Microsoft Windows environments* which provides an emulation layer for a Git command line experience. Bash is an acronym for Bourne Again Shell. ***A shell is a terminal application used to interface with an operating system through written commands. Bash is a popular default shell on Linux and macOS. Git Bash is a package that installs Bash, some common bash utilities, and Git on a Windows operating system.***
- 
# `git init`
- `git init` is a one-time command you use during the initial setup of a new repository.
- Executing `git init` creates a ".git" subdirectory in the current working directory, which contains all of the necessary Git metadata for the new repository.

# `git clone`
```bash
# For public repository
git clone "https://github.com/....git"
# For private repository
git clone "https://<user_name>@github.com/....git"
```
## Clone Specific Branch
```bash
git clone -b <branch> --single-branch "https://...github.com/....git"
```

# `git status`

# `git config`
```bash
# Global level configuration(`--global`) is user-specific, meaning it is applied to an operating system user. Global configuration values are stored in a file that is located in a user's home directory.
git config [--global] user.email "<user_email>"
git config [--global] user.name "<user_name>"
```

# Remote
- The `git remote` command lets you create, view, and delete connections to other repositories. Remote connections are more like bookmarks rather than direct links into other repositories. Instead of providing real-time access to another repository, they serve as convenient names that can be used to reference a not-so-convenient URL.
```bash
git remote -v
```
- List the remote connections you have to other repositories. With `-v`, it includes the URL of each connection.
## Add Remote
```bash
git remote add <remote_name> <repository_url>
# Example
git remote add origin "https://github.com/KimRass/Programming.git"
```
- Create a new connection to a remote repository. After adding a remote, you’ll be able to use `＜name＞` as a convenient shortcut for `＜url＞` in other Git commands.
## Remove Remote
```bash
git remote rm <remote_name>
```
## Rename Remote
```bash
git remote rename <old-name> <new-name>
```
## `git remote set-url`
```bash
git remote set-url origin "git@github.com:KimRass/Work.git"
```
- https에서 ssh URL로 전환.
- SSH Public Key 등록한 다음에도 Git clone 시 ID/Password 인증을 요구하는 경우에는 git이 SSH로 생성된 것이 아니고, http로 생성된  경우입니다. 이 경우 현재 git의 URL을 `git remote -v`로  확인하고 SSH URL로 전환시켜줘야 합니다.

# Add Change to the Staging Area
```bash
git add <file1> <file2> ...
git add .
```
- The `git add` command adds a change in the working directory to the staging area. It tells Git that you want to include updates to a particular file in the next commit. However, git add doesn't really affect the repository in any significant way—changes are not actually recorded until you run `git commit`.
## Undo `git add`
```bash
git reset HEAD <file1> <file2> ...
```

# Remove File from the Staging Area
```bash
# 로컬 디렉토리와 git저장소 모두에서 파일을 삭제할 수 있습니다.
git rm <file1> <file2> ...

# 로컬 디렉토리는 유지, git저장소에서만 삭제합니다.
git rm --cached <file1> <file2> ...
```

# Remove Untracked File
```bash
git clean -f
# 디렉토리까지 지웁니다.
git clean -fd
```

# `git restore`
- The `git restore` command helps to unstage or even discard uncommitted local changes.

# Commit File
```bash
# The `git commit` command is used to commit a snapshot of the staging directory to the repositories commit history.
git commit -m "<message>"
# Commit과 함께 메시지를 변경합니다.
git commit --amend -m "<message>"
```
## Undo Commit File
```bash
# commit을 취소하고 해당 파일들은 unstaged 상태로 워킹 디렉터리에 보존
git reset --mixed HEAD^
# commit을 취소하고 해당 파일들은 staged 상태로 워킹 디렉터리에 보존
git reset --soft HEAD^
```

# Push
- The `git push` command is used to upload local repository content to a remote repository.
- Pushing has the potential to overwrite changes, caution should be taken when pushing.
- To prevent you from overwriting commits, Git won’t let you push when it results in a non-fast-forward merge in the destination repository.
```bash
git push [<remote_name> <branch_name>]
# Force `git push`
git push -f [<remote_name> <branch_name>]
```

# `git pull`
```bash
git pull [origin main]
```
## Force `git pull`
```bash
git fetch --all
git reset --hard [origin/main]
git pull [origin main]
```

# `git clean`
```bash
# Delete untracked files
git clean -f
# Delete untacked files and directories
git clean -fd
```

# Stash
```bash
# The `git stash` command takes your uncommitted changes (both staged and unstaged), saves them away for later use, and then reverts them from your working copy.
# `git stash` temporarily shelves (or stashes) changes you've made to your working copy so you can work on something else, and then come back and re-apply them later on.
git stash
...
# Reapply previously stashed changes.
git stash pop
```

# Fetch
```bash
# 원격저장소 변화정보 가져오기.
git fetch
```

# Reset
```bash
git reset HEAD~1
```
- Move the current branch backward by `1` commits, effectively removing the two snapshots we just created from the project history. Remember that this kind of reset should only be used on unpublished commits. Never perform the above operation if you’ve already pushed your commits to a shared repository.

# `git revert`

# Branch
## Create Branch
```bash
git checkout -b <branch_name>
```
### Create Branch from Another branch
```bash
git pull origin <branch_name1>
git checkout <branch_name1>
git checkout -b <branch_name2> <branch_name2>
```
## Switch to Branch
```bash
git checkout <branch_name>
```
## Merge
```bash
# `<branch_name>`에서 작업 내용을 가져옵니다.
git merge <branch_name>
```
## Abort Merge
```bash
git merge --abort
```

# From `git clone` to Pull Request
```bash
git clone "https://github.com/....git"
git remote add origin "https://github.com/....git"
git checkout -b "..."
git add "..."
git commit -m "..."
git push
...
깃헙에서 "Pull requests" -> "New pull request" -> merge 완료되면
git pull origin "devel"
git branch -d "..."
```

# ".DS_Store"
## Delete ALL ".DS_Store"
```bash
sudo find / -name ".DS_Store" -depth -exec rm {} \;
```
## Stop ".DS_Store" from Generating
```bash
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

# Convert from CRLF to LF
```bash
git config --global core.autocrlf true
```

# 메시지 입력 방법
- Source: https://velog.io/@ssmin0606/%EA%B0%9C%EB%B0%9C%ED%88%B4-Please-enter-a-commit-message-to-explain-why-this-merge-is-necessary-especially-if-it-merges-an-updated-upstream-into-a-topic-branch-%ED%95%B4%EA%B2%B0%ED%95%98%EA%B8%B0-git-bash
- "Please enter a commit message to explain why this merge is necessary, especially if it merges an updated upstream into a topic branch"
- 위 상황에서 메시지 입력 방법
- `i` -> 메시지 입력 -> Esc -> `:wq` -> Enter