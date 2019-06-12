#include<iostream.h>
#include<conio.h>
#include<stdio.h>
#include<math.h>
////////////////////////////////////////////////////////////////////////
#define		SIG_LEN		10
////////////////////////////////////////////////////////////////////////
long	count1;	// signature index for x1
long	count2;	// signature index for x2
long	count;  // signature index for x
////////////////////////////////////////////////////////////////////////
long	sub[SIG_LEN];	// subset of possible forged signatures
long	n;				// signature size
long	k;				// message length
long	sig_x[2*SIG_LEN];	// forged signature
////////////////////////////////////////////////////////////////////////
int		get_message(int order);
void	get_forge_sig(long *sig, int length);
int		Binomial(int n, int m);
void	Bos_Chaum(long n, long x, long *sig, long *count);
void	Union(long *set1, long *set2, long *uset);
void	Attack(long *uset, long start, long end, long subset_size);
void	Construct(long count, long k, long n, long *sig, long *x, long *X);
void	output_sig(long x, long *sig_x, int length);
////////////////////////////////////////////////////////////////////////
void main()
{
	long	x1;		// message1 to sign
	long	x2;		// message2 to sign

	long	sig_x1[SIG_LEN];	// signature of x1
	long	sig_x2[SIG_LEN];	// signature of x2

	char	c1;
	double	log2 = log(2);


	printf("********************* Bos_Chaum Digital Signature Demo *************************\n");

	do
	{
		x1 = get_message(1);
		x2 = get_message(2);

		// sign for x1:
		double logx = log(x1);
		k = (long)ceil(logx / log2);
		// make sure Binomial(2n, n) >= pow(2,k), where k is message length
		for(n = 1; Binomial(2*n , n) < pow(2, k); n++);
		Bos_Chaum(n, x1, sig_x1, &count1);

		// sign for x2:
		logx = log(x2);
		k = (long)ceil(logx / log2);
		for(n = 1; Binomial(2*n , n) < pow(2, k); n++);
		Bos_Chaum(n, x2, sig_x2, &count2);

		// output signature sig_x1
		output_sig(x1, sig_x1, count1);
		// output signature sig_x2
		output_sig(x2, sig_x2, count2);
		
		printf("\n\nNow attempting to forge signatures...");
		// construct forged signature
		Union(sig_x1, sig_x2, sig_x);
		Attack(sig_x, 0, count, n);

		printf("\nPress any key to continue or Q to EXIT...\n");
		c1 = char(_getch());

	}while(c1 != 'Q' && c1 != 'q');
}

int get_message(int order)
{
	long x;
	printf("\nPlease input the message:\nx%d=",order);
	cin>>x;
	return x;
}

void get_forge_sig(long *sig, int length)
{
	int i = 0;
	printf("\nPlease input the forged signature(length = %d):\ne.g. 8 6 4 2 ...\n",length);
	while(length > 0)
	{
		cin>>sig[i];
		length --;
		i ++;
	}
}

void Bos_Chaum(long n, long x, long *sig, long *count) 
// sign for x, 	sig is the signatrue of x, count is the length of signature
{
	// Step 1: initialize
	long b, e = n, t = n << 1;
	*count = 0;

	// Step 2: loop until t == 0
	while (t > 0)
	{
		// Step 3:
		t = t - 1;
		// Step 4
		b = Binomial(t, e);
		if (x > b)
		{
			// Step 5
			x -= b;
			e--;
			sig[*count] = t + 1;
			*count = *count + 1;
		}
    }
}

void Union(long *set1, long *set2, long *uset)
{
	int i = 0;
	int j = 0;
	count = 0;
	while(i < count1 && j < count2)
	{
		if(set1[i] > set2[j])
		{
			uset[count] = set1[i];
			i ++;
			count ++;
		}
		else if(set1[i] < set2[j])
		{
			uset[count] = set2[j];
			j ++;
			count ++;
		}
		else //if(set1[i] == set2[j])
		{
			uset[count] = set1[i];
			i ++;
			j ++;
			count ++;
		}
	}
	while(i < count1)
	{
		uset[count] = set1[i];
		i ++;
		count ++;
	}
	while(j < count2)
	{
		uset[count] = set2[j];
		j ++;
		count ++;
	}
}

void Attack(long *uset, long start, long end, long subset_size)
{
	long x;		// message for forged signature
	long y = -1;

	if (subset_size == 0) // a subset found
	{
		Construct(n, k, n, sub, &x, &y);	// forge a new signature
		if(y != 0)
		{
			Bos_Chaum(n, x, sig_x, &count); // search for message
			// output forged signature
			output_sig(x, sig_x, count);
		}
		return;
	}
	if( (end - start + 1) < subset_size )
		return;

	// mark the subset
	sub[n - subset_size] = uset[start];
	Attack(uset, start+1, end, subset_size - 1);
	Attack(uset, start+1, end, subset_size);

}

void Construct(long count, long k, long n, long *sig, long *x, long *X)	
// find a number x, whose signature is sig
{
	int equal;
	long i, j, max = (long)pow(2, k);
	long p_count, phip[SIG_LEN];

	for (i = 0; i < max; i++) 
	{
		// Sign for current message
		Bos_Chaum(n, i, phip, &p_count);
		if (count == p_count) 
		{
			// Try to match the whole signature
			equal = sig[0] == phip[0];
			for (j = 1; equal && j < count; j++)
			equal = sig[j] == phip[j];
			//success
			if (equal) 
			{
				*X = i;
				*x = i;
				return;
			}
		}
	}
	// failed
	*X = 0;
}

int Binomial(int n, int m)
{
	float i = (float)n;
	float j = (float)m;
	float com = 1;

	if(n == 0)
		return 1;

	while(j >= 1)
	{
		com *= i / j;
		i--;
		j--;
	}

	return (int)com;
}

void output_sig(long x, long *sig_x, int length)
{
	printf("%s %d %s","\nThe Digital Signature of", x, "is:\n");
	while(length > 0)
	{
		length--;
		if(length)
			printf("%s%d%s","y", sig_x[length], ", ");
		else
			printf("%s%d","y", sig_x[length]);
	}
}