cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
# TODO make this configurable via nix to enable / disable
# set(CMAKE_TOOLCHAIN_FILE cmake/toolchain-arm-none-eabi-gcc.cmake)

project(cmake-libopencm3 LANGUAGES CXX C ASM)

# TODO make this an input variable
set(LIBOPENCM3_TARGETS stm32/f4)

add_custom_target(libopencm3 make TARGETS=${LIBOPENCM3_TARGETS} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
# Create a specific CPU target with the appropriate options etc
install(
    DIRECTORY ${CMAKE_SOURCE_DIR}/include/
    DESTINATION include
    FILES_MATCHING PATTERN "*.h*")

install(
    FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake/stm32f4-config.cmake"
    DESTINATION "${CMAKE_INSTALL_DATADIR}/stm32f4/cmake"
    NAMESPACE opencm3
)

