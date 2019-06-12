#include "stdafx.h"
#include "Rsa.h"

CRsa::CRsa()
{
}
CRsa::~CRsa()
{
}
void CRsa::getkeys(CBigInt& n,CBigInt& e,CBigInt& d)
{
	CBigInt p,q;
	p.GetPrime(16);
	q.GetPrime(16);
	n.Mov(p.Mul(q));

	p.Mov(p.Sub(1));
	q.Mov(q.Sub(1));
	CBigInt eu_n;
	eu_n.Mov(p.Mul(q));
	CBigInt one;
	one.Mov(1);
	e.GetPrime(8);
	while((e.Gcd(eu_n).Cmp(one))!=0) e.Mov(e.Add(2));
	d.Mov(e.Euc(eu_n));
}
CBigInt CRsa::encrypt(CBigInt& m,CBigInt& n,CBigInt& e)
{
	CBigInt c;
	c.Mov(m.RsaTrans(e,n));
	return c;
}
CBigInt CRsa::decrypt(CBigInt& c,CBigInt& n,CBigInt& d)
{
	CBigInt m;
	m.Mov(c.RsaTrans(d,n));
	return m;
}