#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/videoio.hpp>

namespace {

void drawText(const cv::Mat& image) {
  cv::putText(image, "Hello OpenCV", cv::Point(20, 50),
              cv::FONT_HERSHEY_COMPLEX,
              1,                          // font face and scale
              cv::Scalar(255, 255, 255),  // white
              1, cv::LINE_AA);            // line thickness and type
}

}  // namespace

int main() {
  std::cout << "Built with OpenCV " << CV_VERSION << std::endl;
  cv::Mat image;
  cv::VideoCapture capture;
  capture.open(0);
  if (capture.isOpened()) {
    std::cout << "Capture is opened" << std::endl;
    for (;;) {
      capture >> image;
      if (image.empty()) break;
      drawText(image);
      cv::imshow("Sample", image);
      if (cv::waitKey(10) >= 0) break;
    }
  } else {
    std::cout << "No capture" << std::endl;
    image = cv::Mat::zeros(480, 640, CV_8UC1);
    drawText(image);
    imshow("Sample", image);
    cv::waitKey(0);
  }
  return 0;
}
