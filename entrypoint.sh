#!/bin/sh

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

if [ -z "${FOLDER}" ]; then
  aws s3 cp ${FILE} s3://${S3_BUCKET}/${S3_KEY}
else
  aws s3 cp --recursive --exclude '*' --include "${INCLUDE}" ${FOLDER} s3://${S3_BUCKET}/${S3_KEY}
fi

rm -rf ~/.aws
