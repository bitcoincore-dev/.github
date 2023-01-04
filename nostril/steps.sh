#!/bin/bash

# Pull in version numbers from artifacts.sh
eval "$(grep VERSION artifacts.sh)"

if [ ! -e lnd ] ; then
  # Checkout source and submodules
  git clone --progress https://github.com/jb55/nostril.git
fi

cd nostril
git checkout ${VERSION_STRING}

make -j5
NOSTRIL="$PWD/nostril"
export NOSTRIL
echo $NOSTRIL
bash -c "$NOSTRIL"

# Add delay for results to be printed and recorded
sleep 10
