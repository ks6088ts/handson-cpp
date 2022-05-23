# Reference

- [Get started with CMake Tools on Linux](https://code.visualstudio.com/docs/cpp/CMake-linux)
- [Using Clang in Visual Studio Code](https://code.visualstudio.com/docs/cpp/config-clang-mac)
- [Quickstart: Building with CMake](https://google.github.io/googletest/quickstart-cmake.html)

# OpenCV

- [Issues on OpenCV 4.5.5 compiling from scratch on newer macOS (Intel chip, macOS Monterey) #21389](https://github.com/opencv/opencv/issues/21389#issuecomment-1031193719)
- [4.0.0 does not produce pkgconfig file #13154](https://github.com/opencv/opencv/issues/13154#issuecomment-456652297)

## Build OpenCV

```bash
# https://github.com/opencv/opencv
cd opencv

cmake \
  -D CMAKE_BUILD_TYPE=RELEASE \
  -D INSTALL_C_EXAMPLES=ON \
  -D BUILD_EXAMPLES=ON \
  -D BUILD_ZLIB=OFF \
  -D OPENCV_GENERATE_PKGCONFIG=YES \
  ../

make -j8
sudo make install
```

## Build an app with OpenCV

```bash
# https://github.com/opencv/opencv/tree/4.x/samples/cpp/example_cmake
cd examples/example_cmake
make

# run an example app
./main
```
