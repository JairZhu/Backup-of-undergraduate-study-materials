#ifndef DES_H
#define DES_H

#include <QMainWindow>

namespace Ui {
class des;
}

class des : public QMainWindow
{
    Q_OBJECT

public:
    explicit des(QWidget *parent = 0);
    ~des();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::des *ui;
};

#endif // DES_H
