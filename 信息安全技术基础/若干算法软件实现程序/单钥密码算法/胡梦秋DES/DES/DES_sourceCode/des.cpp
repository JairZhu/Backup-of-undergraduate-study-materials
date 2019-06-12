#include "des.h"
#include "ui_des.h"
#include "modes.h"
#include "utility.h"
#include <string>

using namespace std;

des::des(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::des)
{
    ui->setupUi(this);
}

des::~des()
{
    delete ui;
}

//encryption
void des::on_pushButton_clicked()
{
    QString q_plaintext = ui->textEdit->toPlainText();
    string str_plaintext= q_plaintext.toStdString();
    vector<bool> plaintext = str_to_bits(str_plaintext);

    QString q_key = ui->lineEdit->text();
    string str_key = q_key.toStdString();
    vector<bool> key = str_to_bits(str_key);
    paddle(64, key);

    QString q_iv = ui->lineEdit_2->text();
    string str_iv = q_iv.toStdString();
    vector<bool> iv = str_to_bits(str_iv);
    paddle(64, iv);

    vector<bool> ciphertext;

    //ECB
    if(ui->radioButton->isChecked()){
        ciphertext = ECB_encryption(key, plaintext);
    }
    //CBC
    if(ui->radioButton_2->isChecked()){
        ciphertext = CBC_encryption(key, plaintext, iv);
    }
    //CFB
    if(ui->radioButton_3->isChecked()){
        ciphertext = CFB_encryption(key, plaintext, iv);
    }
    //OFB
    if(ui->radioButton_4->isChecked()){
        ciphertext = OFB_encryption(key, plaintext, iv);
    }
    //CTR
    if(ui->radioButton_5->isChecked()){
        ciphertext = CTR_encryption(key, plaintext, iv);
    }
    string str_ciphertext = bits_to_hex(ciphertext);
    QString q_ciphertext = QString::fromStdString(str_ciphertext);
    ui->textEdit_2->setText(q_ciphertext);
}

void des::on_pushButton_2_clicked()
{
    QString q_ciphertext = ui->textEdit_2->toPlainText();
    string str_ciphertext = q_ciphertext.toStdString();
    vector<bool> ciphertext = hex_to_bits(str_ciphertext);

    QString q_key = ui->lineEdit->text();
    string str_key= q_key.toStdString();
    vector<bool> key = str_to_bits(str_key);
    paddle(64, key);

    QString q_iv = ui->lineEdit_2->text();
    string str_iv = q_iv.toStdString();
    vector<bool> iv = str_to_bits(str_iv);
    paddle(64, iv);

    vector<bool> plaintext;

    //ECB
    if(ui->radioButton->isChecked()){
        plaintext = ECB_decryption(key, ciphertext);
    }
    //CBC
    if(ui->radioButton_2->isChecked()){
        plaintext = CBC_decryption(key, ciphertext, iv);
    }
    //CFB
    if(ui->radioButton_3->isChecked()){
        plaintext = CFB_decryption(key, ciphertext, iv);
    }
    //OFB
    if(ui->radioButton_4->isChecked()){
        plaintext = OFB_decryption(key, ciphertext, iv);
    }
    //CTR
    if(ui->radioButton_5->isChecked()){
        plaintext = CTR_decryption(key, ciphertext, iv);
    }
    string str_plaintext = bits_to_str(plaintext);
    QString q_plaintext = QString::fromStdString(str_plaintext);
    ui->textEdit_3->setText(q_plaintext);
}
