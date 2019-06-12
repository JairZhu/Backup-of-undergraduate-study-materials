#ifndef ROUND_KEY_GEN_H
#define ROUND_KEY_GEN_H

#include <vector>
using namespace std;

void key_generate(const vector<bool>& origin_key, vector<vector<bool> >& round_keys);

void left_shift(vector<bool>& text, const int n);

#endif // ROUND_KEY_GEN_H
