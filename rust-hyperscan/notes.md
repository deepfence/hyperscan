```bash
cmake ../ -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc) && \
    sudo mkdir -p /usr/local/hyperscan && \
    sudo cp -r lib /usr/local/hyperscan
```

```bash
cargo build --features static --target x86_64-unknown-linux-musl
```