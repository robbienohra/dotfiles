ID=m3LoiJV_Eey9vK8Gvmk-uQ
TOKEN=$(pass show hyp)

curl -H "Authorization: Bearer ${TOKEN}" \
-X DELETE https://hypothes.is/api/annotations/$ID
