abbr -a ga 'git add'
abbr -a gaa 'git add --all'
abbr -a gapa 'git add --patch'
abbr -a gau 'git add --update'
abbr -a gav 'git add --verbose'
abbr -a gap 'git apply'
abbr -a gapt 'git apply --3way'

abbr -a gb 'git branch'
abbr -a gba 'git branch --all'
abbr -a gbd 'git branch --delete'
abbr -a gbD 'git branch --delete --force'
abbr -a gbl 'git blame -b -w'
abbr -a gbm 'git branch --move'
abbr -a gbmc 'git branch --move (git_current_branch)'
abbr -a gbnm 'git branch --no-merged'
abbr -a gbr 'git branch --remote'
abbr -a gbs 'git bisect'
abbr -a gbsb 'git bisect bad'
abbr -a gbsg 'git bisect good'
abbr -a gbsn 'git bisect new'
abbr -a gbso 'git bisect old'
abbr -a gbsr 'git bisect reset'
abbr -a gbss 'git bisect start'

abbr -a gc 'git commit --verbose'
abbr -a gc! 'git commit --verbose --amend'
abbr -a gcn 'git commit --verbose --no-edit'
abbr -a gcn! 'git commit --verbose --no-edit --amend'
abbr -a gca 'git commit --verbose --all'
abbr -a gca! 'git commit --verbose --all --amend'
abbr -a gcan! 'git commit --verbose --all --no-edit --amend'
abbr -a gcans! 'git commit --verbose --all --signoff --no-edit --amend'
abbr -a gcam 'git commit --all --message'
abbr -a gcsm 'git commit --signoff --message'
abbr -a gcas 'git commit --all --signoff'
abbr -a gcasm 'git commit --all --signoff --message'
abbr -a gcb 'git checkout -b'
abbr -a gcd 'git checkout develop'
abbr -a gcf 'git config --list'

abbr -a gcl 'git clone --recurse-submodules'
abbr -a gclean 'git clean --interactive -d'

function gpristine
    git reset --hard
    git clean -d --force -x
end

abbr -a gcm 'git checkout (git_main_branch)'
abbr -a gcmsg 'git commit --message'
abbr -a gco 'git checkout'
abbr -a gcor 'git checkout --recurse-submodules'
abbr -a gcount 'git shortlog --summary --numbered'
abbr -a gcp 'git cherry-pick'
abbr -a gcpa 'git cherry-pick --abort'
abbr -a gcpc 'git cherry-pick --continue'
abbr -a gcs 'git commit --gpg-sign'
abbr -a gcss 'git commit --gpg-sign --signoff'
abbr -a gcssm 'git commit --gpg-sign --signoff --message'

abbr -a gd 'git diff'
abbr -a gdca 'git diff --cached'
abbr -a gdcw 'git diff --cached --word-diff'
abbr -a gdct 'git describe --tags (git rev-list --tags --max-count=1)'
abbr -a gds 'git diff --staged'
abbr -a gdt 'git diff-tree --no-commit-id --name-only -r'
abbr -a gdup 'git diff @{upstream}'
abbr -a gdw 'git diff --word-diff'

abbr -a gf 'git fetch'
abbr -a gfa 'git fetch --all --prune'
abbr -a gfo 'git fetch origin'

abbr -a gg 'git gui citool'
abbr -a gga 'git gui citool --amend'

abbr -a ghh 'git help'

abbr -a gignore 'git update-index --assume-unchanged'

abbr -a gl 'git log'
abbr -a glg 'git log --stat'
abbr -a glgp 'git log --stat --patch'
abbr -a glgg 'git log --graph'
abbr -a glgga 'git log --graph --decorate --all'
abbr -a glgm 'git log --graph --max-count=10'
abbr -a glo 'git log --oneline --decorate'
abbr -a glod 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
abbr -a glods 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
abbr -a glog 'git log --oneline --decorate --graph'
abbr -a gloga 'git log --oneline --decorate --graph --all'
abbr -a glol 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
abbr -a glola 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
abbr -a glols 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'

