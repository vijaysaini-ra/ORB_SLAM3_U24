#!/bin/bash

set -e

echo "========================================"
echo "Building ORB-SLAM3_U24"
echo "========================================"

echo ""
echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4

echo ""
echo "Configuring and building Thirdparty/g2o ..."

cd ../../g2o
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4

echo ""
echo "Configuring and building Thirdparty/Sophus ..."

cd ../../Sophus
mkdir -p build
cd build
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF
make -j4

echo ""
echo "Uncompressing ORB vocabulary ..."

cd ../../../Vocabulary

if [ ! -f ORBvoc.txt ]; then
    tar -xf ORBvoc.txt.tar.gz
else
    echo "ORBvoc.txt already exists. Skipping extraction."
fi

cd ..

echo ""
echo "Configuring and building ORB-SLAM3 ..."

mkdir -p build
cd build

cmake .. \
    -DPangolin_DIR=/usr/local/lib/cmake/Pangolin \
    -DCMAKE_BUILD_TYPE=Release

make -j4

echo ""
echo "========================================"
echo "ORB-SLAM3_U24 build completed successfully."
echo "========================================"
