#include <stdlib.h>
#include <string.h>
#include "LLongInt.h"
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
int LLongInt::Trim( )
{
	int oldLen = lliLength;
	while ( pLLI[lliLength-1] == 0 && lliLength > 1)
		lliLength--;
	return (lliLength == oldLen );
}

//---------------------------------------------------------------------------------------------------

LLongInt::LLongInt()
{
	sign = 0;
	lliLength = 1;
	pLLI = new unsigned int[1];
	*pLLI = 0;
}

LLongInt::LLongInt(__int64 i64)
{
	pLLI = new unsigned int[2];
	lliLength = 2;
	if ( i64 < 0 )
	{
		sign = 1;
		i64 = -i64;
	}
	else
		sign = 0;
	memcpy(pLLI, &i64, 8);
	Trim( );
}

//---------------------------------------------------------------------------------------------------

LLongInt::LLongInt(char *strDec)
{
	if ( strDec[0] == '-' ) 
		sign = 1;
	else
		sign = 0;
	int strLen = strlen(strDec);
	if ( strLen % 4 == 0 )
		lliLength = strLen / 4;
	else
		lliLength = strLen / 4 + 1;
	pLLI = new unsigned int[lliLength];
	unsigned int *pTmp = new unsigned int[lliLength];
	memset(pLLI, 0, lliLength*4);
	memset(pTmp, 0, lliLength*4);
	unsigned int *pLLI = this->pLLI;
	int a, intCount;
	__asm
	{
		pusha
		mov ebx, this
		mov eax, [ebx][sign]
		mov dword ptr a, eax
WhileA1:
		mov edx, a
		mov intCount, edx
		shr dword ptr intCount, 2
		inc intCount
		cmp edx, strLen
		jb LLIDec2Hex
		jmp LLIDec2HexOver
LLIDec2Hex:

		mov esi, 0
		mov ecx, intCount
CopyToTmp:
		mov eax, pLLI
		mov ebx, [eax][esi*4]
		mov eax, pTmp
		mov [eax][esi*4], ebx
		inc esi
		loop CopyToTmp

		mov eax, pLLI
		mov esi, intCount
		dec esi
EightTimes:
		cmp esi, 0
		jnz EightTimesLoop
		jmp EightTimesOver
EightTimesLoop:
		mov ebx, [eax][esi*4-4]
		shld [eax][esi*4], ebx, 3
		dec esi
		jmp EightTimes
EightTimesOver:
		shl dword ptr [eax][esi], 3

		mov eax, pTmp
		mov esi, intCount
		dec esi
TwoTimesTmp:
		cmp esi, 0
		jnz TwoTimesLoop
		jmp TwoTimesOver
TwoTimesLoop:
		mov ebx, [eax][esi*4-4]
		shld [eax][esi*4], ebx, 1
		dec esi
		jmp TwoTimesTmp
TwoTimesOver:
		shl dword ptr [eax][esi], 1

		mov ecx, intCount
		xor esi, esi
		clc
TenTimes:
		mov eax, pTmp
		mov ebx, [eax][esi*4]
		mov eax, pLLI
		adc [eax][esi*4], ebx
		inc esi
		loop TenTimes
		
		mov ecx, intCount
		mov esi, a
		xor eax, eax
		mov ebx, strDec
		mov al, byte ptr [ebx][esi];
		sub al, '0'
		xor esi, esi
		mov ebx, pLLI
		add [ebx][esi*4], eax
		inc esi
		dec ecx
		jnz AddDecBit
		jmp AddDecBitOver
AddDecBit:
		mov eax, pLLI
		adc dword ptr [eax][esi*4], 0
		inc esi
		loop AddDecBit
AddDecBitOver:
		inc a
		jmp WhileA1
LLIDec2HexOver:
		popa
	}
	Trim( );
	delete pTmp;
}

//---------------------------------------------------------------------------------------------------

LLongInt LLongInt::operator -( )
{
	__asm     //	sign = sign ^ 1;
	{
		mov eax, this
		xor dword ptr [eax][sign], 1
	}
	return *this;
}

LLongInt LLongInt::Abs(LLongInt &lli)
{
	return LLongInt(lli.pLLI, lli.lliLength, 0);
}

//---------------------------------------------------------------------------------------------------

LLongInt::LLongInt(unsigned int *strHex, int intCount, int sign)
{
	this->sign = sign;
	lliLength = intCount;
	pLLI = new unsigned int[intCount];
	memcpy(pLLI, strHex, intCount*4);
	Trim( );
}

//---------------------------------------------------------------------------------------------------

LLongInt::LLongInt(LLongInt &another)
{
	if ( &another == this )
		return;
	lliLength = another.lliLength;
	sign = another.sign;
	pLLI = new unsigned int[lliLength];
	memcpy(pLLI, another.pLLI, lliLength*4);
	Trim( );
}

//---------------------------------------------------------------------------------------------------

LLongInt::~LLongInt( )
{
	if ( pLLI != NULL )
		delete pLLI;
}

//---------------------------------------------------------------------------------------------------

