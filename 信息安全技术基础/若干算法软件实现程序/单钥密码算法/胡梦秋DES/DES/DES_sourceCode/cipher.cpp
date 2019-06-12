#include "cipher.h"
#include "utility.h"
#include "round_key_gen.h"

void des_encryption(const vector<bool>& plaintext, const vector<bool>& key, vector<bool>& ciphertext){
    vector<vector<bool> > round_keys;
    key_generate(key, round_keys);
    des_main(plaintext, round_keys, ciphertext);
}

void des_decryption(const vector<bool>& ciphertext, const vector<bool>& key, vector<bool>& plaintext){
    vector<vector<bool> > temp, round_keys;
    key_generate(key, temp);
    for(int i = 0; i < temp.size(); i++)
        round_keys.push_back(temp[temp.size() - i - 1]);
    des_main(ciphertext, round_keys, plaintext);
}

void des_main(const vector<bool>& plaintext, const vector<vector<bool> >& keys, vector<bool>& ciphertext){
    vector<bool> in_text, out_text, left_text, right_text;
    substitute(64, 64, plaintext, in_text, init_table);
    split(64, 32, in_text, left_text, right_text);
    for(int round = 0; round < 16; round++){
        mixer(left_text, right_text, keys[round]);
        if(round != 15)
            exchange(left_text, right_text);
    }
    combine(32, 64, left_text, right_text, out_text);
    ciphertext.resize(64);
    substitute(64, 64, out_text, ciphertext, final_table);
}

void mixer(vector<bool>& left_text, vector<bool>& right_text, const vector<bool>& round_key){
    vector<bool> t;
    des_fun(right_text, round_key, t);
    left_text = get_xor(32, left_text, t);
}

void exchange(vector<bool>& left_text, vector<bool>& right_text){
    vector<bool> temp;
    temp = left_text;
    left_text = right_text;
    right_text = temp;
}

void des_fun(const vector<bool>& input, const vector<bool>& round_key, vector<bool>& output){
    vector<bool> t1, t2, t3;
    substitute(32, 48, input, t1, extend_table);
    t2 = get_xor(48, t1, round_key);
    replace(t2, t3);
    output.resize(32);
    substitute(32, 32, t3, output, direct_table);
}

void replace(vector<bool>& input, vector<bool>& output){
    output.resize(32);
    for(int i = 0; i < 8; i++){
        int row = 2 * input[i * 6] + input[i * 6 + 5];
        int col = 8 * input[i * 6 + 1] + 4 * input[i * 6 + 2] + 2 * input[i * 6 + 3] + input[i * 6 + 4];
        int value = replace_tables[i][row][col];
        output[i * 4] = value / 8;
        value %= 8;
        output[i * 4 + 1] = value / 4;
        value %= 4;
        output[i * 4 + 2] = value / 2;
        value %= 2;
        output[i * 4 + 3] = value;
    }
}
