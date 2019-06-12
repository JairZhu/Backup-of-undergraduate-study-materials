#ifndef HUFFMAN_COMPRESS
#define HUFFMAN_COMPRESS

#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstdlib>
#include <string>
#include <vector>
#include <queue>			//  For priority_queue
#include <functional>
#include <sstream>
#include <algorithm>

#include "HNode.h"			// Huffman node classes and node display

const int MAXCHARS = 256;
	// ASCII字符数目
typedef bitset<MAXBITSIZE> BitCode;		
	//存放字符位码
typedef vector<bool> bit_vector;
	//用于存放被压缩文件编码


class HCompress
{
public:
	HCompress(const string& fname, bool v = false);
		// 构造函数。调用setFile() 打开源文件fname,
		// 生成二进制输出文件并添加后缀".huf"标识，任何先前的扩展名都被替换
		// 逻辑标志v确定是否输出进度消息

	void setFile(const string& fname);
		// 打开源文件fname,生成二进制输出文件以".huf"为后缀

	void compress();
		// 压缩文件

	void dispCompRatio() const;		
		// 显示压缩比

	int size() const;
		// 返回Huffman树中节点数目

	void displayTree() const;
		// 显示Huffman树
		// 考虑屏幕尺寸，当树大小<= 11时推荐这样做
private:
	fstream source;
	fstream dest;
		// 输入输出流
	vector<int> charFreq, charLoc;
		// charFreq用于统计字符频率
		// charLoc维护文件出现的字符在Huffman树中的下标
	int numberLeaves;
		// numberLeaves是树的叶节点（字符节点）数目
	short treeSize;
		// 压缩文件中Huffman树节点数目
	vector<HuffNode> tree;
		// 存储Huffman树
	bool verbose;
		// 输出进度消息否？
	unsigned long fileSize;
		// 源文件的大小
	unsigned long totalBits;
		// 源文件的压缩镜像中使用的总bits数目
	bool oneChar;
		// 树仅有一个唯一字符么？
	bool filesOpen;
		// 源和目的文件打开了么？

	void freqAnalysis();
		// 判断源文件中字符频度并将它们存储到charFreq
		// 同时确定numberLeaves，并列出fileSize
		// 这样我们可以看出压缩算法的效果

	void buildTree();
		// 构造Huffman树 

	void generateCodes();
		// 对每个叶节点，沿Huffman树上溯以确定每个字符的Huffman码 
		// 并计算被压缩数据的总位数

	void writeCompressedData();
		// 再次读入源文件
		// 并将依据Huffman树指定的Huffman码写到流dest中
	void mem_to_file(bit_vector& bv,fstream& ostr);
		// 将二进制bit序列从内存传递到文件中

	void treeData();
		// 输出Huffman树数据
};

void HCompress::freqAnalysis()
{
	unsigned char ch;

	numberLeaves = 0;
	fileSize = 0;

	while (true)
	{
		ch = source.get();
		if (!source)
			break;

		// found 1 more char in the source file
		fileSize++;

		// count an occurrence of ch
		charFreq[ch]++;

		// if first time we have found ch, count it as a leaf
		if (charFreq[ch] == 1)
			numberLeaves++;
	}
	if (verbose)
		cout << "    文件大小为 : " << fileSize << " 个字符" << endl
			  << "   不同字符的数目为: "
			  << numberLeaves << endl << endl;
}

void HCompress::buildTree()
{
	// 顺序遍历Huffman树节点
	int i, nodeIndex;
	// 捕捉从优先级队列中出来的节点
	HuffNode x, y;
	// 最小优先级队列，用于构建Huffman树
	priority_queue<HuffNode, vector<HuffNode>, greater<HuffNode> > pq;

	// 处理文件仅有一个独特字符的特殊情形
	if (numberLeaves == 1)
	{
		// 设置叶节点数目为2，
		// 并在索引0或1位置添加1个叶节点
		// 因为在这些位置的字符不出现在文件中
		numberLeaves = 2;
		if (charFreq[0] != 0)
			charFreq[1] = 1;
		else
			charFreq[0] = 1;

		// 记录我们已经添加了填充节点
		oneChar = true;
	}
	else
		oneChar = false;

	// 树的大小为2*numberLeaves-1
	treeSize = 2*numberLeaves - 1;
	tree.resize(treeSize);

	// 检索我们构造中的树
	nodeIndex = 0;

	// 开始构造各个叶节点
	//    value = char(i)
	//    left/right = NIL,
	//    frequency = charFreq[i]
	//    index = nodeIndex
	//	  parent, numberOfBits, maxSizeOfBits 为默认值
	// 在charLoc中记录叶节点的位置，将节点插入到最小优先级队列中
	for (i=0; i < MAXCHARS; i++)
		if (charFreq[i] != 0)
		{
			tree[nodeIndex] = HuffNode((unsigned char)(i), NIL, NIL,
				                        charFreq[i], nodeIndex);
			pq.push(tree[nodeIndex]);
			// 记录该叶节点的索引，用于
			// writeCompressedData()函数
			charLoc[i] = nodeIndex;
			// 准备构造下一个节点
			nodeIndex++;
		}

	// 对于 numberLeaves-1 次迭代, 移除节点对,
	// 生成父节点, 并将父节点插入树中
	for (i=1; i <= numberLeaves-1; i++)
	{
		// 移除频率最低的两个节点。它们在向量树中对应节点的副本
		// 位置为x.index和y.index
		x = pq.top();
		pq.pop();
		y = pq.top();
		pq.pop();

		// 生成父节点（内部节点），它的子节点
		// 在数组树中的索引位置为x.index和y.index，
		// 它的频度为x和y的频度和
		// 这个节点的索引为nodeIndex，
		// 其父节点暂时设为0
		tree[nodeIndex] = HuffNode(char(0), x.index, y.index,
											x.freq + y.freq,
											nodeIndex, 0, 0, 0);

		// 使用x.index和y.index，
		// 将nodeIndex分配为x和y的父节点成员变量的值
		tree[x.index].parent = nodeIndex;
		tree[y.index].parent = nodeIndex;

		// 将新的父节点插入到优先级队列
		pq.push(tree[nodeIndex]);

		nodeIndex++;
	}
	if (verbose)
		cout << "   Huffman树的节点数目: "
			  << treeSize << endl << endl;
}

