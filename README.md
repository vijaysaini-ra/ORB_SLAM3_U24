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

# 4. Running ORB-SLAM3 with a Camera

The `Examples/` directory contains example programs and configuration files for running ORB-SLAM3 with different sensor configurations.

The supported configurations include:

- Monocular
- Monocular-Inertial
- Stereo
- Stereo-Inertial
- RGB-D
- RGB-D-Inertial

## Using Your Own Camera

To use ORB-SLAM3 with your own camera, the following steps are required:

1. Calibrate the camera and obtain the required intrinsic, distortion, and, where applicable, stereo/depth parameters.

2. Create or modify an ORB-SLAM3 configuration file (`.yaml`) containing the required camera parameters.

3. Select the appropriate example corresponding to your sensor configuration from the `Examples/` directory.

4. Connect the camera to the computer using the appropriate interface.

5. Build the corresponding example if required.

6. Run the executable using the ORB vocabulary file and the camera configuration file.

For detailed information about camera calibration and configuration files, refer to:

`Calibration_Tutorial.pdf`

## Intel RealSense Examples

This repository includes example programs and configuration files for the following Intel RealSense cameras:

- **Intel RealSense D435i**
- **Intel RealSense T265**

The available examples depend on the camera and sensor configuration.

### Intel RealSense D435i

Examples are provided for:

- Monocular
- Monocular-Inertial
- Stereo
- Stereo-Inertial
- RGB-D
- RGB-D-Inertial

The corresponding D435i configuration files are available under:

```text
Examples/Monocular/RealSense_D435i.yaml
Examples/Monocular-Inertial/RealSense_D435i.yaml
Examples/Stereo/RealSense_D435i.yaml
Examples/Stereo-Inertial/RealSense_D435i.yaml
Examples/RGB-D/RealSense_D435i.yaml
Examples/RGB-D-Inertial/RealSense_D435i.yaml
```

# 5. EuRoC Examples

The [EuRoC dataset](http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets) was recorded using two synchronized pinhole cameras and an inertial sensor.

This repository provides scripts for running selected EuRoC sequences with ORB-SLAM3.

## Downloading the Dataset

1. Download the required EuRoC sequence in ASL format from:

   http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets

2. Extract the downloaded sequence.

3. The example scripts in this repository use the EuRoC dataset located at:

```text
~/EuRoC/
```
then use scripts like 
```bash
chmod +x run_euroc_stereo.sh
./run_euroc_stereo.sh
```
we can modify it according to our need for other camera mode.


# 6. TUM-VI Examples

The [TUM-VI dataset](https://vision.in.tum.de/data/datasets/visual-inertial-dataset) was recorded using two fisheye cameras and an inertial sensor.

This repository includes TUM-VI configuration files for running ORB-SLAM3 with different sensor configurations.

## Downloading the Dataset

1. Download the required TUM-VI sequence from:

   https://vision.in.tum.de/data/datasets/visual-inertial-dataset

2. Extract the downloaded sequence.

3. Select the appropriate ORB-SLAM3 configuration file from the `Examples/` directory according to the required sensor configuration.

The available configuration files include:

```text
Examples/Monocular/TUM-VI.yaml
Examples/Monocular-Inertial/TUM-VI.yaml
Examples/Monocular-Inertial/TUM-VI_far.yaml
Examples/Stereo/TUM-VI.yaml
Examples/Stereo-Inertial/TUM-VI.yaml
Examples/Stereo-Inertial/TUM-VI_far.yaml
```


# 7. ROS 2 Jazzy Integration

This repository provides the **ORB-SLAM3 core library and examples** adapted and tested for **Ubuntu 24.04**.

For ROS 2 integration, a separate ROS 2 wrapper package is provided and tested with:

- Ubuntu 24.04
- ROS 2 Jazzy
- ORB-SLAM3_U24

The ROS 2 package supports the following ORB-SLAM3 configurations:

- Monocular
- RGB-D
- Stereo
- Stereo-Inertial

For ROS 2 Jazzy installation, workspace setup, building the ROS 2 package, configuration files, camera integration, and running the ROS 2 nodes, please refer to the dedicated ROS 2 repository:

https://github.com/vijaysaini-ra/ORB_SLAM3_ROS2_Jazzy

# 8. Running time analysis
A flag in `include\Config.h` activates time measurements. It is necessary to uncomment the line `#define REGISTER_TIMES` to obtain the time stats of one execution which is shown at the terminal and stored in a text file(`ExecTimeMean.txt`).

# 9. Calibration
You can find a tutorial for visual-inertial calibration and a detailed description of the contents of valid configuration files at  `Calibration_Tutorial.pdf`
