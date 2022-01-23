token=$(pass show doist)
task_id=$1

comments=$(curl "https://api.todoist.com/rest/v1/comments?task_id=${task_id}" \
  -H "Authorization: Bearer ${token}")

echo $comments | jq -r '.[] | .content, .attachment.file_url? | select(. != null)' 

# echo $comments
