#include <utility.h>
#include <iostream>
using namespace std;


vector<bool> str_to_bits(const string& str){
    vector<bool> bits(str.size() * 8);
    for(int i = 0; i < str.size(); i++){
        for(int j = 0; j < 8; j++){
            bits[i * 8 + j] = ((str[i] >> (7 - j)) & 1);
        }
    }
    return bits;
}

string bits_to_str(const vector<bool>& bits){
    string str;
    int c = bits.size() / 8;
    for(int i = 0; i < c; i++){
        int pow = 128;
        int sum = 0;
        for(int j = 0; j < 8; j++){
            sum += bits[i * 8 + j] * pow;
            pow /= 2;
        }
        str += (char)sum;
    }
    return str;
}

char int_to_hex(int a){
    char res;
    if(a < 10)
        res = (char)(a + '0');
    else
        res = (char)(a - 10 + 'A');
    return res;
}

string bits_to_hex(vector<bool> bits){
    string str;
    int len = bits.size() / 4;
    for(int i = 0; i < len; i++){
        int pow = 8;
        int sum = 0;
        for(int j = 0; j < 4; j++){
            sum += bits[i * 4 + j] * pow;
            pow /= 2;
        }
        str += int_to_hex(sum);
    }
    return str;
}

int hex_to_int(char ch){
    int res;
    if((int)ch >= 'A')
        res = (int)ch - 'A' + 10;
    else
        res = (int)ch - '0';
    return res;
}

vector<bool> hex_to_bits(string str){
    vector<bool> bits;
    for(int i = 0; i < str.size(); i++){
        int dec = hex_to_int(str[i]);
        int pow = 8;
        for(int j = 0; j < 4; j++){
            bits.push_back(dec / pow);
            dec %= pow;
            pow /= 2;
        }
    }
    return bits;
}

//置换盒
void substitute(const int in_size, const int out_size, const vector<bool>& input, vector<bool>& output, const int table[]){
    output.resize(out_size);
    for(int i = 0; i < out_size; i++){
        output[i] = input[table[i] - 1];
    }
}

//分裂
void split(const int a, const int b, const vector<bool>& text, vector<bool>& left_text, vector<bool>& right_text){
    left_text.resize(b);
    right_text.resize(b);
    for(int i = 0; i < a; i++){
        if(i < b)
            left_text[i] = text[i];
        else
            right_text[i - b] = text[i];
    }
}

//组合
void combine(const int a, const int b, const vector<bool>& left_text, const vector<bool>& right_text, vector<bool>& text){
    for(int i = 0; i < b; i++){
        if(i < a)
            text.push_back(left_text[i]);
        else
            text.push_back(right_text[i - a]);
    }
}


vector<bool> get_xor(const int size, const vector<bool> t1, const vector<bool> t2){
    vector<bool> res(size);
    for(int i = 0; i < size; i++){
        res[i] = t1[i] ^ t2[i];
    }
    return res;
}


vector<vector<bool> > devide(vector<bool>& a, const int n){
    //不能整除填充0
    while(a.size() % n != 0)
        a.push_back(false);
    int m = a.size() / n;
    vector<vector<bool> > res(m, vector<bool>(n));
    for(int i = 0; i < m; i++){
        for(int j = 0; j < n; j++){
            res[i][j] = a[i * n + j];
        }
    }
    return res;
}

vector<bool> link(const vector<vector<bool> >& a){
    int m = a.size();
    int n = a[0].size();
    vector<bool> res(m * n);
    for(int i = 0; i < m; i++){
        for(int j = 0; j < n; j++){
            res[i * n + j] = a[i][j];
        }
    }
    return res;
}

void print_bits(vector<bool> bits){
    for(int i = 0; i < bits.size(); i++)
        cout << bits[i];
    cout << endl;
}

void paddle(const int n, vector<bool>& v){
    if(v.size() < n){
        while(v.size() < n){
            v.push_back(0);
        }
        return;
    }
    else{
        while(v.size() > n){
            v.pop_back();
        }
        return;
    }
}
