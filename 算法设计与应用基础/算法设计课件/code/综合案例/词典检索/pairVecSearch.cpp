// Find all anagram groups in a dictionary, and print them to
// standard output stream
#include <algorithm>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <iterator>
using namespace std; 
#include "StringPair.h"	    // Definitions of PairString

typedef istream_iterator<string> string_input;
typedef vector<StringPair>::const_iterator CSP_Iter;

// 欢迎界面
void welcome()
{
	cout << "******************* 变位词查找系统Version2******************\n"
		<< "在词典中找出给定的字符串的所有变位词" << endl;
}

// 读入词典文件,构造词典模型
void readDict(vector<StringPair>& enhancedDict)
{
	// 从用户获取文件名称
	cout << "首先，请输入词典的文件名称：" << endl;
	string dictionary_name; 
	cin >> dictionary_name;
	// 打开文件
	ifstream ifs(dictionary_name.c_str());
	// 读入异常
	if (!ifs.is_open()) 
	{
		cerr << "异常：文件"<< dictionary_name 
			<< "没有找到 " << endl;
		exit(1);
	}
	cout << "词典读入中 ..." << flush;
	// 将词典文件内容读入到字符串向量enhancedDict中
	// 这一步发生了由string到StringPair的隐式类型转换
	// 由StringPair的单参数构造函数完成类型转换
	copy(string_input(ifs), string_input(),
		back_inserter(enhancedDict));
	// 为便于后面的查找操作，对词典排序
	sort(enhancedDict.begin(),enhancedDict.end());
	// 输出词典属性
	cout << "词典包含有 " 
		<< enhancedDict.size() << " 个单词\n\n";
	// 关闭文件
	ifs.close();
}

// 用于for_each(first,last, printString)
void printString(const string& s)
{
	cout << s << "  ";
}

// 获取用户单词，查找变位词并输出
void analyseAnagram(const vector<StringPair>& enhancedDict)
{
	cout << "请输入单词（或任意字母序列）" << endl;
	// 使用输入流迭代器p接受用户从标准输入流cin输入的字符串，
	// 直到用户输入流结束标志
	for (string_input p(cin); p != string_input(); ++p) 
	{
		cout << "查找输入单词的变位词中..." << endl;
		string word = *p;
		// 由word构造wordP
		StringPair wordP(word);
		pair<CSP_Iter,CSP_Iter> word_range 
			= equal_range(enhancedDict.begin(),enhancedDict.end(),wordP);
			// 对词典的词条进行二分查找的一个版本
		// 记录wordP在有序词典中的位置上界和下界
		CSP_Iter startPos = word_range.first;
		CSP_Iter finishPos = word_range.second;
		// 记录在词典中查找变位词是否成功
		bool existAnagram = (startPos != finishPos);
		// 输出该词条所有变位词
		for_each(startPos, finishPos,printString);
		cout << endl;
		// 没有找到的情形
		if (!existAnagram) 
			cout << "  抱歉，没有找到变位词\n";

		// 提示开始准备新的工作
		cout << "\n请输入下一个单词 " 
			<< "(或输入end-of-file字符终止程序 ) \n"
			<< "<end-of-file字符在Windows平台是Ctrl+Z，UNIX平台是Ctrl+D>: " << endl;
	}
}

int main() 
{
	welcome();
	vector<StringPair> dictionary;
	readDict(dictionary);
	analyseAnagram(dictionary);

#if 0
// 输出增强型词典，辅助观察
	ofstream ofs("enhancedDict.txt");
	CSP_Iter curPos = dictionary.begin();
	while(curPos != dictionary.end())
	{
		ofs << (*curPos).first << "\t";
		ofs << (*curPos).second << "\n";
		curPos++;
	}
#endif

	system("pause");
	return 0;
}