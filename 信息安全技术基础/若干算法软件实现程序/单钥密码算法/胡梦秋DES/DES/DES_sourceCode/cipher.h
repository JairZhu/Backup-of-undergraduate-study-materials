#ifndef CIPHER_H
#define CIPHER_H

#include <vector>
using namespace std;

void des_encryption(const vector<bool>& plaintext, const vector<bool>& key, vector<bool>& ciphertext);

void des_decryption(const vector<bool>& ciphertext, const vector<bool>& key, vector<bool>& plaintext);

//密码
void des_main(const vector<bool>& plaintext, const vector<vector<bool> >& keys, vector<bool>& ciphertext);

//混合器
void mixer(vector<bool>& left_text, vector<bool>& right_text, const vector<bool>& round_key);

//交换器
void exchange(vector<bool>& left_text, vector<bool>& right_text);

//des函数
void des_fun(const vector<bool>& input, const vector<bool>& round_key, vector<bool>& output);

//代换
void replace(vector<bool>& input, vector<bool>& output);


#endif // CIPHER_H
