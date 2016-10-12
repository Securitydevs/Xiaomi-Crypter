#!/usr/bin/env bash

echo $CC
echo $CXX
echo "OS Name: $TRAVIS_OS_NAME"
# export CXX=g++-4.8
export TEST_RUN=true

git clone https://github.com/creationix/nvm.git /tmp/.nvm
source /tmp/.nvm/nvm.sh
nvm install "$NODE_VERSION"
nvm use "$NODE_VERSION"

node --version
npm --version

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  npm install --ignore-scripts --no-optional
else
  npm install --no-optional
fi

npm test

# if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
#   export DISPLAY=:99.0
#   sh -e /etc/init.d/xvfb start
#   sleep 3
#   unset TEST_RUN
#   npm run xtest
# fi
