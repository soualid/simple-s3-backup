#!/bin/sh
mkdir -p /root/.aws/ && \
  echo -e "[default]\naws_access_key_id = $AWS_ACCESS_KEY\naws_secret_access_key = $AWS_SECRET" > /root/.aws/credentials 
if [ "$CURL_FROM" != "" ]; then
  curl $CURL_FROM > $CURL_TO
fi
currentDate=$(date +%F_%R)
currentDate=${currentDate/:/-}
REMOTE=${REMOTE/-currentdate-/$currentDate}
aws s3 sync $LOCAL $REMOTE