ID=NBd1zp3BEeyJ-vNz9WAsXQ
TOKEN=$(pass show hyp)

curl -H "Authorization: Bearer ${TOKEN}" \
-X DELETE https://hypothes.is/api/annotations/$ID
