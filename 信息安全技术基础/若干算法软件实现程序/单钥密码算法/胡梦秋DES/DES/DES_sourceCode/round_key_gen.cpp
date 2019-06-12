#include <round_key_gen.h>
#include <utility.h>

void key_generate(const vector<bool>& origin_key, vector<vector<bool> >& round_keys){
    vector<bool> key, left_key, right_key;
    substitute(64, 56, origin_key, key, parity_check_table);
    split(56, 28, key, left_key, right_key);
    round_keys.resize(16);
    for(int round = 0; round < 16; round ++){
        vector<bool> pre_key;
        left_shift(left_key, shift_table[round]);
        left_shift(right_key, shift_table[round]);
        combine(28, 56, left_key, right_key, pre_key);
        round_keys[round].resize(48);
        substitute(56, 48, pre_key, round_keys[round], key_reduce_table);
    }
}

void left_shift(vector<bool>& text, const int n){
    for(int i = 0; i < n; i++){
        bool temp = text[0];
        for(int j = 1; j < 28; j++){
            text[j - 1] = text[j];
        }
        text[27] = temp;
    }
}
