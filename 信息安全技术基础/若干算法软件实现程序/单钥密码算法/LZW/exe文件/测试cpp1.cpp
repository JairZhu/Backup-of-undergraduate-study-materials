//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdio.h>  //zqw
#pragma hdrstop
#include "Unit1.h"
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
#define MaxWndSize 2048   // 窗口的最大尺寸
#define MaxMatch 2048     // 最长可匹配的长度
#define BlockLen 65536    // 每次读入内存的文件块的大小

int CurByte;              // 压缩文件当前位置的字节偏移
int CurBit;               // 压缩文件当前位置的位偏移

//---------------------------------------------------------------------------

// 下面是算法实现的一组核心函数


//****************************************************************************//
// 功能：在滑动窗口中查找最长匹配串（用KMP算法）
// 参数说明：
//        window - 滑动窗口的起始指针
//	  Start - 待匹配串的起始位置（即lookahead窗口的起始位置）
//	  Offset - 匹配串在滑动窗口内的偏移，用于接收结果
//	  Len - 匹配串的长度，用于接收结果
// 返回值：找到长度大于1的匹配串则返回true，否则返回false
//****************************************************************************//
bool FindMatch(BYTE* window, int Start, int* Offset, int* Len)
{
    int Fail[MaxMatch];  // 存放失配函数
    int FailCount;       // 记录失配函数已经计算了几个
    int P1;              // 目标串的扫描指针
    int P2;              // 待匹配串的扫描指针
    int MatchLen;        // 匹配长度
    int temp;

    // 初始化数据
    P1=0;
    P2=0;
    FailCount=0;
    Fail[0]=-1;
    MatchLen=0;
    (*Len)=0;

    // 找最长匹配串
    while( P1 < Start && P2 < MaxMatch - 1 )
    {
        // 对应的字符匹配
    	if( window[P1] == window[Start+P2] )
    	{
      	    P1++;
	    P2++;
	    MatchLen++;     // 本次匹配长度＋1

            // 若P2处还没计算失配函数，则计算失配函数Fail[P2]
	    if( P2 > FailCount )
	    {
	    	temp = Fail[P2-1];
                // 递推计算Fail[P2]
	    	while( window[Start+P2]!= window[Start+temp+1] && temp>=0)
		    temp = Fail[temp];
		if( window[Start+P2] == window[Start+temp+1])
		    Fail[P2]=temp+1;
		else Fail[P2]=-1;
                // 失配函数计数值加一
		FailCount++;
            }
        }
	else
	{
	    if( P2 == 0 ) P1++;
	    else
	    {
                // 若本次匹配的长度超过历史记录，则修改历史记录
	    	if( MatchLen >(*Len) )
	    	{
                    (*Len) = MatchLen;
		    (*Offset) = P1 - MatchLen;
		}
                // 失配后，继续寻找其他匹配位置
		P2=Fail[P2-1]+1;
		MatchLen = P2;
            }
        }
    }
    // 若本次匹配的长度超过历史记录，则修改历史记录
    if( MatchLen > (*Len) )
    {
    	(*Len) = MatchLen;
    	(*Offset) = P1 - MatchLen;
    }

    if( *Len > 1 ) return true;
    else return false;
}


