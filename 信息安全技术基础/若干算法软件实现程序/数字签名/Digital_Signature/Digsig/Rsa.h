#pragma once
#include "BigInt.h"
class CRsa
{
public:
	CRsa();
	~CRsa();
	void getkeys(CBigInt& n,CBigInt& e,CBigInt& d);
	CBigInt encrypt(CBigInt& m,CBigInt& n,CBigInt& e);
	CBigInt decrypt(CBigInt& c,CBigInt& n,CBigInt& d);
};