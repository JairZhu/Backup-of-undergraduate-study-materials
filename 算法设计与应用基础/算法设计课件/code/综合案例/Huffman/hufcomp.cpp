// File: hcompress.cpp
// the program demonstrates Huffman compression. the user
// enters the name of a file to compress and indicates
// whether the verbose option is desired. after compressing
// the file, the program outputs the compression ratio.
// if the Huffman tree has no more than 11 nodes, the tree
// is displayed

#pragma warning(disable : 4267 4244)

#include <iostream>
#include <iomanip>			//For setpricision
#include <string>

#include "HCompress.h"		// HCompress class

using namespace std;

int main()
{
	string fileName;
	bool verbose;
	char response;

	// prompt for the source file name and whether
	// to use the verbose option for Huffman compression
	cout << "请输入源文件名: ";
	cin >> fileName;
	cout << "显示进程状态消息否？ (y or n): ";
	cin >> response;
	if (response == 'y')
		verbose = true;
	else
		verbose = false;

	cout << endl;

	// declare an HCompress object
	HCompress hc(fileName, verbose);

	// compress the file
	hc.compress();

	// output the compression ratio
	hc.dispCompRatio();

	if (hc.size() <= 11)
	{
		// display the Huffman tree if the tree is small
		cout << "Huffman 树为：" << endl;
		hc.displayTree();
	}
	system("pause");
	return 0;
}

/*
Run 1:

请输入源文件名: demo.dat
   (16000 'a'   4000 'b'   8000 'c'   6000 'd'   20000 'e'   3000 'f')
显示进程状态消息否？ (y or n): y

源文件字符集频度分析中 ...
   File size: 57000 characters
   Number of unique characters: 6

构造Huffman树中 ...
   Number of nodes in Huffman tree: 11

生成Huffman码中 ...

Huffman树有 11 条目, 根节点索引 = 10

索引    符号    频度    父节点  左子节点        右子节点        Bit数   bit码
0       a       16000   9       -1              -1              2       10
1       b       4000    6       -1              -1              4       0111
2       c       8000    8       -1              -1              2       00
3       d       6000    7       -1              -1              3       010
4       e       20000   9       -1              -1              2       11
5       f       3000    6       -1              -1              4       0110
6       Int     7000    7       5               1
7       Int     13000   8       3               6
8       Int     21000   10      2               7
9       Int     36000   10      0               4
10      Int     57000   0       8               9

生成压缩文件中 ...

源文件大小 = 57000（bytes）
压缩文件大小 = 16822（bytes）
压缩比 = 3.39

                                                  57000

        21000                                                   36000

 c:8000               13000                              a:16000       e:20000

               d:6000               7000

                             f:3000        b:4000



Run 2:


请输入源文件名: webster.dict
显示进程状态消息否？ (y or n): n

源文件大小 = 2486904（bytes）
压缩文件大小 = 1355712（bytes）
压缩比 = 1.83


Run 3:


请输入源文件名: mspaint.exe
显示进程状态消息否？ (y or n): n

源文件大小 = 344064（bytes）
压缩文件大小 = 253663（bytes）
压缩比 = 1.36

*/