//****************************************************************************//
// 功能：压缩缓冲区中的内容
// 参数说明：
//        src - 源数据内存缓冲区（待压缩数据区）指针
//	  srclen - 源数据块（待压缩数据区）字节长度
//	  dest - 目标数据内存缓冲区（存放压缩后的编码）指针
// 返回值：压缩后数据的长度（正数——正常压缩数据的长度，零——数据无法压缩
//         负数——出错）
//****************************************************************************//
int Compress(BYTE* src, int srclen, BYTE* dest)
{
    BYTE* window;    // 滑动窗口的起始位置
    int CurWndSize;  // 当前窗口大小
    int Lookahead;   // 向前看窗口的起始位置
    int post;        // 已压缩数据的计数值
    int off;         // 匹配串在滑动窗口内的偏移
    int len;         // 匹配串的长度

    // 判断异常
    if (srclen > BlockLen)  return -1;

    // 初始化数据
    CurByte = 0;
    CurBit = 0;
    window = src;
    CurWndSize = 0;  //zqw
    Lookahead = 0 ;

    for (post =0; post < srclen; post++ )
    {
        // 若无法压缩
        if (CurByte >= srclen)  return 0;

        // 若找到长度大于一的匹配串
	if (FindMatch(window, Lookahead, &off, &len))
	{
	    // 输出编码格式（flag，len，offset）
            // 先输出flag（＝1，长度为1bit）
            CodeOutput(dest, 1, 1, FALSE);
            // 输出len的 γ编码
	    CodeOutput(dest, len, 0, TRUE);
            // 输出匹配位置在滑动窗口中的偏移，位数由当前窗口大小决定
            CodeOutput(dest, off, UpperLog2(CurWndSize), FALSE);

	    // 窗口滑动
            if( CurWndSize == MaxWndSize ) window = window + len;
            else if( CurWndSize + len > MaxWndSize)
            {
                window = window + ( CurWndSize + len - MaxWndSize );
                CurWndSize = MaxWndSize;
                Lookahead = MaxWndSize;
            }
            else
            {
                CurWndSize = CurWndSize + len;  //zqw
	        Lookahead = Lookahead + len ;
            }

            post = post + len - 1;
        }
	else
	{
	    // 输出单个非匹配字符，格式（flag，char）
	    CodeOutput(dest, 0, 1, FALSE);
	    CodeOutput(dest, (DWORD)(src[post]), 8, FALSE);

	    // 窗口滑动
            if( CurWndSize == MaxWndSize ) window = window + 1;
            else
            {
                CurWndSize++;  //zqw
                Lookahead++;
            }
        }
    }

    // 计算压缩后数据的长度
    int destlen = CurByte + ((CurBit) ? 1 : 0);

    if (destlen >= srclen)  return 0;
    return destlen;
}


//****************************************************************************//
// 功能：解压缩缓冲区中的内容
// 参数说明：
//        source - 源数据内存缓冲区（接收解压缩后的数据）指针
//	  srclen - 源数据块字节长度
//	  dest - 压缩数据内存缓冲区指针
// 返回值：解压成功返回true，不成功返回false
//****************************************************************************//
BOOL Extract(BYTE* source, int srclen, BYTE* dest)
{
    BYTE* window;    // 滑动窗口指针
    int CurWndSize;  // 当前窗口大小
    int i;           // 源数据区的位置计数

    // 初始化工作
    CurByte = 0;
    CurBit = 0;
    window = source;
    CurWndSize = 0;

    // 判断异常
    if (srclen > BlockLen)   return FALSE;

    for (i = 0; i < srclen; i++)
    {
        // 检查标志位
    	BYTE b = GetBit(dest[CurByte], CurBit);
    	MovePos(&CurByte, &CurBit, 1);
        // 属单个字符
    	if (b == 0)
    	{
            // 复制单个字符（8 bits)
      	    CopyBits(source + i, 0, dest + CurByte, CurBit, 8);
	    MovePos(&CurByte, &CurBit, 8);
	    CurWndSize++;
        }
        // 属于匹配格式（flag，len，offset）
	else
	{
            // 以下求匹配串的长度len，len已进行 γ编码，需要解码
	    int q = -1;
            int len, off;
	    DWORD dw = 0;
	    BYTE* pb;
	    while (b != 0)
	    {
	    	q++;
	    	b = GetBit(dest[CurByte], CurBit);
	    	MovePos(&CurByte, &CurBit, 1);
	    }
            if (q > 0)
	    {
	    	pb = (BYTE*)&dw;
	    	CopyBits(pb + (32 - q) / 8, (32 - q) % 8, dest + CurByte, CurBit, q);
	    	MovePos(&CurByte, &CurBit, q);
	    	InvertDWord(&dw);
	    	len = 1;
	    	len <<= q;
	    	len += dw;
	    	len += 1;
	    }
	    else
	    	len = 2;

            // 以下求偏移量off
	    dw = 0;
	    pb = (BYTE*)&dw;
	    int bits = UpperLog2(CurWndSize);
	    CopyBits(pb + (32 - bits) / 8, (32 - bits) % 8, dest + CurByte, CurBit, bits);
	    MovePos(&CurByte, &CurBit, bits);
	    InvertDWord(&dw);
	    off = (int)dw;

	    // 把找到的匹配串输出到缓冲区
	    for (int j = 0; j < len; j++)
	    {
	    	source[i + j] = window[off + j];
	    }
	    CurWndSize += len;
	    i += len - 1;
        }

        // 窗口滑动
	if (CurWndSize > MaxWndSize)
	{
	    window += CurWndSize - MaxWndSize;
	    CurWndSize = MaxWndSize;
        }
    }
    return TRUE;
}