LLongInt LLongInt::operator +(LLongInt &another)
{
	if ( sign != another.sign)
	{
		if ( sign == 0)
			return (*this-(-another));
		else
			return (another - (-*this));
	}
	int a, b, len;
	unsigned int *pSrcLLI;
	unsigned int *pResult;
	unsigned int *pAddLLI;
	if ( lliLength <= another.lliLength )
	{
		pResult = new unsigned int[another.lliLength+1];
		a = lliLength;
		b = another.lliLength + 1 - a;
		pSrcLLI = pLLI;
		pAddLLI = another.pLLI;
		len = another.lliLength;
	}
	else
	{
		pResult = new unsigned int[lliLength+1];
		a = another.lliLength;
		b = lliLength + 1 - a;
		pSrcLLI = another.pLLI;
		pAddLLI = pLLI;
		len = lliLength;
	}

	__asm
	{
		mov eax, pResult
		mov ebx, pSrcLLI
		xor esi, esi
		mov ecx, a
CopyToResult1:
		mov edx, [ebx][esi*4]
		mov [eax][esi*4], edx
		inc esi
		loop CopyToResult1

		mov ecx, b
ZeroResult1:
		mov dword ptr [eax][esi*4], 0
		inc esi
		loop ZeroResult1

		xor esi, esi
		mov ebx, pAddLLI
		mov ecx, len
		clc
AddLoop:
		mov edx, [ebx][esi*4]
		adc [eax][esi*4], edx
		inc esi
		loop AddLoop
		adc [eax][esi*4], 0
	}
	LLongInt rcLLI(pResult, len+1, sign);
	delete pResult;
	return rcLLI;
}

LLongInt LLongInt::operator -(LLongInt &another)
{
	if ( sign != another.sign )
		return (*this + (-another));
	if ( sign == 0 )
	{
		if ( *this < another )
			return -(another-*this);
	}
	else
	{
		if ( *this > another )
			return -(another-*this);
	}

	int a, b ;
	unsigned int *pSrcLLI;
	unsigned int *pResult;
	unsigned int *pSubLLI;

	pResult = new unsigned int[lliLength];
	a = another.lliLength;
	b = lliLength-another.lliLength;
	pSrcLLI = pLLI;
	pSubLLI = another.pLLI;

	__asm
	{
		mov eax, this
		mov ecx, [eax][lliLength]
		mov eax, pResult
		mov ebx, pSrcLLI
		xor esi, esi
CopyToResult1:
		mov edx, [ebx][esi*4]
		mov [eax][esi*4], edx
		inc esi
		loop CopyToResult1

		xor esi, esi
		mov ebx, pSubLLI
		mov ecx, a
		clc
SubLoop1:
		mov edx, [ebx][esi*4]
		sbb [eax][esi*4], edx
		inc esi
		loop SubLoop1

		mov ecx, b
		cmp ecx, 0
		jz SubOver
SubLoop2:
		sbb dword ptr [eax][esi*4], 0
		inc esi
		loop SubLoop2
SubOver:
	}
	LLongInt rcLLI(pResult, lliLength, sign);
	delete pResult;
	return rcLLI;
}

//---------------------------------------------------------------------------------------------------

LLongInt LLongInt::operator *(LLongInt &another)
{
	int rSign, tmpLen;
	unsigned int *rpLLI;
	unsigned int *pM1 = pLLI;
	unsigned int *pM2 = another.pLLI;
	int m1Len = lliLength;
	int m2Len = another.lliLength;
	__asm
	{
		;//求出rSign
		mov eax, this
		mov ecx, [eax][sign]
		mov ebx, another
		xor ecx, [ebx][sign]
		mov rSign, ecx
		;//
		mov ecx, [eax][lliLength]
		add ecx, [ebx][lliLength]
		mov tmpLen, ecx
	}
	rpLLI = new unsigned int[tmpLen];
	__asm
	{
		;//填充0
		mov eax, 0h
		mov edi, [rpLLI]
		mov ecx, tmpLen
		cld
		rep stosd

		mov esi, 0
while1:
		mov edi, 0
		cmp esi, m2Len
		jb while1Inner
		jmp while1Over
while1Inner:
while2:
		cmp edi, m1Len
		jb while2Inner
		jmp while2Over
while2Inner:
		mov eax, pM2
		mov ebx, [eax][esi*4]
		mov ecx, pM1
		mov eax, [ecx][edi*4]
		mul ebx
		mov ecx, esi
		add ecx, edi
		mov ebx, rpLLI
		add [ebx][ecx*4], eax
		inc ecx
		adc [ebx][ecx*4], edx
addForward:
		jnc addForwardOver
		inc ecx
		adc dword ptr [ebx][ecx*4], 0h
		jmp addForward
addForwardOver:
		inc edi
		jmp while2
while2Over:
		inc esi
		jmp while1
while1Over:
	}
	LLongInt rc(rpLLI, tmpLen, rSign);
	delete rpLLI;
	return rc;
}

