#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


if [ -z "$1" ]
then
  echo ERROR: Pass file directory of Rails project
  exit 1
else
  ln -s $DIR/.rubocop.yml $1
  ln -s $DIR/.solargraph.yml $1
  ln -s $DIR/definitions.rb $1/config/
  ln -s $DIR/.gitignore $1
  ln -s $DIR/.ignore $1
fi


