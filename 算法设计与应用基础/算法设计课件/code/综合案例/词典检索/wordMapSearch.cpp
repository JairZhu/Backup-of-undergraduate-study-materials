// Find all anagram groups in a dictionary, and print them to
// standard output stream
#include <algorithm>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <set>
#include <iterator>
using namespace std; 


typedef istream_iterator<string> string_input;
typedef set<string> WordSet;
typedef map<string,WordSet> WordMap;




// 欢迎界面
void welcome()
{
	cout << "******************* 变位词查找系统Version3******************\n"
		<< "在词典中找出给定的字符串的所有变位词" << endl;
}

// 读入词典文件,构造词典模型
void readDict(WordMap& enhancedDict)
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
	cout << "词典读入中 ..." << endl;
	// 将词典文件内容读入到映射enhancedDict中
	string word;
	string key;
	size_t wordCount = 0;
	while(ifs)
	{
		// 逐行读取词条
		getline(ifs,key);
		word = key;
		sort(key.begin(),key.end());
		// 将词条和特征码插入到词典map模型实例中
		enhancedDict[key].insert(word);
		// 更新词条数目基数
		++wordCount;
	}
	// 输出词典属性
	cout << "词典包含有 " 
		<< wordCount << " 个单词\n"<< endl << endl;
#if 0
	cout << "词典占用内存大小为"
		<< sizeof(enhancedDict) << "B" << endl << endl;
#endif;
	// 关闭文件
	ifs.close();
}

// 用于for_each(first,last, printString)
void printString(const string& s)
{
	cout << s << "  ";
}

// 获取用户单词，查找变位词并输出
void analyseAnagram(const WordMap& enhancedDict)
{
	cout << "请输入单词（或任意字母序列）" << endl;
	// 使用输入流迭代器p接受用户从标准输入流cin输入的字符串，
	// 直到用户输入流结束标志
	for (string_input p(cin); p != string_input(); ++p) 
	{
		cout << "查找输入单词的变位词中..." << endl;
		string word = *p;
		// 将word变换为它的特征码
		sort(word.begin(),word.end());

		// word的变位词集合
		const WordSet& anagramSet = (*(enhancedDict.find(word))).second;

		// 直接输出集合即可
		for_each(anagramSet.begin(),anagramSet.end(),printString);
		cout << endl;
		// 如果集合为空
		if(anagramSet.empty())		
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
	WordMap dictionary;
	readDict(dictionary);
	analyseAnagram(dictionary);

	system("pause");
	return 0;
}