//---------------------------------------------------------------------------------------------------
LLongInt LLongInt::operator /(LLongInt &another)
{
	unsigned int *pQuotient;
	int quotientLen;
	if (Abs(*this) >= Abs(another))
	{
	   quotientLen = this->lliLength - another.lliLength + 1;
       pQuotient = new unsigned int[quotientLen];
	}
	else
		return LLongInt((__int64)0);
	unsigned int *pQuotient2 = pQuotient + quotientLen - 1;
	unsigned int *pDivisorLLI = another.pLLI;
	unsigned int *pDivisorLLI2 = another.pLLI + another.lliLength - 1;
	unsigned int *pDividendLLI = new unsigned int[this->lliLength+2];
	unsigned int *pDividendLLI1 = pDividendLLI;
	unsigned int *pDividendLLI2;
	int divisorLZs /*, dividendLZs*/ ,rSign;
	int totalShiftBits, shiftedBits = 0;
	__asm
	{
		//求出rSign
		mov eax, another
		mov ebx, this
		mov ecx, [eax][sign]
		xor ecx, [ebx][sign]
		mov rSign, ecx
		//拷贝被除数
		mov edi, pDividendLLI
		mov ecx, [ebx][lliLength]
		mov dword ptr [edi][ecx*4], 0				;//最高两个双字置0
		mov dword ptr [edi][ecx*4+4], 0
		mov esi, [ebx][pLLI]
CopyDividend:
		mov edx, [esi][ecx*4-4]
		mov [edi][ecx*4-4], edx
		loop CopyDividend
		//
		mov ecx, [eax][lliLength]
		mov esi, [ebx][lliLength]
		dec esi
		shl esi, 2
		add esi, [ebx][pLLI]
		mov edi, pDivisorLLI2
		//jmp Fill64Zeros                 
Fill64Zeros:
		add pDividendLLI1, 4
Fill32Zeros:
		mov ecx, [ebx][lliLength]
		sub ecx, [eax][lliLength]
		shl ecx, 2
		add pDividendLLI1, ecx
		//
		mov ecx, pDividendLLI1
		mov edx, [eax][lliLength]
		dec edx
		shl edx, 2
		add ecx, edx
		mov pDividendLLI2, ecx
		mov ecx, pDividendLLI1
		sub ecx, pDividendLLI
		shl ecx, 3
		mov totalShiftBits, ecx  //得出要移位的总位数

		//求出除数的第一个双字的最高位的二进制0的个数
		mov ecx, 32
		mov edx, 0
		mov esi, 0x80000000
		mov edi, pDivisorLLI2
		mov edi, [edi]   ;//another.pLLI[another.lliLength-1];
CalcDivisorLZLoop:
		test esi, edi
		jnz CalcDivisorLZOver
		inc edx
		shr esi, 1
		loop CalcDivisorLZLoop
CalcDivisorLZOver:
		mov divisorLZs, edx

;/*
;//求出被除数的第一个双字的最高位的二进制0的个数
;		mov ecx, 32
;		mov edx, 0
;		mov esi, 0x80000000
;		mov edi, [ebx][lliLength]
;		mov edi, [ebx][pLLI-4][edi*4]   ;//this->pLLI[this->lliLength-1];
;CalcDividendLZLoop0:
;		test esi, edi
;		jnz CalcDividendLZOver
;		inc edx
;		shr esi, 1
;		loop CalcDividendLZLoop
;CalcDividendLZOver0:
;		mov dividendLZs, edx
;*/

		//置商为0
		mov edi, pQuotient
		push eax
		xor eax, eax  ;//mov eax, 0
		mov ecx, quotientLen
		cld
		rep stosd
		pop eax

LLongIntDivideLoop:
		//求出被除数的第一个双字的最高位的二进制0的个数
		mov ecx, 32
		mov edx, 0
		mov esi, 0x80000000
		mov edi, pDividendLLI2
		mov edi, [edi]
CalcDividendLZLoop:
		test esi, edi
		jnz CalcDividendLZOver
		inc edx
		shr esi, 1
		loop CalcDividendLZLoop
CalcDividendLZOver:
;//		mov dividendLZs, edx

;//被除数左移max(1, dividendLZs-divisorLZs)位
		mov ecx, 1
		;//mov edx, dividendLZs
		sub edx, divisorLZs
		cmp edx, 1
		jle DividendShiftLeft
		cmp edx, 32
		jb LessThan32Bits
		mov edx, 31
LessThan32Bits:
		mov ecx, edx
DividendShiftLeft:
		add shiftedBits, ecx
		mov edx, shiftedBits
		cmp edx, totalShiftBits
		jbe ShiftBitsOK
		sub shiftedBits, ecx
		mov edx, totalShiftBits
		sub edx, shiftedBits
		mov ecx, edx
		mov edx, totalShiftBits
		mov shiftedBits, edx
ShiftBitsOK:
		mov esi, pDividendLLI2
;//		cmp esi, pDividendLLI
;//		jb DividendShiftLeftOver
DividendShiftLeftLoop:
		mov edx, [esi]
		shld [esi+4], edx, cl
		sub esi, 4
		cmp esi, pDividendLLI
		jae DividendShiftLeftLoop
;//DividendShiftLeftOver:
		add esi, 4
		shl dword ptr [esi], cl

;//商左移max(1, dividendLZs-divisorLZs)位
;//QuotientShiftLeft:
		mov esi, pQuotient2
		cmp esi, pQuotient
		jbe QuotientShiftLeftOver
QuotientShiftLeftLoop:
		mov edx, [esi-4]
		shld [esi], edx, cl
		sub esi, 4
		cmp esi, pQuotient
		ja QuotientShiftLeftLoop
QuotientShiftLeftOver:
		shl dword ptr [esi], cl
;//比较被除数和除数的...位
		mov esi, pDividendLLI2
;//		add esi, 4
		cmp dword ptr [esi+4], 0
		ja SetQuotientTo1
;//		sub esi, 4
		mov ecx, [eax][lliLength]
		mov edi, pDivisorLLI2
CmpDividendDivisor2:
		mov edx, [esi]
		cmp edx, [edi]
		jb SetQuotientTo0
		ja SetQuotientTo1
		sub esi, 4
		sub edi, 4
		loop CmpDividendDivisor2
SetQuotientTo1:
		mov esi, pQuotient
		or dword ptr [esi], 1

;//substraction
		mov esi, pDividendLLI1
		mov edi, pDivisorLLI
		mov ecx, [eax][lliLength]
		push eax
		xor eax, eax
		clc
SubDivisorFromDividend:
		mov edx, [edi][eax*4]
		sbb [esi][eax*4], edx
		inc eax
		loop SubDivisorFromDividend
		sbb [esi][eax*4], 0
		pop eax
;//		jmp SetQuotientOver
SetQuotientTo0:
;//SetQuotientOver:
		mov ecx, shiftedBits
		cmp ecx, totalShiftBits
		jb LLongIntDivideLoop
	}
	LLongInt rc(pQuotient, quotientLen, rSign);
	delete pQuotient;
	delete pDividendLLI;
	return rc;
}

