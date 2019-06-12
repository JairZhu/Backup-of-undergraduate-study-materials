#ifndef __Decry_h
#define __Decry_h
#include<iostream>
#include<fstream>
#include<string>
using namespace std;

class Decry{
public:
	Decry(ofstream *outfile,ifstream *infile1,ifstream *infile2);
	void decry();
private:
	bool getLetter(string s,char &letter)const;

    ofstream *decryedText;
	ifstream *DecryTable;
	ifstream *ciphertext;
	string code[128];//码字表数组
};

//////////////////////////////////////////////////
Decry::Decry(ofstream *outfile,ifstream *infile1,ifstream *infile2)
{
	decryedText=outfile;
	DecryTable=infile1;
	ciphertext=infile2;
//读码字表
	char letter;
	char digit;
	char blank;
	string s;	
	while(DecryTable->peek()!=EOF){
		//读码字
		DecryTable->get(letter);
        DecryTable->get(blank);
		//读字字符串
		s="";
		while(DecryTable->peek()!='\n'){
            DecryTable->get(digit);
			s=s+digit;
		}
        DecryTable->get(blank);
		//用数组记录码字和字符串的对应关系
		code[(int)letter]=s;
	}
}

///////////////////////////////////////////////////////////////
void Decry::decry()
{
	char letter;
	char digit;
	string s;
	s="";
	while(ciphertext->peek()!=EOF){
        ciphertext->get(digit);
		s=s+digit;
		if(getLetter(s,letter)){//若s存在码字表
			(*decryedText)<<letter;
		    s="";
		}
				
	}
}
////////////////////////////////////////////////////////
bool Decry::getLetter(string s,char &letter)const
{
	for(int i=0;i<128;i++)
		if( s.compare(code[i])==0 ){
			letter=char(i);
			return true;
		}
	return false;
}
#endif  