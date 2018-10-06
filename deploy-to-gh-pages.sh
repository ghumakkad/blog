#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

rm -rf public
mkdir public

# config
git config --global user.email "pccfrmvns@gmail.com"
git config --global user.name "Prashant C Chaturvedi"

# build (CHANGE THIS)
make

# deploy
cd public
git init
git add .
git commit -m "Deploy Ghumakkad Webapp to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" master:gh-pages > /dev/null 2>&1