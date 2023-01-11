#!/bin/bash

# Pull in version numbers from artifacts.sh
eval "$(grep VERSION artifacts.sh)"

if [ ! -e nostril] ; then
  # Checkout source and submodules
  git clone --progress https://github.com/jb55/nostril.git
fi

pushd $PWD/nostril && \
	git checkout ${VERSION_STRING} && \
	make -j5 && popd

NOSTRIL="$PWD/nostril/nostril"
export NOSTRIL
echo $NOSTRIL
bash -c "$NOSTRIL"
sudo -su $(whoami) install $NOSTRIL /usr/local/bin/
command -v nostril
which nostril

#TODO: more
# Add delay for results to be printed and recorded
sleep 10
