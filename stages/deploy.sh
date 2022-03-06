#!/bin/sh
set -e

echo "Building stage"
echo " "

echo SECRET_KEY="${{ secrets.SECRET_KEY }}" > .env
bash -c '
  set -a;

  export DOCKER_USER="1000:1000"

  (printenv | grep -v "^_=" | sort)
' > .env

cd ${{ secrets.}}
