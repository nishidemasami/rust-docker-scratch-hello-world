FROM rust:alpine as build

LABEL version="1.0.1"
LABEL org.opencontainers.image.source=https://github.com/nishidemasami/rust-docker-scratch-hello-world
LABEL org.opencontainers.image.description="Hello World with Rust and Scratch container"

LABEL maintainer="NISHIDE, Masami <nishidemasami@gmail.com>"

WORKDIR /hello_rust_docker_scratch_world
COPY ./hello_rust_docker_scratch_world /hello_rust_docker_scratch_world
RUN cargo build --release

FROM scratch
COPY --from=build /hello_rust_docker_scratch_world/target/release/hello_rust_docker_scratch_world /hello_rust_docker_scratch_world
CMD [ "/hello_rust_docker_scratch_world" ]