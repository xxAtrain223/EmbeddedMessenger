#!/usr/bin/env bash
set -e

pushd build
make -j2

cd shared
./EmbMessengerSharedTest

cd ../host
./EmbMessengerTest

popd

cd shared
cppcheck src/*.cpp include/*.hpp

cd ../host
cppcheck src/*.cpp include/*.hpp