//---------------------------------------------------------------------------------------------------

LLongInt LLongInt::operator %(LLongInt &another)
{
	unsigned int *pQuotient;
	int quotientLen;
	if (Abs(*this) >= Abs(another))
	{
	   quotientLen = this->lliLength - another.lliLength + 1;
       pQuotient = new unsigned int[quotientLen];
	}
	else
		return *this;
	unsigned int *pQuotient2 = pQuotient + quotientLen - 1;
	unsigned int *pDivisorLLI = another.pLLI;
	unsigned int *pDivisorLLI2 = another.pLLI + another.lliLength - 1;
	unsigned int *pDividendLLI = new unsigned int[this->lliLength+2];
	unsigned int *pDividendLLI1 = pDividendLLI;
	unsigned int *pDividendLLI2;
	int divisorLZs /*, dividendLZs*/ ;
	int totalShiftBits, shiftedBits = 0;
	__asm
	{
		mov eax, another
		mov ebx, this
		//拷贝被除数
		mov edi, pDividendLLI
		mov ecx, [ebx][lliLength]
		mov dword ptr [edi][ecx*4], 0				;//最高两个双字置0
		mov dword ptr [edi][ecx*4+4], 0
		mov esi, [ebx][pLLI]
CopyDividend:
		mov edx, [esi][ecx*4-4]
		mov [edi][ecx*4-4], edx
		loop CopyDividend
		//
		mov ecx, [eax][lliLength]
		mov esi, [ebx][lliLength]
		dec esi
		shl esi, 2
		add esi, [ebx][pLLI]
		mov edi, pDivisorLLI2
CmpDividendDivisor1:
		mov edx, [esi]    ;//this->pLLI[esi]
		cmp edx, [edi]
		jb Fill32Zeros
		ja Fill64Zeros
		sub esi, 4
		sub edi, 4
		loop CmpDividendDivisor1
		;//jmp Fill64Zeros                 ;//==
Fill64Zeros:
		add pDividendLLI1, 4
Fill32Zeros:
		mov ecx, [ebx][lliLength]
		sub ecx, [eax][lliLength]
		shl ecx, 2
		add pDividendLLI1, ecx
		//
		mov ecx, pDividendLLI1
		mov edx, [eax][lliLength]
		dec edx
		shl edx, 2
		add ecx, edx
		mov pDividendLLI2, ecx
		mov ecx, pDividendLLI1
		sub ecx, pDividendLLI
		shl ecx, 3
		mov totalShiftBits, ecx  //得出要移位的总位数

		//求出除数的第一个双字的最高位的二进制0的个数
		mov ecx, 32
		mov edx, 0
		mov esi, 0x80000000
		mov edi, pDivisorLLI2
		mov edi, [edi]   ;//another.pLLI[another.lliLength-1];
CalcDivisorLZLoop:
		test esi, edi
		jnz CalcDivisorLZOver
		inc edx
		shr esi, 1
		loop CalcDivisorLZLoop
CalcDivisorLZOver:
		mov divisorLZs, edx

		//置商为0
		mov edi, pQuotient
		push eax
		xor eax, eax  ;//mov eax, 0
		mov ecx, quotientLen
		cld
		rep stosd
		pop eax

LLongIntDivideLoop:
		//求出被除数的第一个双字的最高位的二进制0的个数
		mov ecx, 32
		mov edx, 0
		mov esi, 0x80000000
		mov edi, pDividendLLI2
		mov edi, [edi]
CalcDividendLZLoop:
		test esi, edi
		jnz CalcDividendLZOver
		inc edx
		shr esi, 1
		loop CalcDividendLZLoop
CalcDividendLZOver:
;//		mov dividendLZs, edx

;//被除数左移max(1, dividendLZs-divisorLZs)位
		mov ecx, 1
		;//mov edx, dividendLZs
		sub edx, divisorLZs
		cmp edx, 1
		jle DividendShiftLeft
		cmp edx, 32
		jb LessThan32Bits
		mov edx, 31
LessThan32Bits:
		mov ecx, edx
DividendShiftLeft:
		add shiftedBits, ecx
		mov edx, shiftedBits
		cmp edx, totalShiftBits
		jbe ShiftBitsOK
		sub shiftedBits, ecx
		mov edx, totalShiftBits
		sub edx, shiftedBits
		mov ecx, edx
		mov edx, totalShiftBits
		mov shiftedBits, edx
ShiftBitsOK:
		mov esi, pDividendLLI2
;//		cmp esi, pDividendLLI
;//		jb DividendShiftLeftOver
DividendShiftLeftLoop:
		mov edx, [esi]
		shld [esi+4], edx, cl
		sub esi, 4
		cmp esi, pDividendLLI
		jae DividendShiftLeftLoop
;//DividendShiftLeftOver:
		add esi, 4
		shl dword ptr [esi], cl

;//商左移max(1, dividendLZs-divisorLZs)位
;//QuotientShiftLeft:
		mov esi, pQuotient2
		cmp esi, pQuotient
		jbe QuotientShiftLeftOver
QuotientShiftLeftLoop:
		mov edx, [esi-4]
		shld [esi], edx, cl
		sub esi, 4
		cmp esi, pQuotient
		ja QuotientShiftLeftLoop
QuotientShiftLeftOver:
		shl dword ptr [esi], cl
;//比较被除数和除数的...位
		mov esi, pDividendLLI2
;//		add esi, 4
		cmp dword ptr [esi+4], 0
		ja SetQuotientTo1
;//		sub esi, 4
		mov ecx, [eax][lliLength]
		mov edi, pDivisorLLI2
CmpDividendDivisor2:
		mov edx, [esi]
		cmp edx, [edi]
		jb SetQuotientTo0
		ja SetQuotientTo1
		sub esi, 4
		sub edi, 4
		loop CmpDividendDivisor2
SetQuotientTo1:
		mov esi, pQuotient
		or dword ptr [esi], 1

;//substraction
		mov esi, pDividendLLI1
		mov edi, pDivisorLLI
		mov ecx, [eax][lliLength]
		push eax
		xor eax, eax
		clc
SubDivisorFromDividend:
		mov edx, [edi][eax*4]
		sbb [esi][eax*4], edx
		inc eax
		loop SubDivisorFromDividend
		sbb [esi][eax*4], 0
		pop eax
;//		jmp SetQuotientOver
SetQuotientTo0:
;//SetQuotientOver:
		mov ecx, shiftedBits
		cmp ecx, totalShiftBits
		jb LLongIntDivideLoop
	}
	LLongInt rc(pDividendLLI1, another.lliLength, this->sign);
	delete pQuotient;
	delete pDividendLLI;
	return rc;
}

