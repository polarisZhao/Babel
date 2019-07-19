cmake_minimum_required(VERSION 2.8)
project(useopencv)

find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

add_executable( ReadCamera ReadCamera.cpp )
target_link_libraries( ReadCamera ${OpenCV_LIBS} )
