#include<iostream.h>
#include<fstream.h>

const int LENGTH=2;
ofstream codedFile("codedData.txt"); //加密后的文件
void coding(char c[],char A[][LENGTH]);    //将c中的字符用A加密后写入文件codedFile
void main()
{
	int i,j;
	char letter;
	char c[LENGTH];
	char A[LENGTH][LENGTH];//用于存放加密的矩阵
	ifstream textFile("textData.txt");//加密前的明文
	ifstream matrixFile("matrix.txt");//打开用于加密的矩阵
	
	if(!textFile||!matrixFile) cout<<"不能打文件。"<<endl;
//读取矩阵文件
	matrixFile>>letter;
    for(i=0;i<LENGTH;i++)
		for(j=0;j<LENGTH;j++){
			A[i][j]=letter;
			matrixFile>>letter;
		}
//读取明文并加密
	textFile>>letter;
	for(i=0;textFile;i++){
	    c[i%LENGTH]=letter;
		if(i%LENGTH==LENGTH-1)//如果字符串长度刚好为LENGTHM，则加密
			coding(c,A);
		textFile>>letter;
	}
	//特殊处理
	if(i%LENGTH!=0){//如果最后的字符串长度不是LENGTH，则补足空格再加密
        for(j=i;j<=LENGTH;j++)
			c[j]=' ';
		coding(c,A);
	}
}

void coding(char c[],char A[][LENGTH])//将c中的字符用A加密后写入文件codedFile
{
	long int cc;//密文
//加密,写入文件
	for(int i=0;i<LENGTH;i++){
		cc=0;
		for(int j=0;j<LENGTH;j++){
			cc=cc+(int)A[i][j]*(int)c[j];
			codedFile<<cc<<' ';
		}
	}
}
	

  