//****************************************************************************//
// 事件函数，当Compress按钮被点击时被触发
// 功能：压缩指定的文件
//****************************************************************************//
void __fastcall TForm1::btnCompressClick(TObject *Sender)
{
    BYTE SourceBuf[BlockLen];     // 源数据内存缓冲区（待压缩数据区）
    BYTE DestBuf[BlockLen + 16];  // 目标数据内存缓冲区（存放压缩后的编码）
    FILE* in;                     // 输入文件指针
    FILE* out;                    // 输出文件指针
    long soulen;                  // 输入文件的总长度
    int destlen;                 // 压缩文件的总长度
    WORD flag1;   // 输入内存缓冲区中数据块的长度，0表示等于BlockLen
    WORD flag2;                   // 输出内存缓冲区中数据块的长度
    int remain;                   // 源文件剩余长度
    int act;                      // 当前读入的实际长度

    // 输入文件的名称
    char* SouFileName = new char[ Edit1->Text.Length() + 1 ];
    // 输出文件的名称
    char* DestFileName = new char[ Edit2->Text.Length() + 1 ];
    strcpy( SouFileName, Edit1->Text.c_str() );
    strcpy( DestFileName, Edit2->Text.c_str() );

    // 以二进制只读方式打开源文件
    in = fopen( SouFileName , "rb" );
    if (in == NULL)
    {
        Label1->Caption = "源文件无法打开! 请检查操作是否正确!";
	return;
    }
    // 以二进制写方式打开目标文件
    out = fopen(DestFileName, "wb");
    if (out == NULL)
    {
        Label1->Caption = "目标文件无法打开! 请检查操作是否正确!";
	fclose(in);
	return;
    }

    // 将指针移到文件结尾
    fseek(in, 0, SEEK_END);
    // 求当前指针位置，即计算文件长度
    soulen = ftell(in);
    // 将指针移到文件开头
    fseek(in, 0, SEEK_SET);

    Label1->Caption = "压缩进行中！ 请稍候！";
    Label2->Visible = false;
    Label3->Visible = false;
    Label4->Visible = false;
    Label5->Visible = false;
    remain = soulen;
    while ( remain > 0 )
    {
        // 求实际读入的长度
	act = min(BlockLen, remain);
        // 一个Block入内存缓冲区
	fread(SourceBuf, act, 1, in);
	remain -= act;
        // flag1记录本次读入的数据块的长度，0表示等于BlockLen
	if (act == BlockLen)
	    flag1 = 0;
	else
	    flag1 = act;
        // 在每个数据块的开头写入本次读入的长度
        fwrite(&flag1, sizeof(WORD), 1, out);

        // 压缩这段文本
	destlen = Compress((BYTE*)SourceBuf, act, (BYTE*)DestBuf);
        // 若不能压缩
	if (destlen == 0)
        {
	    flag2 = flag1;
	    fwrite(&flag2, sizeof(WORD), 1, out);
            // 把源数据直接输出到压缩文件
	    fwrite(SourceBuf, act, 1, out);
        }
	else
	{
	    flag2 = (WORD)destlen;
            // 写入压缩后本数据块的长度
	    fwrite(&flag2, sizeof(WORD), 1, out);
            // 把压缩后的内容写到目标文件
	    fwrite(DestBuf, destlen, 1, out);
        }
    }

    // 显示提示信息
    Label2->Visible = true;
    Label3->Visible = true;
    Label4->Visible = true;
    Label5->Visible = true;
    Label1->Caption = "文件压缩成功！";
    Label2->Caption = "压缩前文件大小(KB)：";
    Label3->Caption = "压缩后文件大小(KB)：";
    Label4->Caption = IntToStr( soulen/1024 );
    Label5->Caption = IntToStr( ftell(out)/1024 );
    // 关闭文件
    fclose(in);
    fclose(out);
}


