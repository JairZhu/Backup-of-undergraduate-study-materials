// File: hdecompress.cpp
// the program demonstrates Huffman decompression.
// after prompting for the name of the compressed
// file and the name for the decompressed file,
// an object of type HDecompress is declared, and
// the member function decompress() decompresses
// the file

#include <string>
#include "HDecomp.h"

using namespace std;

int main()
{
	string compFile, ucompFile;

	// prompt for the name of the compressed file and the
	// name for the decompressed file
	cout << "压缩文件名称: ";
	cin >> compFile;
	cout << "解压缩目标文件名称: ";
	cin >> ucompFile;

	HDecompress dcomp(compFile, ucompFile);
	// 解压缩文件
	dcomp.decompress();

	system("pause");
	return 0;
}
