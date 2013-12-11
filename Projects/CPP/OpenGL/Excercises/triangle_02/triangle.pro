#CONFIG += qt

QT += opengl

HEADERS += /usr/include/GL/glew.h
HEADERS += /usr/include/GL/gl.h
HEADERS += /usr/include/qt4/Qt/qapplication.h
HEADERS += /usr/include/qt4/QtOpenGL/QGLWidget
HEADERS += meglwindow.h

SOURCES += triangle.cpp
SOURCES += meglwindow.cpp

TARGET = triangle