//****************************************************************************//
// 事件函数，当Extract按钮被点击时被触发
// 功能：解压缩指定的文件
//****************************************************************************//
void __fastcall TForm1::btnExtractClick(TObject *Sender)
{
    BYTE SourceBuf[BlockLen];      // 源数据内存缓冲区
    BYTE DestBuf[BlockLen + 16];   // 压缩数据内存缓冲区
    FILE* in;                      // 输入文件指针
    FILE* out;                     // 输出文件指针
    long soulen;                   // 输入文件的总长度
    WORD flag1;   // 本数据块的未压缩前的长度，0表示等于BlockLen
    WORD flag2;                    // 本数据块压缩后的长度
    int remain;                    // 源文件剩余长度
    int act;                       // 当前读入的实际长度

    // 输入文件的名称
    char* SouFileName = new char[ Edit1->Text.Length() + 1 ];
    // 输出文件的名称
    char* DestFileName = new char[ Edit2->Text.Length() + 1 ];
    strcpy( SouFileName, Edit1->Text.c_str() );
    strcpy( DestFileName, Edit2->Text.c_str() );

    // 以二进制只读方式打开源文件
    in = fopen(SouFileName , "rb");
    if (in == NULL)
    {
        Label1->Caption = "源文件无法打开!请检查操作是否正确!";
    	return;
    }
    // 以二进制写方式打开目标文件
    out = fopen(DestFileName, "wb");
    if (out == NULL)
    {
        Label1->Caption = "目标文件无法打开!请检查操作是否正确!";
	fclose(in);
	return;
    }

    // 将指针移到文件结尾
    fseek(in, 0, SEEK_END);
    // 求当前指针位置，即计算文件长度
    soulen = ftell(in);
    // 将指针移回文件开头
    fseek(in, 0, SEEK_SET);

    remain = soulen;
    Label1->Caption = "解压进行中！ 请稍候！";
    Label2->Visible = false;
    Label3->Visible = false;
    Label4->Visible = false;
    Label5->Visible = false;
    while (remain > 0)
    {
        // 读出本数据块的未压缩前的长度
    	fread(&flag1, sizeof(WORD), 1, in);
        // 本数据块压缩后的长度
    	fread(&flag2, sizeof(WORD), 1, in);
    	remain -= 2 * sizeof(WORD);

        // 求出本数据块压缩前实际长度
    	if (flag1 == 0)
     	    act = BlockLen;
	else
	    act = flag1;
	remain-= flag2 ? (flag2) : act;

        // 若无压缩，直接读入
	if (flag2 == flag1)
	{
	    fread(SourceBuf, act, 1, in);
        }
	else
	{
	    fread(DestBuf, flag2, 1, in);
            // 解压缩这断文本
	    if (!Extract((BYTE*)SourceBuf, act, (BYTE*)DestBuf))
            {
                Label1->Caption = "解压不成功！";
	        fclose(in);
	        fclose(out);
	        return;
	    }
        }
        // 将缓冲区中已解压的数据输出到文件
        fwrite((BYTE*)SourceBuf, act, 1, out);
    }

    // 显示提示信息
    Label2->Visible = true;
    Label3->Visible = true;
    Label4->Visible = true;
    Label5->Visible = true;
    Label1->Caption = "文件解压成功！";
    Label2->Caption = "解压前文件大小(KB)：";
    Label3->Caption = "解压后文件大小(KB)：";
    Label4->Caption = IntToStr( soulen/1024 );
    Label5->Caption = IntToStr( ftell(out)/1024 );
    // 关闭文件
    fclose(in);
    fclose(out);
}


