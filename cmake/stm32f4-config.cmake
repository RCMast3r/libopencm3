add_library(stm32f4 STATIC IMPORTED)

target_include_directories(stm32f4 INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>)

target_include_directories(stm32f4 INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/lib>
    $<INSTALL_INTERFACE:lib>)

add_dependencies(stm32f4 libopencm3)
# target_link_libraries(stm32f4 INTERFACE libopencm3_stm32f4)
set_target_properties(stm32f4 PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/lib/libopencm3_stm32f4.a)
target_link_directories(stm32f4 INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/lib)
