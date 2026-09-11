export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/vjsaini/ORB_SLAM3/lib

~/ORB_SLAM3/Examples/Monocular/mono_euroc \
    ~/ORB_SLAM3/Vocabulary/ORBvoc.txt \
    ~/ORB_SLAM3/Examples/Monocular/EuRoC.yaml \
    ~/EuRoC \
    ~/vslam_ws/v1_times.txt

