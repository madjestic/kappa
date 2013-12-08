#ifndef MEGLWINDOW_H
#define MEGLWINDOW_H

#include <QtOpenGL/QGLWidget>

class MeGlWindow : public QGLWidget
{
protected:
    void initializeGL();
    void paintGL();
};

#endif // MEGLWINDOW_H
