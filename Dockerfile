FROM rust:alpine3.17 as build
 
COPY --chown=rust:rust ./hello_rust_docker_scratch_world ./
RUN cargo build --release

FROM scratch
COPY --from=build ./target/release/hello_rust_docker_scratch_world /hello_rust_docker_scratch_world
ENTRYPOINT [ "/hello_rust_docker_scratch_world" ]