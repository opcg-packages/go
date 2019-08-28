#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

PREBUILT_STASH=${SCRIPT_DIR}/stash
PREBUILT_ZIP=go%VER%.linux-amd64.tar.gz
PREBUILT_URL=https://dl.google.com/go/%PREBUILT_ZIP%

PREFIX_DIR=${REZ_BUILD_PATH}/pkg
UNZIP_DIR=${REZ_BUILD_PATH}/unzip
EMPTY_DIR=${REZ_BUILD_PATH}/empty

if [[ ! -d "$PREFIX_DIR" ]]; then
  mkdir ${PREFIX_DIR}
fi

if [[ ! -d "$UNZIP_DIR" ]]; then
  mkdir ${UNZIP_DIR}
fi

if [[ ! -d "$EMPTY_DIR" ]]; then
  mkdir ${EMPTY_DIR}
fi
