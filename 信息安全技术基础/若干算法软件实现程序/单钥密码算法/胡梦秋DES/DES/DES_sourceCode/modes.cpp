#include <modes.h>
#include <utility.h>
#include <cipher.h>
#include <round_key_gen.h>


vector<bool> ECB_encryption(const vector<bool>& key, vector<bool>& plaintext){
    vector<vector<bool> > p = devide(plaintext, 64);
    vector<vector<bool> > c(p.size(), vector<bool>(64));
    for(int i = 0; i < p.size(); i++){
        des_encryption(p[i], key, c[i]);
    }
    vector<bool> ciphertext = link(c);
    return ciphertext;
}

vector<bool> ECB_decryption(const vector<bool>& key, vector<bool>& ciphertext){
    vector<vector<bool> > c = devide(ciphertext, 64);
    vector<vector<bool> > p(c.size(), vector<bool>(64));
    for(int i = 0; i < p.size(); i++){
        des_decryption(c[i], key, p[i]);
    }
    vector<bool> plaintext = link(p);
    return plaintext;
}

vector<bool> CBC_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv){
    vector<vector<bool> > p = devide(plaintext, 64);
    vector<vector<bool> > c(p.size(), vector<bool>(64));
    vector<bool> temp = get_xor(64, p[0], iv);
    des_encryption(temp, key, c[0]);
    for(int i = 1; i < p.size(); i++){
        vector<bool> t = get_xor(64, p[i], c[i - 1]);
        des_encryption(t, key, c[i]);
    }
    vector<bool> ciphertext = link(c);
    return ciphertext;
}

vector<bool> CBC_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv){
    vector<vector<bool> > c = devide(ciphertext, 64);
    vector<vector<bool> > p(c.size(), vector<bool>(64));
    des_decryption(c[0], key, p[0]);
    p[0] = get_xor(64, p[0], iv);
    for(int i = 1; i < c.size(); i++){
        des_decryption(c[i], key, p[i]);
        p[i] = get_xor(64, p[i], c[i - 1]);
    }
    vector<bool> plaintext = link(p);
    return plaintext;
}

vector<bool> shift_left(vector<bool> a, vector<bool> b){
    vector<bool> res;
    int size1 = a.size();
    int size2 = b.size();
    for(int i = 0; i < size1; i++){
        if(i < (size1 - size2)){
            res.push_back(a[i + size2]);
        }
        else{
            res.push_back(b[i - (size1 - size2)]);
        }
    }
    return res;
}

vector<bool> CFB_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv){
    int r = 8;//一个字符的大小
    vector<vector<bool> > p = devide(plaintext, r);
    vector<vector<bool> > c(p.size());
    vector<bool> s;
    vector<bool> k(r);
    vector<bool> t(64);
    for(int i = 0; i < p.size(); i++){
        if(i == 0){
            s = iv;
        }
        else{
            s = shift_left(s, c[i - 1]);
        }
        des_encryption(s, key, t);
        for(int j = 0; j < r; j++){
            k[j] = t[j];
        }
        c[i] = get_xor(r, p[i], k);
    }
    vector<bool> ciphertext = link(c);
    return ciphertext;
}

vector<bool> CFB_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv){
    int r = 8;//一个字符的大小
    vector<vector<bool> > c = devide(ciphertext, r);
    vector<vector<bool> > p(c.size());
    vector<bool> s;
    vector<bool> k(r);
    vector<bool> t(64);

    for(int i = 0; i < c.size(); i++){
        if(i == 0){
            s = iv;
        }
        else{
            s = shift_left(s, c[i - 1]);
        }
        des_encryption(s, key, t);
        for(int j = 0; j < r; j++){
            k[j] = t[j];
        }
        p[i] = get_xor(r, c[i], k);
    }
    vector<bool> plaintext = link(p);
    return plaintext;
}

vector<bool> OFB_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv){
    int r = 8;//一个字符的大小
    vector<vector<bool> > p = devide(plaintext, r);
    vector<vector<bool> > c(p.size());
    vector<bool> s;
    vector<bool> k(r);
    vector<bool> t(64);
    for(int i = 0; i < p.size(); i++){
        if(i == 0){
            s = iv;
        }
        else{
            s = shift_left(s, k);
        }
        des_encryption(s, key, t);
        for(int j = 0; j < r; j++){
            k[j] = t[j];
        }
        c[i] = get_xor(r, p[i], k);
    }
    vector<bool> ciphertext = link(c);
    return ciphertext;
}

vector<bool> OFB_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv){
    int r = 8;//一个字符的大小
    vector<vector<bool> > c = devide(ciphertext, r);
    vector<vector<bool> > p(c.size());
    vector<bool> s;
    vector<bool> k(r);
    vector<bool> t(64);

    for(int i = 0; i < c.size(); i++){
        if(i == 0){
            s = iv;
        }
        else{
            s = shift_left(s, k);
        }
        des_encryption(s, key, t);
        for(int j = 0; j < r; j++){
            k[j] = t[j];
        }
        p[i] = get_xor(r, c[i], k);
    }
    vector<bool> plaintext = link(p);
    return plaintext;
}

vector<bool> CTR_encryption(const vector<bool>& key, vector<bool>& plaintext, const vector<bool>& iv){
    vector<vector<bool> > p = devide(plaintext, 64);
    vector<vector<bool> > c(p.size());
    int counter = 0;
    for(int i = 0; i < iv.size(); i++){
        counter += iv[i] * (int)pow(2, 7 - i);
    }
    for(int i = 0; i < p.size(); i++){
        counter = (counter + i) % (int)pow(2, p.size());
        vector<bool> k(64);
        des_encryption(iv, key, k);
        c[i] = get_xor(64, p[i], k);
    }
    vector<bool> ciphertext = link(c);
    return ciphertext;
}

vector<bool> CTR_decryption(const vector<bool>& key, vector<bool>& ciphertext, const vector<bool>& iv){
    vector<vector<bool> > c = devide(ciphertext, 64);
    vector<vector<bool> > p(c.size());
    int counter = 0;
    for(int i = 0; i < iv.size(); i++){
        counter += iv[i] * (int)pow(2, 7 - i);
    }
    for(int i = 0; i < p.size(); i++){
        counter = (counter + i) % (int)pow(2, p.size());
        vector<bool> k(64);
        des_encryption(iv, key, k);
        p[i] = get_xor(64, c[i], k);
    }
    vector<bool> plaintext = link(p);
    return plaintext;
}
