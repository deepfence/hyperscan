```bash
cmake ../ -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc) && \
    sudo mkdir -p /usr/local/hyperscan && \
    cp -r lib /usr/local/hyperscan
```