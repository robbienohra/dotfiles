export def rconf [] {
	let a = $"(git diff --name-only --diff-filter=U | sed -n 1p)"
	if a != "" {
		nvim -c 'Gvdiffsplit!' $a
	}
}

export def sq [] {
  git add .;
	git commit --fixup $"(git rev-parse head)" -n;
	git rebase -i head~2 --autosquash;
}


# # echo next file with conflict
# def conf [] {
# 	let a = $"(git diff --name-only --diff-filter=U | sed -n 1p)"
# 	if a != "" {
# 		echo $a
# 	}
# }
#
# def ours [] {
# 	let FILE = $"(conf)"
# 	echo $FILE | git checkout --ours $in
# 	git add $FILE
# }
#
# # take local change
# function theirs() {
# 	FILE=$(conf)
# 	echo $FILE | xargs git checkout --theirs
# 	git add $FILE
# }
