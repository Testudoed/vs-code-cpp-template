cmake_minimum_required(VERSION 3.15)

project(project-template LANGUAGES CXX)

list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_SOURCE_DIR}/cmake)

add_subdirectory(app)
add_subdirectory(extern)
add_subdirectory(lib)
add_subdirectory(test)
