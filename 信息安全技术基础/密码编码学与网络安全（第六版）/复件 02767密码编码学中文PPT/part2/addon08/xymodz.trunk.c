
//
// x^y%z in VC++, by Linden 2000-10-21 22:00
// 

typedef unsigned __int64 Number;

Number xymodz(Number x, Number y, Number z)
{
	Number r=1;

	while (y)
	{
		if (y&1)
			r = (r*x)%z;
		x = (x*x)%z;
		y/=2;
	}

	return r;
}


// common factor in Euclid alg, by Linden 2000 10-26 23:00
//

int cm(int a, int b)
{
#if 0
	if (a==0)
		return b;
	else if (b==0)
		return a;
	else if (a>b)
		return cm(a%b, b);
	else
		return cm(a, b%a);
#else
	while ((a!=0) && (b!=0))
	{
		if (a>b)
			a=a%b;
		else
			b=b%a;
	}
	return a+b;
#endif
}