//---------------------------------------------------------------------------

// 下面是为了实现输出压缩编码的一组二进制位操作函数


//****************************************************************************//
// 功能：以指定的形式输出压缩编码到输出缓冲区
// 参数说明：
//        dest - 输出缓冲区指针
//	  code - 要输出的数
//	  bits - 要输出的位数
//	  isGamma - 是否输出为γ编码
//****************************************************************************//
void CodeOutput(BYTE* dest, DWORD code, int bits, BOOL isGamma)
{
    // 若 isGamma ＝ true，则对 code 进行 γ编码，再输出
    if ( isGamma )
    {
    	BYTE* pb;    // 字节数据区
    	DWORD out;   // 双字数据区

    	// 计算输出位数
    	int GammaCode = (int)code - 1;
    	int q = LowerLog2(GammaCode);

        // 输出q个1
    	if (q > 0)
    	{
            out = 0xffff;
	    pb = (BYTE*)&out;
	    CopyBits(dest + CurByte, CurBit, pb, 0, q);
	    MovePos(&CurByte, &CurBit, q);
        }

	// 输出一个0
	out = 0;
	pb = (BYTE*)&out;
	CopyBits(dest + CurByte, CurBit, pb + 3, 7, 1);
	MovePos(&CurByte, &CurBit, 1);

        // 输出余数, q位
	if (q > 0)
	{
            // 计算out = Code - 2^q
	    int sh = 1;
	    sh <<= q;
	    out = GammaCode - sh;
	    pb = (BYTE*)&out;
	    InvertDWord(&out);
	    CopyBits(dest + CurByte, CurBit,
	    		pb + (32 - q) / 8, (32 - q) % 8, q);
	    MovePos(&CurByte, &CurBit, q);
        }
    }
    // 若 isGamma ＝ false,不需进行 γ编码
    else
    {
    	DWORD dw = (DWORD)code;
    	BYTE* pb = (BYTE*)&dw;
    	InvertDWord(&dw);
    	CopyBits(dest + CurByte, CurBit,
    		pb + (32 - bits) / 8, (32 - bits) % 8, bits);
	MovePos(&CurByte, &CurBit, bits);
    }
}


//****************************************************************************//
// 功能：求不小于log2(n)的最小整数
//****************************************************************************//
int UpperLog2(int n)
{
    int i = 0;
    if (n > 0)
    {
    	int m = 1;
    	while(1)
    	{
    	    if (m >= n)
	    return i;
	    m <<= 1;
	    i++;
        }
    }
    else
    return -1;
}


//****************************************************************************//
// 功能：求大于log2(n)的最大整数
//****************************************************************************//
int LowerLog2(int n)
{
    int i = 0;
    if (n > 0)
    {
    	int m = 1;
    	while(1)
    	{
            if (m == n)
	    return i;
	    if (m > n)
	    return i - 1;
	    m <<= 1;
	    i++;
        }
    }
    else
    return -1;
}


//****************************************************************************//
// 功能：二进制位后移num位
// 参数说明：
//       piByte - 字节偏移
//       piBit - 字节内位偏移
//       num - 后移位数
//****************************************************************************//
void MovePos(int* piByte, int* piBit, int num)
{
	num += (*piBit);
	(*piByte) += num / 8;
	(*piBit) = num % 8;
}


//****************************************************************************//
// 功能：求字节byte的第pos位的值，从高位（左边）开始数起
// 返回值：0或1，类型为字节
//****************************************************************************//
BYTE GetBit(BYTE byte, int pos)
{
    int j = 1;
    j <<= 7 - pos;
    if (byte & j)
    	return 1;
    else
    	return 0;
}