abbr -a gm 'git merge'
abbr -a gmtl 'git mergetool --no-prompt'
abbr -a gmtlvim 'git mergetool --no-prompt --tool=vimdiff'
abbr -a gma 'git merge --abort'

function gmom
    set main (git_main_branch)
    git merge origin/$main
end

abbr -a gp 'git push'
abbr -a gpd 'git push --dry-run'
abbr -a gpf 'git push --force-with-lease'
abbr -a gpf! 'git push --force'
abbr -a gpl 'git pull'

function gpoat
    git push origin --all
    git push origin --tags
end

abbr -a gpod 'git push origin --delete'
abbr -a gpodc 'git push origin --delete (git_current_branch)'
abbr -a gpr 'git pull --rebase'
abbr -a gpu 'git push upstream'
abbr -a gpv 'git push --verbose'

abbr -a gr 'git remote'
abbr -a gpra 'git pull --rebase --autostash'
abbr -a gprav 'git pull --rebase --autostash --verbose'
abbr -a gprv 'git pull --rebase --verbose'
abbr -a gpsup 'git push --set-upstream origin (git_current_branch)'
abbr -a gra 'git remote add'
abbr -a grb 'git rebase'
abbr -a grba 'git rebase --abort'
abbr -a grbc 'git rebase --continue'
abbr -a grbd 'git rebase develop'
abbr -a grbi 'git rebase --interactive'
abbr -a grbm 'git rebase (git_main_branch)'
abbr -a grbo 'git rebase --onto'
abbr -a grbs 'git rebase --skip'
abbr -a grev 'git revert'
abbr -a grh 'git reset'
abbr -a grhh 'git reset --hard'
abbr -a groh 'git reset origin/(git_current_branch) --hard'
abbr -a grm 'git rm'
abbr -a grmc 'git rm --cached'
abbr -a grmv 'git remote rename'
abbr -a grrm 'git remote remove'
abbr -a grs 'git restore'
abbr -a grset 'git remote set-url'
abbr -a grss 'git restore --source'
abbr -a grst 'git restore --staged'
abbr -a grt 'cd (git rev-parse --show-toplevel || echo .)'
abbr -a gru 'git reset --'
abbr -a grup 'git remote update'
abbr -a grv 'git remote --verbose'

abbr -a gsb 'git status --short --branch'
abbr -a gsd 'git svn dcommit'
abbr -a gsh 'git show'
abbr -a gshs 'git show -s'
abbr -a gsi 'git submodule init'
abbr -a gsps 'git show --pretty=short --show-signature'
abbr -a gsr 'git svn rebase'
abbr -a gss 'git status --short'
abbr -a gst 'git status'

abbr -a gsta 'git stash push'
abbr -a gstaa 'git stash apply'
abbr -a gstc 'git stash clear'
abbr -a gstd 'git stash drop'
abbr -a gstl 'git stash list'
abbr -a gstp 'git stash pop'
abbr -a gsts 'git stash show --text'
abbr -a gstu 'git stash push --include-untracked'
abbr -a gstall 'git stash --all'
abbr -a gsu 'git submodule update'
abbr -a gsw 'git switch'
abbr -a gswc 'git switch --create'

abbr -a gts 'git tag --sign'

function gtv
    git tag | sort
end

abbr -a glum 'git pull upstream (git_main_branch)'

abbr -a gunignore 'git update-index --no-assume-unchanged'
abbr -a gup 'git pull --rebase'
abbr -a gupv 'git pull --rebase --verbose'
abbr -a gupa 'git pull --rebase --autostash'
abbr -a gupav 'git pull --rebase --autostash --verbose'

abbr -a gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

abbr -a gwt 'git worktree'
abbr -a gwta 'git worktree add'
abbr -a gwtls 'git worktree list'
abbr -a gwtmv 'git worktree move'
abbr -a gwtrm 'git worktree remove'

abbr -a gam 'git am'
abbr -a gamc 'git am --continue'
abbr -a gams 'git am --skip'
abbr -a gama 'git am --abort'
abbr -a gamscp 'git am --show-current-patch'

