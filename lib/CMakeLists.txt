cmake_minimum_required(VERSION 3.15)

project(project-template-lib LANGUAGES CXX)

add_library(${PROJECT_NAME} 
    src/project.cpp
)
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
target_include_directories(${PROJECT_NAME} 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>)