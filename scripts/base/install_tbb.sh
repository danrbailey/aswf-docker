#!/usr/bin/env bash

set -ex

git clone https://github.com/01org/tbb.git
cd tbb

if [ "$TBB_VERSION" != "latest" ]; then
    git checkout tags/${TBB_VERSION} -b ${TBB_VERSION}
fi

make -j4
cp -r include/serial /usr/local/include/.
cp -r include/tbb /usr/local/include/.
cp -r build/*/*.so* /usr/local/lib/.

cd ..
rm -rf tbb
