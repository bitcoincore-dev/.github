#!/bin/bash

DATE=`date +%Y-%m-%d`
TWITTER_NAME="@bitcoinbinary #nostr-actions"
VERSION="master"
URL="https://github.com/jb55/nostril.git"
REPO="https://github.com/jb55/nostril.git"
PROJECT="nostr-actions"
SHA256=`shasum -a 256 nostril/nostril | cut -f 1 -d ' '`
echo $SHA256>SHA256.txt
CHECKSUM_SOURCE="${PWD}/SHA256.txt"

# Note GITHUB_ environment variables are populated by Github Actions
ARTIFACT_BASEURL="https://github.com/${GITHUB_REPOSITORY}/raw"
ARTIFACT_BRANCH=${GITHUB_REF_NAME}

ENTRY_TO_APPEND="<li><a href='${REPO}/releases/tag/${VERSION}'>${DATE}</a> | <a href='${URL}' class='project-name'>${PROJECT}</a>  | <a href='${REPO}/releases/tag/${VERSION}'>${VERSION}</a> | <a href='${CHECKSUM_SOURCE}'> factory ${SHA256} </a>| <a href='${ARTIFACT_BASEURL}/${ARTIFACT_BRANCH}/${PROJECT}/${PROJECT}-${VERSION}-video.webm'>video proof</a> | <a href='https://github.com/coinkite/bitcoinbinary.org/blob/main/${PROJECT}/artifacts.sh' class="bot">build bot</a></li>"

echo ${ENTRY_TO_APPEND}