//---------------------------------------------------------------------------------------------------

void LLongInt::operator =(LLongInt &another)
{
	if ( &another == this )
		return;
	if ( pLLI != NULL )
		delete pLLI;
	sign = another.sign;
	lliLength = another.lliLength;
	pLLI = new unsigned int[lliLength];
	memcpy(pLLI, another.pLLI, lliLength*4);
	Trim( );
	return;
}

//---------------------------------------------------------------------------------------------------

int LLongInt::operator ==(LLongInt &another)
{
	if ( lliLength==1 && another.lliLength==1 && pLLI[0]==0 && another.pLLI[0]==0)
		return 1;
	if ( sign != another.sign || lliLength != another.lliLength )
		return 0;
	int rc = memcmp(pLLI, another.pLLI, lliLength*4);
	return ( rc == 0 );
}

//---------------------------------------------------------------------------------------------------

int LLongInt::operator >(LLongInt &another)
{
	//符号不等
	if ( lliLength==1 && another.lliLength==1 && pLLI[0]==0 && another.pLLI[0]==0)
		return 0;
	if ( sign == 1 && another.sign == 0 )
		return 0;
	if ( sign == 0 && another.sign == 1)
		return 1;
	//符号相等
	if ( sign == 0 && another.sign == 0 ) //都为正数
	{
		//长度不等
		if ( lliLength > another.lliLength )
			return 1;
		if ( lliLength < another.lliLength )
			return 0;
		//长度相等
		int a;
		for ( a=lliLength-1; a>=0; a-- )
		{
			if ( pLLI[a] == another.pLLI[a] )
				continue;
			return (pLLI[a] > another.pLLI[a]);
		}
	}
	else //都为负数
	{
		//长度不等
		if ( lliLength > another.lliLength )
			return 0;
		if ( lliLength < another.lliLength )
			return 1;
		//长度相等
		int a;
		for ( a=lliLength-1; a>=0; a-- )
		{
			if ( pLLI[a] == another.pLLI[a] )
				continue;
			return (pLLI[a] < another.pLLI[a]);
		}
	}
	//相等
	return 0;
}

//---------------------------------------------------------------------------------------------------

int LLongInt::operator <(LLongInt &another)
{
	//符号不等
	if ( lliLength==1 && another.lliLength==1 && pLLI[0]==0 && another.pLLI[0]==0)
		return 0;
	if ( sign == 1 && another.sign == 0 )
		return 1;
	if ( sign == 0 && another.sign == 1)
		return 0;
	//符号相等
	if ( sign == 0 && another.sign == 0 ) //都为正数
	{
		//长度不等
		if ( lliLength > another.lliLength )
			return 0;
		if ( lliLength < another.lliLength )
			return 1;
		//长度相等
		int a;
		for ( a=lliLength-1; a>=0; a-- )
		{
			if ( pLLI[a] == another.pLLI[a] )
				continue;
			return (pLLI[a] < another.pLLI[a]);
		}
	}
	else //都为负数
	{
		//长度不等
		if ( lliLength > another.lliLength )
			return 1;
		if ( lliLength < another.lliLength )
			return 0;
		//长度相等
		int a;
		for ( a=lliLength-1; a>=0; a-- )
		{
			if ( pLLI[a] == another.pLLI[a] )
				continue;
			return (pLLI[a] > another.pLLI[a]);
		}
	}
	//相等
	return 0;

}

//---------------------------------------------------------------------------------------------------

int LLongInt::operator >=(LLongInt &another)
{
	return !(*this<another);
}

//---------------------------------------------------------------------------------------------------

int LLongInt::operator <=(LLongInt &another)
{
	return !(*this>another);
}

//---------------------------------------------------------------------------------------------------

int LLongInt::operator !=(LLongInt &another)
{
	return !(*this==another);
}


