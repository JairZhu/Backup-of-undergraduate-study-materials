#include "des.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    des w;
    w.show();

    return a.exec();
}
