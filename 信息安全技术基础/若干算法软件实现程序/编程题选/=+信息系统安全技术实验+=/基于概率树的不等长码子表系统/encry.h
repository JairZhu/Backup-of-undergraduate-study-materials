#ifndef __Encry_h
#define __Encry_h
#include<fstream>
#include<string>
using namespace std;

class Encry{
public:
	Encry(ifstream *infile1,ifstream *infile2,ofstream *outfile);
	void encry();
private:
    ifstream *plaintext;
	ifstream *EncryTable;
	ofstream *ciphertext;
	string code[128];//码字表数组
};

//////////////////////////////////////////////////
Encry::Encry(ifstream *infile1,ifstream *infile2,ofstream *outfile)
{
	plaintext=infile1;
	EncryTable=infile2;
	ciphertext=outfile;
//读码字表
	char letter;
	char digit;
	char blank;
	string s;	
	while(EncryTable->peek()!=EOF){
		//读码字
		EncryTable->get(letter);
        EncryTable->get(blank);
		//读字字符串
		s="";
		while(EncryTable->peek()!='\n'){
            EncryTable->get(digit);
			s=s+digit;
		}
        EncryTable->get(blank);
		//用数组记录码字和字符串的对应关系
		code[(int)letter]=s;
	}
}

///////////////////////////////////////////////////////////////
void Encry::encry()
{
	char letter;
	string s;
	while(plaintext->peek()!=EOF){
        plaintext->get(letter);
		s=code[letter];
		(*ciphertext)<<s;		
	}
}
#endif  