FROM ekidd/rust-musl-builder:1.57.0 as build
 
COPY --chown=rust:rust ./hello_rust_docker_scratch_world ./
RUN cargo build --release

FROM scratch
COPY --from=build /home/rust/src/target/x86_64-unknown-linux-musl/release/hello_rust_docker_scratch_world /hello_rust_docker_scratch_world
ENTRYPOINT [ "/hello_rust_docker_scratch_world" ]