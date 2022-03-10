ID=$1
TOKEN=$(pass show hyp)

curl -H "Authorization: Bearer ${TOKEN}" \
-X DELETE https://hypothes.is/api/annotations/$ID
