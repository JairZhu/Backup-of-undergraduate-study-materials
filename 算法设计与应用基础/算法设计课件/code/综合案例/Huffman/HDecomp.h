#ifndef HUFFMAN_DECOMPRESS
#define HUFFMAN_DECOMPRESS

#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
#include <vector>
#include "HNode.h"					// DiskHuffNode class

typedef vector<bool> bit_vector;	//用于存放被压缩文件编码

class HDecompress
{
public:
	HDecompress(const string& cname, const string& uname);
		// 构造函数。调用setFiles()打开Huffman压缩文件cname
		// 并指定输出文件名uname

	void setFiles(const string& cname, const string& uname);
		// 打开Huffman压缩文件cname
		// 并指定输出文件名uname
		// throws the fileOpenError exception if a file
		// cannot be opened
	void decompress();
		// 文件解压缩

private:

	fstream source;
	fstream dest;
		// 输入流和输出流
	void file_to_mem(bit_vector& bv,fstream& istr, unsigned long totalBits);
	// 将二进制bit序列从内存传递到文件中
	bool filesOpen;
		// 源文件和目标文件是否打开？
};

HDecompress::HDecompress(const string& cname,
								 const string& uname): filesOpen(false)
{
	setFiles(cname, uname);
}

void HDecompress::setFiles(const string& cname, const string& uname)
{
	if (filesOpen)
	{
		source.close();
		dest.close();
	}

	// a Huffman compressed file is a binary file
	source.open(cname.c_str(), ios::in | ios::binary);
	// output using binary mode. we don't want '\n' expanded
	// to an end of line sequence. if the output file is a
	// textfile, its end of line characters were compressed
	// individually
	dest.open(uname.c_str(), ios::out | ios::binary | ios::trunc);
	filesOpen = true;
}


void HDecompress::file_to_mem(bit_vector &bv, 
							  std::fstream &istr, 
							  unsigned long totalBits)
{
	// 位序列中的整字节数目，
	// 不包含最末可能的不足整字节的尾部位数
	unsigned long bytecnt = totalBits>>3;
	// 不足整字节的尾部位数个数
	unsigned short retail = totalBits % 8;
	// 用于将字节表示转换为位表示
	typedef bitset<8> bitproxy;

	// 调整bit向量bv大小以容纳编码bit序列
	bv.resize(totalBits);
	// 标记位序列读入的当前位置
	unsigned long bitPos = 0;
	for(unsigned int i=0; i<bytecnt; i++)
	{
		// 逐字节读入源文件
		char ch=istr.get();
		// 将ch的字节表示转换为bit表示
		bitproxy bp(ch);
		// 将ch逐位复制到位向量中
		for(int j=0;j<8;j++,bitPos++)
		{
			bv[bitPos]=bp[j];
		}
	}
	if(retail)
	{	//如果位序列存在尾数部分，单独处理
		char ch=istr.get();
		bitproxy bp(ch);
		int i=0;
		while(bitPos<totalBits)
			bv[bitPos++]=bp[i++];
	}
}




void HDecompress::decompress()
{
	unsigned int i, bitPos;

	// 从压缩文件中读取treeSize（Huffman树大小）
	// 和totalBits（净荷位码大小）
	short treeSize;
	unsigned long totalBits;
	// 从压缩文件中读取Huffman树，放入tree向量容器中
	vector<DiskHuffNode> tree;
	// 从压缩文件中读取totalBits个bit位放入bits位向量中
	bit_vector bits;	
	// 读入Huffman树的大小
	source.read((char *)&treeSize, sizeof(short));

	// 调整存储Huffman树的向量大小，
	// 并输入树
	tree.resize(treeSize);
	source.read((char *)&tree[0], sizeof(DiskHuffNode) * treeSize);

	// 读入Huffman编码位序列总位数
	source.read((char *)&totalBits, sizeof(unsigned long));

	// 将Huffman编码位序列从文件读入内存用于解压缩
	file_to_mem(bits, source, totalBits);
	
	// 根据Huffman码遍历整棵树，译出相应字符
	// 从而恢复原始文件
	bitPos = 0;
	while (bitPos < totalBits)
	{
		// 树根节点在索引位置treeSize-1处
		i = treeSize-1;
		// 根据bits位在Huffman树向左下或右下遍历
		// 直到我们到达叶节点，开始新的从根节点的遍历
		while (tree[i].left != -1)
		{
			// 如果当前bit为0，向左，否则向右
			if (bits[bitPos] == 0)
				i = tree[i].left;
			else
				i = tree[i].right;
			// 当前位使用完毕，推进到下一位
			bitPos++;
		}
		// 到达叶节点，输出字符到文件
		dest.put(tree[i].ch);
	}

	// 关闭输入输出文件流
	source.close();
	dest.close();

	filesOpen = false;
}

#endif	// HUFFMAN_DECOMPRESS
