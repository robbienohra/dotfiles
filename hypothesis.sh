ID=$1
TOKEN=$(pass show robbie/hypothesis)

curl -H "Authorization: Bearer ${TOKEN}" \
-X DELETE https://hypothes.is/api/annotations/$ID
