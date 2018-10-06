#!/bin/bash
set -o errexit

rm -rf public
mkdir public

# config
git config --global user.email "pccfrmvns@gmail.com"
git config --global user.name "Prashant C Chaturvedi"

# build
bundle exec rake deploy
