#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == "Darwin" ]]; then
    eval "$(pyenv init -)"
fi

if [[ "${MACAPP_ENV}" == "system" ]]; then
    ./build-app.sh
else
    source ~/.venv/bin/activate
    tox --develop -e $TOX_ENV -- $TOX_FLAGS
fi
