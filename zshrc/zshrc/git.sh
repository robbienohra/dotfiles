# take remote change
function ours() {
	FILE=$(conf)
	echo $FILE | xargs git checkout --ours
	git add $FILE
}

# take local change
function theirs() {
	FILE=$(conf)
	echo $FILE | xargs git checkout --theirs
	git add $FILE
}

# check if branch contains commit
function ct() {
	g branch --contains $1
}

function is-ancestor() {
	MAYBE_ANCESTOR_COMMIT=$1
	DESCENDENT_COMMIT=$2
	git merge-base --is-ancestor $1 $2
	echo $?
}

function s() {
	gh pr view -w $(gh pr list --search "$@" --state merged --json number | jq '.[].number')
}

function prune() {
	git branch | egrep -v "(^\*|$1)" | xargs git branch -D
}
