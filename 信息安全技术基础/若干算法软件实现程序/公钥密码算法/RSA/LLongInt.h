
class LLongInt
{
public:
	LLongInt();
	LLongInt(__int64 i64);
	LLongInt(char *strDec);
	LLongInt(unsigned int *strHex, int intCount, int sign);
	LLongInt(LLongInt &another);
	~LLongInt( );
	LLongInt operator -(LLongInt &another);
	LLongInt operator *(LLongInt &another);
	LLongInt Abs(LLongInt &lli);
	void operator =(LLongInt &another);
	int operator ==(LLongInt &another);
	int operator >(LLongInt &another);
	int operator <(LLongInt &another);
	int operator >=(LLongInt &another);
	int operator <=(LLongInt &another);
	int operator !=(LLongInt &another);
	char* LLongInt2A(char *buff, int radix, char *radixSymbols=NULL);
	LLongInt ExpMod(LLongInt e, LLongInt n);	//模幂乘算法
	int IsPrime();
	int ModRevert(LLongInt &m, LLongInt &result);
	LLongInt Divide(LLongInt &divisor, LLongInt &dividend, LLongInt &remainder);
	unsigned int* GetBuff();
	int GetBuffLength();
	int GetSign();
private:
	unsigned int *pLLI;
	int lliLength;  //int 的个数
	int sign;
private:
	int Trim( );
	
};

