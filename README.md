# ORB-SLAM3_U24

## ORB-SLAM3 for Ubuntu 24.04

This repository contains a modified version of [ORB-SLAM3](https://github.com/UZ-SLAMLab/ORB_SLAM3) adapted and tested for **Ubuntu 24.04 (U24)**.

The name **ORB-SLAM3_U24** indicates the Ubuntu 24.04-compatible version of ORB-SLAM3.

The modifications in this repository focus on building and running ORB-SLAM3 on Ubuntu 24.04 while maintaining the original ORB-SLAM3 framework and functionality.

> **Note:** This is a modified version of the original ORB-SLAM3 project. The original authors, project, publications, and license are credited and referenced below.



## Original Project, License and Publications

This repository is a modified version of the original **ORB-SLAM3** project.

For the **original source code, license information, publications, dependencies, and complete documentation**, please refer to the official ORB-SLAM3 repository:

https://github.com/UZ-SLAMLab/ORB_SLAM3

This modified repository retains the licensing terms of the original ORB-SLAM3 project. The original ORB-SLAM3 project is released under the **GNU General Public License v3.0 (GPLv3)**. Please refer to the original repository for the complete license terms and associated dependency licenses.

For academic publications and citation information related to ORB-SLAM3, please refer to the original project repository and its associated publications.

## Ubuntu 24.04 Modifications

This repository contains modifications to the original ORB-SLAM3 project for building and running it on **Ubuntu 24.04**.

### Build and Compatibility Changes

The following changes were made to improve compatibility and build stability on the tested Ubuntu 24.04 environment:

- Updated the project configuration to use the **C++14** standard.
- Added `-Wno-deprecated-declarations` to handle deprecated-declaration warnings from the compiler and dependencies.
- Modified the `Optimizer` implementation to address compatibility with the dependency versions used in the Ubuntu 24.04 environment.
- Limited parallel compilation to **4 jobs (`make -j4`)** in the build scripts to reduce build resource usage.
- Updated the Pangolin configuration used by the build process for Ubuntu 24.04 compatibility.

### Configuration and Example Changes

Additional configuration changes were made for the camera and dataset configurations used during testing:

- Updated the **TUM-VI** camera resolution and ORB feature extraction thresholds.
- Updated the **TUM1** camera resolution.
- Added the `Camera.bf` parameter to the **EuRoC stereo configuration**.
- Enabled the Pangolin viewer in the EuRoC monocular example used during testing.

### Additional Files and Tools

The repository also includes:

- Helper scripts for running selected EuRoC examples.
- Standalone vocabulary conversion utilities under the `tools/` directory.
- The ORB vocabulary file managed using **Git LFS**.
- Timing data used by the EuRoC testing scripts.



# 2. Prerequisites

This version of ORB-SLAM3_U24 has been adapted and tested on **Ubuntu 24.04**.

A reasonably powerful computer is recommended for real-time performance, particularly when running visual-inertial or stereo configurations.

## Operating System

- **Ubuntu 24.04 (Noble Numbat)**

## C++ Compiler

This version of ORB-SLAM3_U24 has been successfully built and tested with **GCC/G++ 11.5.0** on Ubuntu 24.04.

The project retains the original ORB-SLAM3 C++11 compiler compatibility configuration.

## Pangolin

We use [Pangolin](https://github.com/stevenlovegrove/Pangolin) for visualization and user interface.

This version of ORB-SLAM3_U24 has been tested with **Pangolin v0.9.4**. For compatibility and reproducibility, it is recommended to use **Pangolin v0.9.4**.

Please download and install **Pangolin v0.9.4** from the official Pangolin repository:

https://github.com/stevenlovegrove/Pangolin

## OpenCV

We use [OpenCV](https://opencv.org/) for image processing and feature extraction.

This version of ORB-SLAM3_U24 has been tested with **OpenCV 4.6.0** on Ubuntu 24.04.

**OpenCV 4.6.0 is recommended** for building this version on Ubuntu 24.04.

## Eigen3

Eigen3 is required by **g2o** and is used by ORB-SLAM3 for linear algebra operations.

This version of ORB-SLAM3_U24 has been tested with **Eigen3 3.4.0** on Ubuntu 24.04.

**Eigen3 3.4.0 is recommended** for building this version on Ubuntu 24.04.

## DBoW2 and g2o

ORB-SLAM3 uses **DBoW2** for place recognition and **g2o** for non-linear optimization.

Modified versions of both libraries are included in the `Thirdparty/` directory of this repository, so they do not need to be downloaded separately.

The included libraries are built automatically as part of the ORB-SLAM3 build process.

## Python

Python is used for trajectory evaluation and alignment with the ground-truth trajectory.

This version of ORB-SLAM3_U24 has been tested with **Python 3.12** on Ubuntu 24.04.

The **NumPy** Python package is required for the trajectory evaluation tools.

**Python 3.12 with NumPy 1.26.4 is recommended** for the tested Ubuntu 24.04 environment.



# 3. Building ORB-SLAM3 library and examples

Clone the ORB-SLAM3_U24 repository:

```bash
git clone https://github.com/vijaysaini-ra/ORB_SLAM3_U24.git ORB_SLAM3
```

We provide a script `build.sh` to build the *Thirdparty* libraries and *ORB-SLAM3*. Please make sure you have installed all required dependencies (see section 2). Execute:
```bash
cd ORB_SLAM3
chmod +x build.sh
./build.sh
```

This will create **libORB_SLAM3.so**  at *lib* folder and the executables in *Examples* folder.

# 4. Running ORB-SLAM3 with your camera

Directory `Examples` contains several demo programs and calibration files to run ORB-SLAM3 in all sensor configurations with Intel Realsense cameras T265 and D435i. The steps needed to use your own camera are: 

1. Calibrate your camera following `Calibration_Tutorial.pdf` and write your calibration file `your_camera.yaml`

2. Modify one of the provided demos to suit your specific camera model, and build it

3. Connect the camera to your computer using USB3 or the appropriate interface

4. Run ORB-SLAM3. For example, for our D435i camera, we would execute:

```
./Examples/Stereo-Inertial/stereo_inertial_realsense_D435i Vocabulary/ORBvoc.txt ./Examples/Stereo-Inertial/RealSense_D435i.yaml
```

# 5. EuRoC Examples
[EuRoC dataset](http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets) was recorded with two pinhole cameras and an inertial sensor. We provide an example script to launch EuRoC sequences in all the sensor configurations.

1. Download a sequence (ASL format) from http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets

2. Open the script "euroc_examples.sh" in the root of the project. Change **pathDatasetEuroc** variable to point to the directory where the dataset has been uncompressed. 

3. Execute the following script to process all the sequences with all sensor configurations:
```
./euroc_examples
```

## Evaluation
EuRoC provides ground truth for each sequence in the IMU body reference. As pure visual executions report trajectories centered in the left camera, we provide in the "evaluation" folder the transformation of the ground truth to the left camera reference. Visual-inertial trajectories use the ground truth from the dataset.

Execute the following script to process sequences and compute the RMS ATE:
```
./euroc_eval_examples
```

# 6. TUM-VI Examples
[TUM-VI dataset](https://vision.in.tum.de/data/datasets/visual-inertial-dataset) was recorded with two fisheye cameras and an inertial sensor.

1. Download a sequence from https://vision.in.tum.de/data/datasets/visual-inertial-dataset and uncompress it.

2. Open the script "tum_vi_examples.sh" in the root of the project. Change **pathDatasetTUM_VI** variable to point to the directory where the dataset has been uncompressed. 

3. Execute the following script to process all the sequences with all sensor configurations:
```
./tum_vi_examples
```

## Evaluation
In TUM-VI ground truth is only available in the room where all sequences start and end. As a result the error measures the drift at the end of the sequence. 

Execute the following script to process sequences and compute the RMS ATE:
```
./tum_vi_eval_examples
```

# 7. ROS Examples

### Building the nodes for mono, mono-inertial, stereo, stereo-inertial and RGB-D
Tested with ROS Melodic and ubuntu 18.04.

1. Add the path including *Examples/ROS/ORB_SLAM3* to the ROS_PACKAGE_PATH environment variable. Open .bashrc file:
  ```
  gedit ~/.bashrc
  ```
and add at the end the following line. Replace PATH by the folder where you cloned ORB_SLAM3:

  ```
  export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:PATH/ORB_SLAM3/Examples/ROS
  ```
  
2. Execute `build_ros.sh` script:

  ```
  chmod +x build_ros.sh
  ./build_ros.sh
  ```
  
### Running Monocular Node
For a monocular input from topic `/camera/image_raw` run node ORB_SLAM3/Mono. You will need to provide the vocabulary file and a settings file. See the monocular examples above.

  ```
  rosrun ORB_SLAM3 Mono PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE
  ```

### Running Monocular-Inertial Node
For a monocular input from topic `/camera/image_raw` and an inertial input from topic `/imu`, run node ORB_SLAM3/Mono_Inertial. Setting the optional third argument to true will apply CLAHE equalization to images (Mainly for TUM-VI dataset).

  ```
  rosrun ORB_SLAM3 Mono PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE [EQUALIZATION]	
  ```

### Running Stereo Node
For a stereo input from topic `/camera/left/image_raw` and `/camera/right/image_raw` run node ORB_SLAM3/Stereo. You will need to provide the vocabulary file and a settings file. For Pinhole camera model, if you **provide rectification matrices** (see Examples/Stereo/EuRoC.yaml example), the node will recitify the images online, **otherwise images must be pre-rectified**. For FishEye camera model, rectification is not required since system works with original images:

  ```
  rosrun ORB_SLAM3 Stereo PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE ONLINE_RECTIFICATION
  ```

### Running Stereo-Inertial Node
For a stereo input from topics `/camera/left/image_raw` and `/camera/right/image_raw`, and an inertial input from topic `/imu`, run node ORB_SLAM3/Stereo_Inertial. You will need to provide the vocabulary file and a settings file, including rectification matrices if required in a similar way to Stereo case:

  ```
  rosrun ORB_SLAM3 Stereo_Inertial PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE ONLINE_RECTIFICATION [EQUALIZATION]	
  ```
  
### Running RGB_D Node
For an RGB-D input from topics `/camera/rgb/image_raw` and `/camera/depth_registered/image_raw`, run node ORB_SLAM3/RGBD. You will need to provide the vocabulary file and a settings file. See the RGB-D example above.

  ```
  rosrun ORB_SLAM3 RGBD PATH_TO_VOCABULARY PATH_TO_SETTINGS_FILE
  ```

**Running ROS example:** Download a rosbag (e.g. V1_02_medium.bag) from the EuRoC dataset (http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets). Open 3 tabs on the terminal and run the following command at each tab for a Stereo-Inertial configuration:
  ```
  roscore
  ```
  
  ```
  rosrun ORB_SLAM3 Stereo_Inertial Vocabulary/ORBvoc.txt Examples/Stereo-Inertial/EuRoC.yaml true
  ```
  
  ```
  rosbag play --pause V1_02_medium.bag /cam0/image_raw:=/camera/left/image_raw /cam1/image_raw:=/camera/right/image_raw /imu0:=/imu
  ```
  
Once ORB-SLAM3 has loaded the vocabulary, press space in the rosbag tab.

**Remark:** For rosbags from TUM-VI dataset, some play issue may appear due to chunk size. One possible solution is to rebag them with the default chunk size, for example:
  ```
  rosrun rosbag fastrebag.py dataset-room1_512_16.bag dataset-room1_512_16_small_chunks.bag
  ```

# 8. Running time analysis
A flag in `include\Config.h` activates time measurements. It is necessary to uncomment the line `#define REGISTER_TIMES` to obtain the time stats of one execution which is shown at the terminal and stored in a text file(`ExecTimeMean.txt`).

# 9. Calibration
You can find a tutorial for visual-inertial calibration and a detailed description of the contents of valid configuration files at  `Calibration_Tutorial.pdf`
