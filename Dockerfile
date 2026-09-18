FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    pkg-config \
    libopencv-dev \
    libeigen3-dev \
    libboost-all-dev \
    libglew-dev \
    libpython3-dev \
    python3-dev \
    python3-numpy \
    libgl1-mesa-dev \
    libegl1-mesa-dev \
    libwayland-dev \
    libxkbcommon-dev \
    libgtk2.0-dev \
    libepoxy-dev \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswscale-dev \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libopenexr-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone --branch v0.9.4 --depth 1 \
    https://github.com/stevenlovegrove/Pangolin.git Pangolin && \
    cmake -S Pangolin -B Pangolin/build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_PANGOLIN_PYTHON=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF && \
    cmake --build Pangolin/build -j4 && \
    cmake --install Pangolin/build

WORKDIR /opt/ORB_SLAM3

COPY . .

RUN chmod +x build.sh && \
    ./build.sh

RUN test -f lib/libORB_SLAM3.so && \
    test -x Examples/Monocular/mono_euroc && \
    test -x Examples/Stereo/stereo_euroc && \
    test -x Examples/Monocular/mono_tum_vi && \
    test -x Examples/Stereo/stereo_tum_vi

CMD ["/bin/bash"]