void HCompress::generateCodes()
{
	int i, j;
	int bitNumber, current, parent;
	// use to compute each character's bit code
	BitCode bits;

	totalBits = 0;

	// the nodes tree[0], tree[1], ..., tree[numberLeaves-1] are
	// all leaf nodes. for each leaf, follow the parent index
	// up to the root and build the bit code for the character
	for (i=0; i < numberLeaves; i++)
	{
		// starting bit number of 0
		bitNumber = 0;
		// clear all the bits in the BitVector object bits
		bits.reset();
		// parent of our current leaf node
		parent = tree[i].parent;
		// identify the current node
		current = i;

		// continue generating bits until we hit the root,
		// whose parent is 0
		while (parent != 0)
		{
			// if the current node is the right child
			// of parent, add a 1 to bits at bitNumber.
			// otherwise, the bit is a 0, and bits
			// began with all zeros
			if (tree[parent].right == current)
				bits.set(bitNumber);
			// advance to the next bit number
			bitNumber++;
			// find the next parent
			current = parent;
			parent = tree[current].parent;
		}

		// the concluding value of bitNumber is the number of
		// bits in the Huffman code for tree[i].ch
		tree[i].numberOfBits = bitNumber;

		// copy the Huffman code from bits to tree[i].bits.
		// the order must be reversed
		for (j=bitNumber-1; j >= 0; j--)
			if (bits.test(j))
				tree[i].bits.set(bitNumber-1-j);

		// add the bit contribution of the character
		// to the total number of bits. in other words,
		// add the path weight of the leaf node to the
		// external path weight
		totalBits += bitNumber * tree[i].freq;
	}
}

void HCompress::mem_to_file(bit_vector& bv,fstream& ostr)
{
	// 我们无法直接将二进制bit序列vector<bool>传递到文件
	// 借助字符串流ostringstream将位流转换，并传递到文件中
	ostringstream os;
	// 位向量中包含的字节单元个数，如果尾部不足整字节，
	// 则补齐为整字节
	int bytecnt = (bv.size()+7) >> 3;
	// bitset对象具有转换为unsigned long的方法
	bitset<8> btemp;
	for (int i = 0; i < bytecnt; i++)
	{
		// 将向量每8位转换为bitset<8>对象
		// 再进一步转换为unsigned long
		for(int j=0; j<8; j++)
			btemp[j]= bv[8*i+j];
		char ch=btemp.to_ulong();
		ostr.put(ch);
	  		// 将二进制bit序列从内存传递到文件中
	}
}


void HCompress::writeCompressedData()
{
	// 用于容纳压缩文件Huffman码的位向量
	bit_vector compressedData(totalBits,false);
	int bitPos, i, j;
	unsigned char ch;

	// 为源文件清除end-of-file状态标记
	// 并将文件指针设为文件的开始位置
	source.clear();
	source.seekg(0, ios::beg);

	// bitPos用于将bits位码放入compressedData中
	bitPos = 0;

	// 再次读取源文件
	// 并在compressedData中生成Huffman码
	while (true)
	{
		// 获取下一个字符
		ch = source.get();

		if (!source)
			break;

		// 含有ch的树节点的index
		i = charLoc[ch];

		// 将tree[i].ch的位码放入位向量中
		for (j=0;j < tree[i].numberOfBits; j++)
		{
			// 当tree[i].bits[j]为1时，
			// 对compressedData相应位置位
			if (tree[i].bits.test(j))
				compressedData[bitPos] = true;
			// 一直将bitPos向前推进
			bitPos++;
		}
	}

	// 将位码由内存compressedData中写入到磁盘文件
	mem_to_file(compressedData,dest);
}

