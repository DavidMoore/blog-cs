#!/bin/bash

HUGO=./hugo_snapshot_linux_amd64

if [ "$(uname)" == "Darwin" ]; then
    HUGO=./hugo_snapshot_darwin_amd64
fi

rm -Rf public
mkdir public
$HUGO -v --baseUrl="//cyrillschumacher.com" --cacheDir="./cache"
cp static/piwik public/
cp static/*.asc static/schumach*.png public/
cp -R static/.well-known public/
ln -s ../piwik public/piwik
./syncFolders-push.sh
git push