LLongInt LLongInt::Divide(LLongInt &divisor, LLongInt &dividend, LLongInt &remainder)
{
	unsigned int *pQuotient;
	int quotientLen;
	if (Abs(dividend) >= Abs(divisor))
	{
	   quotientLen = dividend.lliLength - divisor.lliLength + 1;
       pQuotient = new unsigned int[quotientLen];
	}
	else
	{
		remainder = dividend;
		return LLongInt((__int64)0);
	}
	unsigned int *pQuotient2 = pQuotient + quotientLen - 1;
	unsigned int *pDivisorLLI = divisor.pLLI;
	unsigned int *pDivisorLLI2 = divisor.pLLI + divisor.lliLength - 1;
	unsigned int *pDividendLLI = new unsigned int[dividend.lliLength+2];
	unsigned int *pDividendLLI1 = pDividendLLI;
	unsigned int *pDividendLLI2;
	int divisorLZs/*, dividendLZs*/ , rSign;
	int totalShiftBits, shiftedBits = 0;
	__asm
	{
		//求出rSign
		mov eax, divisor
		mov ebx, dividend
		mov ecx, [eax][sign]
		xor ecx, [ebx][sign]
		mov rSign, ecx
		//拷贝被除数
		mov edi, pDividendLLI
		mov ecx, [ebx][lliLength]
		mov dword ptr [edi][ecx*4], 0				;//最高两个双字置0
		mov dword ptr [edi][ecx*4+4], 0
		mov esi, [ebx][pLLI]
CopyDividend:
		mov edx, [esi][ecx*4-4]
		mov [edi][ecx*4-4], edx
		loop CopyDividend
		//
		mov ecx, [eax][lliLength]
		mov esi, [ebx][lliLength]
		dec esi
		shl esi, 2
		add esi, [ebx][pLLI]
		mov edi, pDivisorLLI2
CmpDividendDivisor1:
		mov edx, [esi]    ;//this->pLLI[esi]
		cmp edx, [edi]
		jb Fill32Zeros
		ja Fill64Zeros
		sub esi, 4
		sub edi, 4
		loop CmpDividendDivisor1
		;//jmp Fill64Zeros                 ;//==
Fill64Zeros:
		add pDividendLLI1, 4
Fill32Zeros:
		mov ecx, [ebx][lliLength]
		sub ecx, [eax][lliLength]
		shl ecx, 2
		add pDividendLLI1, ecx
		//
		mov ecx, pDividendLLI1
		mov edx, [eax][lliLength]
		dec edx
		shl edx, 2
		add ecx, edx
		mov pDividendLLI2, ecx
		mov ecx, pDividendLLI1
		sub ecx, pDividendLLI
		shl ecx, 3
		mov totalShiftBits, ecx  //得出要移位的总位数

		//求出除数的第一个双字的最高位的二进制0的个数
		mov ecx, 32
		mov edx, 0
		mov esi, 0x80000000
		mov edi, pDivisorLLI2
		mov edi, [edi]   ;//another.pLLI[another.lliLength-1];
CalcDivisorLZLoop:
		test esi, edi
		jnz CalcDivisorLZOver
		inc edx
		shr esi, 1
		loop CalcDivisorLZLoop
CalcDivisorLZOver:
		mov divisorLZs, edx

;/*
;//求出被除数的第一个双字的最高位的二进制0的个数
;		mov ecx, 32
;		mov edx, 0
;		mov esi, 0x80000000
;		mov edi, [ebx][lliLength]
;		mov edi, [ebx][pLLI-4][edi*4]   ;//this->pLLI[this->lliLength-1];
;CalcDividendLZLoop0:
;		test esi, edi
;		jnz CalcDividendLZOver
;		inc edx
;		shr esi, 1
;		loop CalcDividendLZLoop
;CalcDividendLZOver0:
;		mov dividendLZs, edx
;*/

		//置商为0
		mov edi, pQuotient
		push eax
		xor eax, eax  ;//mov eax, 0
		mov ecx, quotientLen
		cld
		rep stosd
		pop eax

LLongIntDivideLoop:
		//求出被除数的第一个双字的最高位的二进制0的个数
		mov ecx, 32
		mov edx, 0
		mov esi, 0x80000000
		mov edi, pDividendLLI2
		mov edi, [edi]
CalcDividendLZLoop:
		test esi, edi
		jnz CalcDividendLZOver
		inc edx
		shr esi, 1
		loop CalcDividendLZLoop
CalcDividendLZOver:
;//		mov dividendLZs, edx

;//被除数左移max(1, dividendLZs-divisorLZs)位
		mov ecx, 1
		;//mov edx, dividendLZs
		sub edx, divisorLZs
		cmp edx, 1
		jle DividendShiftLeft
		cmp edx, 32
		jb LessThan32Bits
		mov edx, 31
LessThan32Bits:
		mov ecx, edx
DividendShiftLeft:
		add shiftedBits, ecx
		mov edx, shiftedBits
		cmp edx, totalShiftBits
		jbe ShiftBitsOK
		sub shiftedBits, ecx
		mov edx, totalShiftBits
		sub edx, shiftedBits
		mov ecx, edx
		mov edx, totalShiftBits
		mov shiftedBits, edx
ShiftBitsOK:
		mov esi, pDividendLLI2
;//		cmp esi, pDividendLLI
;//		jb DividendShiftLeftOver
DividendShiftLeftLoop:
		mov edx, [esi]
		shld [esi+4], edx, cl
		sub esi, 4
		cmp esi, pDividendLLI
		jae DividendShiftLeftLoop
;//DividendShiftLeftOver:
		add esi, 4
		shl dword ptr [esi], cl

;//商左移max(1, dividendLZs-divisorLZs)位
;//QuotientShiftLeft:
		mov esi, pQuotient2
		cmp esi, pQuotient
		jbe QuotientShiftLeftOver
QuotientShiftLeftLoop:
		mov edx, [esi-4]
		shld [esi], edx, cl
		sub esi, 4
		cmp esi, pQuotient
		ja QuotientShiftLeftLoop
QuotientShiftLeftOver:
		shl dword ptr [esi], cl
;//比较被除数和除数的...位
		mov esi, pDividendLLI2
;//		add esi, 4
		cmp dword ptr [esi+4], 0
		ja SetQuotientTo1
;//		sub esi, 4
		mov ecx, [eax][lliLength]
		mov edi, pDivisorLLI2
CmpDividendDivisor2:
		mov edx, [esi]
		cmp edx, [edi]
		jb SetQuotientTo0
		ja SetQuotientTo1
		sub esi, 4
		sub edi, 4
		loop CmpDividendDivisor2
SetQuotientTo1:
		mov esi, pQuotient
		or dword ptr [esi], 1

;//substraction
		mov esi, pDividendLLI1
		mov edi, pDivisorLLI
		mov ecx, [eax][lliLength]
		push eax
		xor eax, eax
		clc
SubDivisorFromDividend:
		mov edx, [edi][eax*4]
		sbb [esi][eax*4], edx
		inc eax
		loop SubDivisorFromDividend
		sbb [esi][eax*4], 0
		pop eax
;//		jmp SetQuotientOver
SetQuotientTo0:
;//SetQuotientOver:
		mov ecx, shiftedBits
		cmp ecx, totalShiftBits
		jb LLongIntDivideLoop
	}
	remainder = LLongInt(pDividendLLI1, divisor.lliLength, dividend.sign);
	LLongInt rc(pQuotient, quotientLen, rSign);
	delete pQuotient;
	delete pDividendLLI;
	return rc;
}

