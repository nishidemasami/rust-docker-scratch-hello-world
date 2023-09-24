FROM rust:alpine as build

WORKDIR /hello_rust_docker_scratch_world
COPY ./hello_rust_docker_scratch_world /hello_rust_docker_scratch_world
RUN cargo build --release

FROM scratch
COPY --from=build /hello_rust_docker_scratch_world/target/release/hello_rust_docker_scratch_world /hello_rust_docker_scratch_world
CMD [ "/hello_rust_docker_scratch_world" ]