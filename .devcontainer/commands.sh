# docker compose -f .devcontainer/docker-compose.yml build

git submodule update --init --recursive

docker run \
    -it \
    --gpus all \
    --name instant-ngp \
    -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics \
    -e DISPLAY=$DISPLAY \
    -v $PWD:/volume \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -w /volume \
    marcobteixeira/instantngp:cuda10.2-u18.04

cmake  ./ -B ./build
cmake --build build --config RelWithDebInfo -j 16
./instant-ngp data/nerf/fox/