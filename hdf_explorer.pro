TARGET = "hdf-explorer"
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
HEADERS = hdf_explorer.hpp visit.hpp iterate.hpp
SOURCES = hdf_explorer.cpp visit.cpp iterate.cpp
RESOURCES = hdf_explorer.qrc
ICON = sample.icns
RC_FILE = hdf_explorer.rc

unix:!macx {
 LIBS += -lhdf5
}

macx: {
 INCLUDEPATH += /usr/local/include
 LIBS += /usr/local/lib/libhdf5.a
 LIBS += /usr/local/lib/libhdf5_hl.a
 LIBS += /usr/local/lib/libsz.a
 LIBS += -lcurl -lz
}

win32: {
INCLUDEPATH += "C:/Program Files/HDF_Group/HDF5/1.14.3/include/"

LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/hdf5.lib"
LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/hdf5_cpp.lib"
LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/hdf5_hl.lib"
LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/hdf5_hl_cpp.lib"
LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/hdf5_java.lib"
LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/hdf5_tools.lib"
LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/libszaec.lib"
LIBS += "C:/Program Files/HDF_Group/HDF5/1.14.3/lib/libzlib.lib"
}
