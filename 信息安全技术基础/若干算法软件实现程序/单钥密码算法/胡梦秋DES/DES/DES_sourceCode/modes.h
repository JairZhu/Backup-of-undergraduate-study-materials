#ifndef MODES_H
#define MODES_H
#include <vector>
#include "math.h"
using namespace std;


vector<bool> ECB_encryption(const vector<bool>& key, vector<bool>& plaintext);

vector<bool> ECB_decryption(const vector<bool>& key, vector<bool>& ciphertext);

vector<bool> CBC_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv);

vector<bool> CBC_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv);

vector<bool> CFB_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv);

vector<bool> CFB_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv);

vector<bool> OFB_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv);

vector<bool> OFB_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv);

vector<bool> CTR_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv);

vector<bool> CTR_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv);

vector<bool> shift_left(vector<bool> a, vector<bool> b);

#endif // MODES_H