//****************************************************************************//
// 功能：调换双字的存放顺序，使其从高位字节到低位字节排列
// 参数说明：pDW —指向待处理的DWORD
//****************************************************************************//
void InvertDWord(DWORD* pDW)
{
	union UDWORD{
                    DWORD dw;
                    BYTE b[4];
                    };
	UDWORD* pUDW = (UDWORD*)pDW;
	BYTE b;
	b = pUDW->b[0];
        pUDW->b[0] = pUDW->b[3];
        pUDW->b[3] = b;
	b = pUDW->b[1];
        pUDW->b[1] = pUDW->b[2];
        pUDW->b[2] = b;
}


//****************************************************************************//
// 功能：在一个字节范围内复制位流
// 前置条件：要复制的位都在一个字节范围内
// 参数说明：
//        memDest - 目标数据区
//	  nDestPos - 目标数据区第一个字节中的起始位
//	  memSrc - 源数据区
//	  nSrcPos - 源数据区第一个字节的中起始位
//	  nBits - 要复制的位数
//****************************************************************************//
void CopyBitsInAByte(BYTE* memDest, int nDestPos, BYTE* memSrc,
                     int nSrcPos, int nBits)
{
    BYTE b1, b2;
    b1 = *memSrc;
    // 将不用复制的位清0
    b1 <<= nSrcPos; b1 >>= 8 - nBits;
    // 将源和目的字节对齐
    b1 <<= 8 - nBits - nDestPos;
    // 复制值为1的位
    *memDest |= b1;
    // 将不用复制的位置1
    b2 = 0xff; b2 <<= 8 - nDestPos;
    b1 |= b2;
    b2 = 0xff; b2 >>= nDestPos + nBits;
    b1 |= b2;
    // 复制值为0的位
    *memDest &= b1;
}


//****************************************************************************//
// 功能：复制内存中的位流
// 前置条件：要复制的两块数据区不能有重合
// 参数说明：
//        memDest - 目标数据区
//	  nDestPos - 目标数据区第一个字节中的起始位
//	  memSrc - 源数据区
//	  nSrcPos - 源数据区第一个字节的中起始位
//	  nBits - 要复制的位数
//        说明 - 起始位从字节的高位至低位（由左至右）算起
//****************************************************************************//
void CopyBits(BYTE* memDest, int nDestPos, BYTE* memSrc,
              int nSrcPos, int nBits)
{
    int iByteDest = 0, iBitDest;
    int iByteSrc = 0, iBitSrc = nSrcPos;
    int nBitsToFill, nBitsCanFill;
    while (nBits > 0)
    {
    	// 计算要在目标区当前字节填充的位数
    	nBitsToFill = min(nBits, iByteDest ? 8 : 8 - nDestPos);
    	// 目标区当前字节要填充的起始位
    	iBitDest = iByteDest ? 0 : nDestPos;
    	// 计算可以一次从源数据区中复制的位数
    	nBitsCanFill = min(nBitsToFill, 8 - iBitSrc);
    	// 字节内复制
    	CopyBitsInAByte(memDest + iByteDest, iBitDest,
    		memSrc + iByteSrc, iBitSrc, nBitsCanFill);
    	// 如果还没有复制完 nBitsToFill 个
    	if (nBitsToFill > nBitsCanFill)
    	{
    	    iByteSrc++;
            iBitSrc = 0;
            iBitDest += nBitsCanFill;
	    CopyBitsInAByte(memDest + iByteDest, iBitDest, memSrc + iByteSrc,
                       iBitSrc, nBitsToFill - nBitsCanFill);
	    iBitSrc += nBitsToFill - nBitsCanFill;
        }
	else
	{
	    iBitSrc += nBitsCanFill;
	    if (iBitSrc >= 8)
	    {
	    	iByteSrc++;
                iBitSrc = 0;
	    }
        }
        // 已经填充了nBitsToFill位
        nBits -= nBitsToFill;
	iByteDest++;
    }
}


//---------------------------------------------------------------------------

//****************************************************************************//
// 事件函数，由Form Load事件触发。
// 功能：进行一些界面的初始化工作.
//****************************************************************************//
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
    Label1->Caption = "准备就绪！请选择要压缩或解压的文件。";
    Label2->Visible = false;
    Label3->Visible = false;
    Label4->Visible = false;
    Label5->Visible = false;
}

//---------------------------------------------------------------------------


