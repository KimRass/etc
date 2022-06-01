# Initialize
```bash
# `git init` is a one-time command you use during the initial setup of a new repository.
# Executing `git init` creates a ".git" subdirectory in the current working directory, which contains all of the necessary Git metadata for the new repository.
git init
```

# Clone Repository
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

# Configure User Information
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
# Create a new connection to a remote repository. After adding a remote, you’ll be able to use `＜remote_name＞` as a convenient shortcut for `＜repository_url＞` in other Git commands.
git remote add <remote_name> <repository_url>
```
## Remove Remote
```bash
git remote rm <remote_name>
```
## Modify Remote Name
```bash
git remote rename <old-name> <new-name>
```
## Modify Repository URL
```bash
git remote set-url <remote_name> "<repository_url>"
```

# Add Change to the Staging Area
```bash
# The `git add` command adds a change in the working directory to the staging area. It tells Git that you want to include updates to a particular file in the next commit. However, `git add` doesn't really affect the repository in any significant way—changes are not actually recorded until you run `git commit`.
git add <file1> <file2> ...
git add .
```
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

# Pull Repository
```bash
git pull [<remote_name> <branch_name>]
```
## Force `git pull`
```bash
git fetch --all
git reset --hard [<remote_name>/<branch_name>]
git pull [<remote_name> <branch_name>]
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
# Move the current branch backward by `1` commits, effectively removing the two snapshots we just created from the project history. Remember that this kind of reset should only be used on unpublished commits. Never perform the above operation if you’ve already pushed your commits to a shared repository.
git reset HEAD~1
```

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