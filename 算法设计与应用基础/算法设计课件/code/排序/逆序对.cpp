#include <iostream>
#include <vector>
using namespace std;
//对A数组[x,y)数据段进行归并排序，T是辅助空间 
void merge_sort(int *A, int x, int y, int* T)
{
	if (y-x > 1)
	{
		int m = x + (y-x) / 2;	// divide
		int p = x, q = m, i = x;
		merge_sort(A, x, m, T);	// 递归求解
		merge_sort(A, m, y, T);	// 递归求解
		while (p < m || q < y)
		{
		    if(q >= y || (p < m && A[p] <= A[q])) 
			  T[i++] = A[p++];
		    else {T[i++] = A[q++];} 
		}
		for(i=x; i<y; i++) A[i] = T[i];
	}
}

int inversion_num = 0; //存放逆序对个数，每次调用前清0 
void inversion_number(int *A, int x, int y, int* T)
{
	if (y-x > 1)
	{
		int m = x + (y-x) / 2;	// divide
		int p = x, q = m, i = x;
		merge_sort(A, x, m, T);	// 递归求解
		merge_sort(A, m, y, T);	// 递归求解
		while (p < m || q < y)
		{
		    if(q >= y || (p < m && A[p] <= A[q])) 
			  T[i++] = A[p++];
		    else {T[i++] = A[q++]; inversion_num += m-p;} 
		}
		for(i=x; i<y; i++) A[i] = T[i];
	}
}

int main()
{
    int a[] = {3, 1, 4, 5, 2};
    int b[10];
    inversion_num = 0;
    inversion_number(a,0,5,b);

    for (int k=0; k<=4; k++)
      cout << a[k] << " ";
    cout << inversion_num << endl;
    for (int k=0; k<=4; k++)
      cout << a[k] << " ";
    cout << endl;
}