//求b, 使得 (*this)*b ≡ 1 mod m
int LLongInt::ModRevert(LLongInt &m, LLongInt &result)
{
//S1:
	LLongInt n1 = m;
	LLongInt n2 = *this;
	LLongInt b1("0");
	LLongInt b2(1);
	LLongInt zero("0");
	LLongInt q, r, t;
//S2:
	q = Divide(n2, n1, r);
//S3:
	while (r != zero)
	{
		n1 = n2;
		n2 = r;
		t = b2;
		b2 = b1 - q * b2;
		b1 = t;
		q = Divide(n2, n1, r);
	}
//S4:
	if (n2 != LLongInt(1))
		return 0;
//S5:
	if (b2 < zero)
		b2 = b2 + m;
	result = b2;
	return 1;
}


//---------------------------------------------------------------------------------------------------
char* LLongInt::LLongInt2A(char *buff, int radix, char *radixSymbols)
{
	static char strRadixSymbols[16] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
		'a', 'b', 'c', 'd', 'e', 'f'};
	if (radix <= 1)
		return NULL;
	if (radix > 16 && radixSymbols==NULL)
		return NULL;
	if (radix <=16 && radixSymbols==NULL)
		radixSymbols = strRadixSymbols;
	LLongInt zero((__int64)0);
	LLongInt divisor((__int64)radix);
	LLongInt quotient = *this;
	LLongInt remainder((__int64)0);
	int symbols = 0;
	char *pBuff;
	if (this->sign == 0)
		pBuff = buff;
	else
	{
		pBuff = buff + 1;
		buff[0] = '-';
	}
	if (quotient == zero)
	{
		pBuff[0] = radixSymbols[0];
		pBuff[1] = 0;
		return buff;
	}

	while (quotient != zero)
	{
		quotient = Divide(divisor, quotient, remainder);
		pBuff[symbols] = radixSymbols[remainder.pLLI[0]];
		symbols++;
	}
	pBuff[symbols] = 0;
	symbols--;
	int index = 0;
	char temp;
	while (index < symbols)
	{
		temp = pBuff[index];
		pBuff[index] = pBuff[symbols];
		pBuff[symbols] = temp;
		index++;
		symbols--;
	}
	return buff;
}

