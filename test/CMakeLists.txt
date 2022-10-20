cmake_minimum_required(VERSION 3.15)

project(project-template-test LANGUAGES CXX)

include(FetchContent)

FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        origin/main
)

FetchContent_MakeAvailable(googletest)

if(MINGW)
    set(${PROJECT_NAME}_LINK_FLAGS -static)
endif()

add_executable(${PROJECT_NAME} main.cpp)
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../lib/src)
target_link_libraries(${PROJECT_NAME} PUBLIC gtest gmock project-template-lib ${${PROJECT_NAME}_LINK_FLAGS})

if(${CMAKE_SYSTEM_NAME} STREQUAL ${CMAKE_HOST_SYSTEM_NAME})
include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})
endif()