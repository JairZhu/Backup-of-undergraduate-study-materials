#include<iostream.h>
#include<fstream.h>

const int LENGTH=2;
ofstream textFile("codedData.txt"); //解密后的文件
void deCoding(char c[],char A[][LENGTH]);    //将c中的字符用A解密后写入文件textFile
void main()
{
	int i,j;
	char letter;
	char c[LENGTH];//用于从密文中读取字符串
	char B[LENGTH][LENGTH];//用于存放加密的矩阵
	char A[LENGTH][LENGTH];//用于存放加密的矩阵的逆矩阵
	ifstream codedFile("textData.txt");//加密前的明文
	ifstream matrixFile("matrix.txt");//打开用于加密的矩阵
	
	if(!codedFile||!matrixFile) cout<<"不能打开文件。"<<endl;
//读取矩阵文件
	matrixFile>>letter;
    for(i=0;i<LENGTH;i++)
		for(j=0;j<LENGTH;j++){
			B[i][j]=letter;
			matrixFile>>letter;
		}
//生成上述矩阵的逆矩阵
	A[0][0]=B[1][1];
	A[0][1]=-B[0][1];
	A[1][0]=-B[1][0];
	A[1][1]=-B[0][0];
//读取密文并解密
	codedFile>>letter;
	for(i=0;codedFile;i++){
	    c[i%LENGTH]=letter;
		if(i%LENGTH==LENGTH-1)//如果字符串长度刚好为LENGTHM，则加密
			deCoding(c,A);
		codedFile>>letter;
	}
}

void deCoding(char c[],char A[][LENGTH])//将c中的字符用A解密后写入文件textFile
{
	int cc;//明文
//解密,写入文件
	for(int i=0;i<LENGTH;i++){
		cc=0;
		for(int j=0;j<LENGTH;j++){
			cc=cc+(int)A[i][j]*(int)c[j];
			textFile<<char(cc)<<' ';
		}
	}
}
	

  