int LLongInt::IsPrime()
{
	int rc;
	int l;
	LLongInt m, b;
	unsigned int *pmLLI;
	if (lliLength==1 && pLLI[0]==1)  //*this == 1
		return 0;
	if (lliLength==1 && pLLI[0]==2)
		return 1;
	if (pLLI[0] %2 == 0)
		return 0;
	__asm
	{
		mov eax, this
		mov esi, [eax][pLLI]
;//		mov edx, [esi]
;//		test edx, 1
;//		jnz CalcLAndM
;//		mov rc, 0
;//		jmp rt				;//是偶数，肯定不是素数
CalcLAndM:					;//计算l，使得 *this-1 = 2^l * m
		and dword ptr [esi], 0xfffffffe			;//*this = *this - 1;
		mov dword ptr l, 0
		mov edi, esi   ;//&(this->pLLI[0])
		
CalcLLoop:
		mov edx, [edi]
		cmp edx, 0
		jz LAdd32
		mov ecx, 32
CalcLLastDWord:
		shr edx, 1
		jc CalcLAdd
		loop CalcLLastDWord
CalcLAdd:
		add l, 32
		sub l, ecx
		jmp CalcLOver
LAdd32:
		add l, 32
		add edi, 4
		jmp CalcLLoop
CalcLOver:
		;//or dword ptr [esi], 1			;//*this = *this + 1
	}
	int mLLILength = lliLength - l/32;
	pmLLI = new unsigned int[mLLILength];
	__asm			;//计算使得 *this-1 = 2^l * m   的 m
	{
		mov edx, l
		shr edx, 5		;//edx = edx / 32
		shl edx, 2		;//edx = edx * 4

		mov eax, this
		mov esi, [eax][pLLI]
		add esi, edx
		
		mov edi, pmLLI
		mov ecx, [eax][lliLength]
		shr edx, 2
		sub ecx, edx
		push edi
		push ecx
		cld
		rep movsd
		pop edx
		pop edi

		mov ecx, l
		and ecx, 31		;//(31)d = (11111)b   这里等价于  edx = l % 32
MLLIShiftLeft:
		dec edx
		jz MLLIShiftLeftOver
		mov eax, [edi+4]
		shrd [edi], eax, cl
		add edi, 4
		jmp MLLIShiftLeft
MLLIShiftLeftOver:
		shr dword ptr [edi], cl
		;//恢复*this
		mov eax, this
		mov esi, [eax][pLLI]
		or dword ptr [esi], 1			;//*this = *this + 1
	}

	m = LLongInt(pmLLI, mLLILength, sign);
	delete pmLLI;
	int randomInt, a;
Miller_RabinTest:
	__asm		;//取得32位“随机”数
	{
		rdtsc

		mov ebx, eax
		xor bh, al
		mov dh, bh
		ror ebx, 8
		xor bh, dh
		ror ebx, 8
		xor bh, dh
		ror ebx, 16
		mov randomInt, ebx

/*
		mov bx, ax
		ror ebx, 16
		mov bx, ax
*/
	}
//	randomInt = 2;
	b = *this;
	unsigned int *pbLLI = b.pLLI;
	__asm
	{
		mov eax, this
		mov ecx, [eax][lliLength]
		mov edi, pbLLI
		mov edx, randomInt
XorBLLI:
		xor [edi], edx
		mov edx, [edi]
		add edi, 4
		loop XorBLLI

		sub edi, 4
		mov esi, [eax][pLLI]
		mov ecx, [eax][lliLength]
		dec ecx
		shl ecx, 2
		add esi, ecx
		mov edx, [esi]
//		mov esi, [eax][pLLI]
//		and dword ptr [esi], 0xfffffffe
BLLIDiv2:
		cmp [edi], edx
		jb BLLIDiv2Over
		shr dword ptr [edi], 1
		jmp BLLIDiv2
BLLIDiv2Over:
		
//		or dword ptr [esi], 1
	}

	b.Trim();

	if (b.lliLength==1 && (b.pLLI[0]==0 || b.pLLI[0]==1))
		b.pLLI[0] = 2;
	else
	if (b.lliLength==1 && lliLength==1 && b.pLLI[0]>=(pLLI[0]-1))
		b.pLLI[0] = pLLI[0] / 32;


	//b = LLongInt(2);

	LLongInt thisMinus1 = *this - LLongInt(1);
	LLongInt gap = (thisMinus1 - LLongInt(1) - b) / LLongInt(100);
	LLongInt v;
	int i;
	rc = 1;
	for (a=0; a<100; a++)
	{
S1:
		v = b.ExpMod(m, *this);
S2:
		if (v.lliLength==1 && v.pLLI[0]==1)
			goto S7;
S3:
		i = 1;
S4:
		if (v == thisMinus1)
			goto S7;
S5:
		if (i == l)
		{
			rc = 0;
			break;
		}
S6:
		v = (v * v) % *this;
		i = i + 1;
		goto S4;
S7:
		b = b + gap;
	}
rt:
	return rc;
}

//模幂乘算法, 计算 *this ^ e mod n
LLongInt LLongInt::ExpMod(LLongInt e, LLongInt n)
{

	//汇编算法
	//m = *this		计算 m ^ e mod n
	int a, totalBits, nowBit, nowDW, testBits;
	LLongInt *pE = &e;
	LLongInt c(1);
	LLongInt m = *this;
	__asm
	{
	//计算e共有多少个二进制位
		mov eax, pE
		mov edx, [eax][lliLength]
		mov edi, edx
		shl edx, 5   ;//*32
		dec edi
		shl edi, 2   ;//*4

		mov ecx, 32
		mov esi, 0x80000000
		add edi, [eax][pLLI]
		mov edi, [edi]
CalcLZ:
		test esi, edi
		jnz CalcLZOver
		dec edx
		shr esi, 1
		loop CalcLZ
CalcLZOver:
		mov totalBits, edx
		mov dword ptr nowBit, 0
	}

	while (nowBit < totalBits)
	{
		__asm
		{
			mov esi, nowBit
			shr esi, 5    ;// /32
			shl esi, 2    ;// *4
			mov eax, pE
			add esi, [eax][pLLI]
			mov edx, [esi]
			mov nowDW, edx
			mov edx, totalBits
			sub edx, nowBit
			mov testBits, edx
			cmp edx, 32
			jbe TestHighestDWord
			;//mov testBits, 32
			jmp TestLowerDWords
		}
TestHighestDWord:
		for (a=0; a<testBits; a++)
		{
			__asm
			{
				test dword ptr nowDW, 1
				jz eDivide2
				;//and dword ptr nowDW, 0xfffffffe
			}
			c = ( m * c ) % n;
			__asm
			{
				mov edx, totalBits
				sub edx, nowBit
				cmp edx, 1
				jbe ExpModOver
			}
eDivide2:
			__asm	shr dword ptr nowDW, 1
			m = (m * m) % n;
			__asm	inc nowBit
		}

TestLowerDWords:
		for (a=0; a<32; a++)
		{
			__asm
			{
				test dword ptr nowDW, 1
				jz eDivide2_2
				;//and dword ptr nowDW, 0xfffffffe
			}
			c = ( m * c ) % n;
eDivide2_2:
			__asm	shr dword ptr nowDW, 1
			m = (m * m) % n;
			__asm	inc nowBit
		}
	}

ExpModOver:
	return c;


/*
	//C++算法
	LLongInt c(1);
	LLongInt m = *this;
	LLongInt zero((__int64)0);
	LLongInt one(1);
	LLongInt two(2);
	while ( e != zero)
	{
		if ( ( e % two ) == zero )
		{
			e = e / two;
			m = ( m * m ) % n;
		}
		else
		{
			e = e - one;
			c = ( m * c ) % n;
		}
	}
	return c;
*/

}

unsigned int* LLongInt::GetBuff()
{
	return pLLI;
}

int LLongInt::GetBuffLength()
{
	return lliLength;
}

int LLongInt::GetSign()
{
	return sign;
}


