void HCompress::treeData()
{
	int i, j;

	cout << "Huffman树有 " << treeSize << " 条目, 根节点索引 = "
		  << treeSize-1 << endl << endl;

	// table header
	cout <<  "索引\t" << "符号\t"
		  << "频度\t" << "父节点\t"
		  << "左子节点\t" << "右子节点\t"
		  << "Bit数\t" << "bit码" << endl;

	// generate the table lines
	for (i=0;i < treeSize;i++)
	{
		cout << i << "\t";
		if (' ' <= tree[i].ch && tree[i].ch <= '~')
			cout << tree[i].ch << "\t";
		else if (i < numberLeaves)
		{
			cout << hex
				  << int(tree[i].ch) << "\t";
		}
		else
			cout << "Int"<< "\t";
		cout << tree[i].freq << "\t"
			  << tree[i].parent << "\t"
			  << tree[i].left<< "\t\t" << tree[i].right<< "\t\t";
		if (tree[i].numberOfBits != 0)
			  cout << tree[i].numberOfBits << "\t";
		for (j=0;j < tree[i].numberOfBits;j++)
			if (tree[i].bits[j])
				// only use setw(7) once
				//if (j == 0)
				//	cout << setw(7) << 1;
				//else
					cout << 1;
			else
				// only use setw(7) once
				//if (j == 0)
				//	cout << setw(7) << 0;
				//else
					cout << 0;
		cout << endl;
	}
	cout << endl;
}

// constructor must initialize charFreq and charLoc to
// have MAXCHARS characters
HCompress::HCompress(const string& fname, bool v):
	charFreq(MAXCHARS), charLoc(MAXCHARS), verbose(v), filesOpen(false)
{
	setFile(fname);
}

void HCompress::setFile(const string& fname)
{
	string ofname;
	int i;

	if (filesOpen)
	{
		source.close();
		dest.close();
	}

	// input using binary mode. we don't want the end of line
	// sequence translated to '\n'
	source.open(fname.c_str(), ios::in | ios::binary);
	ofname = fname;

	// if the original file name ends with an extension (".xxx"),
	// remove the extension. in any case, add the extension ".huf".

	// find the last occurrence of '.'
	if ((i = ofname.find_last_of('.')) != -1)
		// there is an extension. remove everything
		// from '.' to the end of the string
		ofname.erase(i);
	// add ".huf" as the extension
	ofname += ".huf";

	// open the compressed image file in binary mode
	dest.open(ofname.c_str(), ios::out | ios::binary | ios::trunc);
	filesOpen = true;
}

void HCompress::compress()
{
	int i;
	DiskHuffNode tmp;

	if (verbose)
		cout << "源文件字符集频度分析中 ..." << endl;
	// 执行频度分析
	freqAnalysis();

	if (verbose)
		cout << "构造Huffman树中 ..." << endl;
	// 构建Huffman树
	buildTree();

	if (verbose)
		cout << "生成Huffman码中 ..." << endl << endl;
	// 为每个字符生成Huffman码，并计算压缩字符中的总字符数目
	generateCodes();

	// 如果选择verbose，此时树已生成，可以输出树数据
	if (verbose)
		treeData();

	if (verbose)
		cout << "生成压缩文件中 ..." << endl << endl;
	// 输出树大小
	dest.write((char *)&treeSize, sizeof(short));
	
	// 输出树：注意我们只输出HuffNode对象的基类部分，
	// 解压缩Huffman所需要的仅是字符和子节点指针
	for (i=0; i < treeSize; i++)
	{
		tmp = (DiskHuffNode)tree[i];
		dest.write((char *) &tmp, sizeof(DiskHuffNode));
	}
	// 对于仅含有单个字符的源文件，
	// 删除由于附加叶节点所添加到总体代价的多余位
	if (oneChar)
		totalBits--;
	// 输出Huffman压缩文件的比特总数目
	dest.write((char *)&totalBits, sizeof(unsigned long));
	// 完整读入源文件，在Huffman树中查找对应每个字符的Huffman码
	// 写入到dest文件中
	writeCompressedData();

	// 关闭源文件和目的文件
	source.close();
	dest.close();

	filesOpen = false;
}

void HCompress::dispCompRatio() const
{
	double compRatio;
	//压缩文件大小
	unsigned long out_bytecnt = sizeof(short) + treeSize*sizeof(DiskHuffNode) +
			 sizeof(unsigned long) + (totalBits+7)/8;

	// determine the ratio of the size of the compressed file
	// to the size of the orginal
	compRatio = double(fileSize)/out_bytecnt;
	cout << "源文件大小 = "	<< fileSize << "（bytes）" << endl
		 << "压缩文件大小 = " << out_bytecnt << "（bytes）" << endl
		 <<	"压缩比 = " << setprecision(3) << compRatio << endl << endl;
}

int HCompress::size() const
{
	return treeSize;
}

void HCompress::displayTree() const
{
	displayHuffmanTree(tree);
	cout << endl << endl << endl;
}

#endif	// HUFFMAN_COMPRESS
