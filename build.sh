echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4

cd ../../Sophus

echo "Configuring and building Thirdparty/Sophus ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4

cd ../../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..

echo "Configuring and building ORB_SLAM3 ..."

mkdir build
cd build
# IMPORTANT: Ensure the path to your Pangolin build is correct.
#PANGOLIN_BUILD_DIR=~/Pangolin/build
cmake .. -DPangolin_DIR=/usr/local/lib/cmake/Pangolin-# DPangolin_DIR=$PANGOLIN_BUILD_DIR
make -j4
#cd ~/ORB_SLAM3
#rm -rf build
#mkdir build && cd build

#cmake .. \
#  -DUSE_PANGOLIN_VIEWER=ON \
#  -DUSE_CUDA=OFF \
#  -DUSE_OPENMP=OFF \
#  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
#  -DOpenCV_DIR=/usr/lib/x86_64-linux-gnu/cmake/opencv4

#make -j4

