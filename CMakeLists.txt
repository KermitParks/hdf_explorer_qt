cmake_minimum_required(VERSION 3.16)
project(hdf-explorer VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Gui)
find_package(Qt${QT_VERSION_MAJOR} OPTIONAL_COMPONENTS Widgets)

qt_standard_project_setup()

qt_add_executable(hdf-explorer   MACOSX_BUNDLE
    hdf_explorer.cpp hdf_explorer.hpp
    iterate.cpp iterate.hpp
    visit.cpp visit.hpp
)

target_link_libraries(hdf-explorer PRIVATE
    Qt::Core
    Qt::Gui
)


# Resources:
set(hdf_explorer_resource_files
    "images/document.png"
    "images/folder.png"
    "images/image_indexed.png"
    "images/image_true.png"
    "images/left.png"
    "images/matrix.png"
    "images/open.png"
    "images/open_dap.png"
    "images/right.png"
    "images/sample.png"
)

qt_add_resources(hdf-explorer "hdf_explorer"
    PREFIX
        "/"
    FILES
        ${hdf_explorer_resource_files}
)

if((QT_VERSION_MAJOR GREATER 4))
    target_link_libraries(hdf-explorer PRIVATE
        Qt::Widgets
    )
endif()





target_include_directories(hdf-explorer PRIVATE
    /usr/local/include
)

target_link_directories(hdf-explorer PRIVATE
    /usr/local/lib
)



target_link_libraries(hdf-explorer PRIVATE
    libhdf5_cpp.a
    libhdf5_hl_cpp.a
    libhdf5.a
    libhdf5_hl.a
)
