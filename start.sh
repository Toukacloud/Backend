#!/bin/bash

cd /usr/src/app

VERSION="latest"

REPO="dishapatel010/Dester-Release"

curl -L -s $(curl -s "https://api.github.com/repos/${REPO}/releases/${VERSION}" | grep -Po '"browser_download_url": "\K.*?(?=")') | tar xf - -C .

pip3 install -r requirements.txt -q --no-cache-dir

uvicorn main:app --host 0.0.0.0 --port=$PORT
