#!/bin/sh
rm -rf build-musl
docker run --rm -it -v "${PWD}":"/opt/src" noboruma/musl-builder:alpine \
    sh -c "cd /opt/src && mkdir build-musl && cd build-musl && cmake -DCMAKE_CXX_FLAGS=\"-march=core-avx2\" -DCMAKE_C_FLAGS=\"-march=core-avx2\" -DCMAKE_BUILD_TYPE=MinSizeRel ../ && make hs -j$(nproc)"

