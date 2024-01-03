#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
npm install
./bin/rails assets:precompile
./bin/rails assets:clean