#!/bin/bash

ARQUIVO=$1

generate_post_data()
{
  cat <<EOF
{
    "id": "$campo_id",
    "title": "$campo_title",
    "body": "$campo_body",
    "userId": "$campo_user"
}
EOF
}

while IFS=";" read -r campo_id campo_title campo_body campo_user
do
  echo "eis o campo_id: $campo_id"
  echo "eis o campo_id: $campo_title"
  echo "eis o campo_id: $campo_body"
  echo "eis o campo_id: $campo_user"
  echo $(generate_post_data)
  echo "--------------------------"
curl -v --location --request POST 'https://jsonplaceholder.typicode.com/posts' \
--header 'Content-Type: application/json' \
--data-raw "$(generate_post_data)"
done < "$ARQUIVO"
