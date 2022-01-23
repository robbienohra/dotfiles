token=$1
task_id=$2

comments=$(curl "https://api.todoist.com/rest/v1/comments?task_id=${task_id}" \
  -H "Authorization: Bearer ${token}")

echo $comments | jq -r '.[] .content' 
