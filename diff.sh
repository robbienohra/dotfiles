FILE=$1
REPO=$(gh repo view --json url | jq '.url' | tr -d '"')
PR=$(gh pr view --json number | jq '.number')
SHA=$(echo -n $FILE | sha256sum | head -c 64)
URL="$REPO/pull/$PR/files/#diff-$SHA"

open $URL
