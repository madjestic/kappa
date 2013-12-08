#include <Qt/qapplication.h>
#include <QtOpenGL/QGLWidget>
#include <meglwindow.h>

int main(int argc, char* argv[])
{
  QApplication app(argc, argv);
  MeGlWindow meWindow;
  meWindow.show();
  return app.exec();    
}