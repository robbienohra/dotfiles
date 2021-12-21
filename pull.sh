dirs=(
  "~/soln"
  "~/snips"
  "~/notes/home"
  "~/notes/books"
)

for d in ${dirs[@]}; do
  git pull origin main
done
