
//
// x ^ y % z = ?
//
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned __int64 Number;

Number myatoi(char* num)
{
	Number i=0;
	char* pend = num+strlen(num);
	while (num!=pend)
	{
		i = i*10+(*num-'0');
		num++;
	}
	return i;
}

char* myitoa(Number i)
{
	static char buf[30];
	char* p = buf+sizeof(buf)-1;
	while (i)
	{
		*p = '0'+((int)(i%10));
		i /= 10;		
		p--;
	}
	return p+1;
}




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

int usage()
{
	puts("xymz <x> <y> [z]");
	exit(-2);
	return 0;
}


main(int argc, char* argv[])
{

	if (argc<3)
		usage();

	Number x, y, z;
	if ((argv[1][0]<'0') || (argv[1][0]>'9'))
		usage();
	x = myatoi(argv[1]);
	if ((argv[2][0]<'0') || (argv[1][0]>'9'))
		usage();
	y = myatoi(argv[2]);
	if (argc>3)
	{
		if ((argv[3][0]<'0') || (argv[3][0]>'9'))
			usage();
		z = myatoi(argv[3]);
	}
	else
		z = 0;

	if (z==0)
		usage();

	Number r = xymodz(x, y, z);

	printf("%s", myitoa(x));
	printf(" ^ %s",	myitoa(y));
	printf(" mod %s", myitoa(z));
	printf(" = %s\n", myitoa(r));

	return 0;
}