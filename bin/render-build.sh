#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
./bin/dev assets:precompile
./bin/dev assets:clean