// Program to find all anagrams of a given word, using a dictionary
// read from a file
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>
#include <iterator>
using namespace std;
typedef istream_iterator<string> string_input;


// 欢迎界面
void welcome()
{
	cout << "******************* 变位词查找系统Version1******************\n"
		<< "在词典中找出给定的字符串的所有变位词" << endl;
}

// 读入词典文件,并对词典单词.进行词典序排序
void readDict(vector<string> & dictionary)
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
	// 将词典文件内容读入到字符串向量dictionary中
	copy(string_input(ifs), string_input(),
		back_inserter(dictionary));
	// 为便于后面的查找操作，对词典排序
	sort(dictionary.begin(),dictionary.end());
	// 输出词典属性
	cout << "词典包含有 " 
		<< dictionary.size() << " 个单词\n\n";
	// 关闭文件
	ifs.close();
}

// 获取用户单词，查找变位词并输出
void analyseAnagram(const vector<string> & dictionary)
{
	cout << "请输入单词（或任意字母序列）" << endl;
	// 使用输入流迭代器p接受用户从标准输入流cin输入的字符串，
	// 直到用户输入流结束标志
	for (string_input p(cin); p != string_input(); ++p) 
	{
		cout << "查找输入单词的变位词中..." << endl;
		string word = *p;
		// 对输入word排序，以备进行全排列
		sort(word.begin(), word.end());
		// 记录是否在词典中查找变位词成功
		bool found_one = false;

		do 
		{
			if (binary_search(dictionary.begin(),
					dictionary.end(),
					word))
			// 对词典的词条进行二分查找，如果查找成功，
			// 输出该变位词，设置found_one为true
			{
				cout << "  " << word ;
				found_one = true;
			}
		} while (next_permutation(word.begin(), word.end()));
			// 获得按照词典顺序的下一个排列，如果成功，开始新一轮查找
		// 没有找到的情形
		if (!found_one) 
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
	vector<string> dictionary;
	readDict(dictionary);
	analyseAnagram(dictionary);

	system("pause");
	return 0;
}

