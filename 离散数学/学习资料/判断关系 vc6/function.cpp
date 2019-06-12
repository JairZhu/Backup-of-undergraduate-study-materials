////////////////////////////////////////////////////////////////////////
//
// FileName : function.cpp
// Creator  : wdx
// Date     : 2010-03-25 02:23
// Comment  : The implement for the relations-judging for discrete 
//			  mathematical structures
//
////////////////////////////////////////////////////////////////////////
#ifndef MAIN_H
#define MAIN_H
#endif

#include "main.h"

bool ifrflx = true, ifirflx = true, ifsym = true;
bool ifasym = true, ifatsym = true, iftran = true;
bool ifequi = true, ifpartOder = true;
extern int nn;

bool rflx(int a[SIZE][SIZE],int nn){
	for (int t = 0; t < nn; ++t)
	{	
		if (a[t][t] != 1)
		{	
			ifrflx = false;
			cout << " 原始矩阵 不是 自反的(not reflexive)!" << endl;
			break;
		}
	}
	if (ifrflx == true)
		cout << " 原始矩阵 是 自反的(reflexive)!" << endl;
	return true;
}

bool irflx(int a[SIZE][SIZE],int nn){
	for (int t = 0; t < nn; ++t)
	{
		if (a[t][t] != 0)
		{
			ifirflx = false;
			cout << " 原始矩阵 不是 非自反的(not irreflexive)!" << endl;
			break;
		}
	}
	if (ifirflx == true)
	{
		cout << " 原始矩阵 是 非自反的(irreflexive)!" << endl;
	}
	return true;
}

bool sym(int a[SIZE][SIZE],int nn){
	for (int i = 0; i < nn; i++)
	{
		for (int j = i + 1; j < nn; j++)
		{
			if (a[i][j] != a[j][i])
			{
				ifsym = false;
				cout << " 原始矩阵 不是 对称的(not symmetric)!" << endl;
				break;
			}
		}
		if (ifsym == false)
		{
			break;
		}
	}
	if (ifsym == true)
	{
		cout << " 原始矩阵 是 对称的(symmetric)!" << endl;
		
	}
	return true;
}

bool asym(int a[SIZE][SIZE],int nn){
	if (ifirflx == false)
	{
		ifasym = false;
		cout << " 原始矩阵 不是 非对称的(not asymmetric)!" << endl;
	}
	else
	{
		for (int i = 0; i < nn; i++)
		{
			for (int j = i + 1; j < nn; j++)
			{
				if (a[i][j] == a[j][i])
				{
					ifasym = false;
					cout << " 原始矩阵 不是 非对称的(not asymmetric)!" << endl;
					break;
				}
			}
			if (ifasym == false)
				break;
			
		}
	}
	if (ifasym == true)
	{
		cout << " 原始矩阵 是 非对称的(asymmetric)!" << endl;
	}
	return true;
}

bool atsym(int a[SIZE][SIZE],int nn){
	if (ifasym == false)
	{
		for (int i = 0; i < nn; i++)
		{
			for (int j = i + 1; j < nn; j++)
			{
				if (a[i][j] == a[j][i] && a[i][j] == 1)
				{
					ifatsym = false;
					cout << " 原始矩阵 不是 反对称的(not antisymmetric)!" << endl;
					break;
				}
			}
			if (ifatsym == false)
			{
				break;
			}
		}
	}
	if (ifatsym == true)
	{
		cout << " 原始矩阵 是 反对称的(antisymmetric)!" << endl;
	}
	return true;
}

bool tran(int a[SIZE][SIZE],int nn){
	
	int i = 0, j = 0, k = 0;
	for (i = 0; i < nn; i++)
		for (j = 0; j < nn; j++)
			if (a[i][j] == 1)
				for (k = 0; k < nn; k++)
					if (a[j][k] == 1 && a[i][k] != 1)
						iftran = false;
	if (iftran == true)
		cout << " 原始矩阵 是 传递的(transitive)!" << endl;
	if (iftran == false)
		cout << " 原始矩阵 不是 传递的(not transitive)!" << endl;
	return true;
}

bool equi(){
	if (ifrflx == ifsym && ifsym == iftran && iftran == true)
		cout << " 原始矩阵 是 等价的(equivalent)!" << endl;
	else
	{
		cout << " 原始矩阵 不是 等价的(not equivalent)!" << endl;
		ifequi = false;
	}
	return true;
}

bool partOrder(){
	if (ifrflx == ifasym && ifasym == iftran && iftran == true)
		cout << " 原始矩阵 是 偏序的(partically ordered)!" << endl;
	else
	{
		cout << " 原始矩阵 不是 偏序的(not partically ordered)!" << endl;
		ifpartOder = false;
	}
	return true;
}

void reset(){
	ifrflx = true; 
	ifirflx = true; 
	ifsym = true;
	ifasym = true; 
	ifatsym = true;
	iftran = true;
	ifequi = true;
	ifpartOder = true;
}

void printMat(int a[SIZE][SIZE],int nn){
	cout << "******************" << endl;
	for (int i = 0; i < nn; i++)
	{
		for(int j =0; j < nn; j++)
		{
			cout << a[i][j] << "  ";
		}
		cout << endl;
	}
	cout << "******************" << endl;
}

bool setDataF1(int mtx[SIZE][SIZE],int vmtx[SIZE][SIZE], int imtx[SIZE][SIZE] ,int nn){
	int i = 0,j = 0;
	char temp[SIZE];
	
	cout << "\n输入矩阵数据时严禁输入非 0 或 1 的数字!!\n";
	for(i = 0; i < nn; i++)
	{
		cout << "elements in line " << i+1 << " : ";
		cin >> temp;
		for (j = 0; j < nn; j++)
		{	
			if ((temp[j] - '0') < 0 || (temp[j] - '0') > 1)
			{
				cout << "你的输入非法，将退回功能选择界面！！\n";
				system("pause");
				return false;
			}
			mtx[i][j] = temp[j] - '0';
			vmtx[j][i] = temp[j] - '0';
			if (temp[j] - '0' == 1)
				imtx[i][j] = 0;
			else
				imtx[i][j] = 1;
		}
	}
	return true;
}

bool setSize(void){
	char temp;
	cout << "请输入矩阵的长度(宽度): " << endl;
	cout << "最大值不得超过 6 !!" << endl;
	cout << "size = ";
	cin >> temp;
	nn = temp - '0';
	if ( nn < 2 || nn > 6)
	{
		cout << "你的输入非法，将退回功能选择界面！！\n";
		system("pause");
		return false;
	}
	else
		return true;
}

void judgeRelation(void){
	system("cls");
	cout << TITLE
		 << "*******************************************************************\n"
	  	 << "                      计算单一矩阵的各种关系\n"
		 << endl;
	
	int mtx[SIZE][SIZE];
	int vmtx[SIZE][SIZE];   // inverse
	int imtx[SIZE][SIZE];	// implement
	bool pass = true;

	pass = setSize();	
	if (pass == true)
	{
		pass = setDataF1(mtx,vmtx,imtx,nn);
	}
	
	system("cls");
	cout << TITLE
		 << "*******************************************************************\n"
		 << "                      计算单一矩阵的各种关系\n"
		 << endl;
	if (pass == true)
	{
		cout << "原始矩阵如下:" << endl;
		printMat(mtx,nn);
		cout << "互补矩阵如下:" << endl;
		printMat(imtx,nn);
		cout << "逆矩阵如下:" << endl;
		printMat(vmtx,nn);
		cout << "\n\t以下为原始矩阵判断阶段:\n";
		
		rflx(mtx,nn);
		irflx(mtx,nn);
		sym(mtx,nn);
		asym(mtx,nn);
		atsym(mtx,nn);
		tran(mtx,nn);
		equi();
		partOrder();
	}
	reset();
	system("pause");
	welcomeScreen1();
}

void mtxCalculate(){
	int mtx1[SIZE][SIZE];
	int mtx2[SIZE][SIZE];
	int rslmtx[SIZE][SIZE];
	bool pass = true;
	int type = 0;
	int power = 1;
	system("cls");
	cout << TITLE
	     << "*******************************************************************\n"
		 << "                       计算矩阵的逻辑相乘\n"
		 << endl;
	pass = setSize();
	cout << "                   请选择矩阵逻辑相乘的类型:\n"
		 << "              1:两个矩阵相乘，两个矩阵是不一样的。\n"
		 << "              2:单个矩阵的平方，三次方，或更高次方运算。\n"
		 << "请输入编号: ";
	cin >> type;
	
	if (type == 1)
	{
		system("cls");
		cout << TITLE
			<< "*******************************************************************\n"
			<< "                  两个矩阵相乘，两个矩阵是不一样的\n"
			<< endl;
		if (pass == true)
		{
			cout << "请输入第一个矩阵的数据: \n";
			pass = setDataF2(mtx1,nn);
			cout << "请输入第二个矩阵的数据: \n";
			pass = setDataF2(mtx2,nn);
		}
		system("cls");
		cout << TITLE
			<< "*******************************************************************\n"
			<< "                     计算两个矩阵的逻辑相乘\n"
			<< endl;
		if (pass == true)
		{
			cout << " 第一个矩阵如下: \n";
			printMat(mtx1,nn);
			cout << " 第二个矩阵如下: \n";
			printMat(mtx2,nn);
			detailCal(mtx1,mtx2,rslmtx,nn);
			cout << " 乘积为: \n";
			printMat(rslmtx,nn);		
		}
		system("pause");
		welcomeScreen1();
	}
	else if (type == 2)
	{
		system("cls");
		cout << TITLE
			 << "*******************************************************************\n"
			 << "               单个矩阵的平方，三次方，或更高次方运算\n"
			 << endl;
		cout << "请输入矩阵数据: \n";
		pass = setDataF2(mtx1,nn);
		cout << "请输入所需要的次方数(平方输入2，立方输入3...不建议过大): ";
		cin >> power;
		copyData(mtx1,mtx2,nn);
		for(int times = 1; times < power; times++)
		{
			detailCal(mtx1,mtx2,mtx1,nn);
		}
		cout << "所求的矩阵如下: \n";
		printMat(mtx1,nn);
		system("pause");
		welcomeScreen1();
	}
	else
	{
		cout << "\n你乱来了，别这样。上面有的数字才能输入。\n";
		system("pause");
		welcomeScreen1();
	}

	
}

bool setDataF2(int mtx[SIZE][SIZE],int nn){
	int i = 0,j = 0;
	char temp[SIZE];
	cout << "输入矩阵数据时严禁输入非 0 或 1 的数字!!\n";
	for(i = 0; i < nn; i++)
	{
		cout << "elements in line " << i+1 << " : ";
		cin >> temp;
		for (j = 0; j < nn; j++)
		{	
			if ((temp[j] - '0') < 0 || (temp[j] - '0') > 1)
			{
				cout << "你的输入非法，将退回功能选择界面！！\n";
				system("pause");
				return false;
			}
			mtx[i][j] = temp[j] - '0';
		}
	}
	return true;
}

void detailCal(int mtx1[SIZE][SIZE],int mtx2[SIZE][SIZE],int rlsmtx[SIZE][SIZE],int nn){
	int tempSum = 0,ai = 0, aj= 0, bj = 0;
	for(ai = 0; ai < nn; ai++)
	{
		for(bj = 0; bj < nn; bj++)
		{
			for(aj = 0; aj < nn; aj++)    
			{
				tempSum=tempSum + mtx1[ai][aj] * mtx2[aj][bj];  
				if (tempSum == 1)
				{
					break;
				}
			}	
			rlsmtx[ai][bj]= tempSum;
			tempSum = 0;
		}
	}
}

void solveEquation(){
	system("cls");
	cout << TITLE
		 << "*******************************************************************\n"
         << "                  求多元方程组的解(利用矩阵)\n"
		 << endl
		 << "本算法为高斯算法，出错几率是有，但是不大。\n"
		 << "倘若方程本身有自由解，那么输出的答案很可能有问题，答案异常请三思。\n"
		 << "*******************************************************************\n";
	GaussSolveMtx myEqu;
    myEqu.inputEquation();
    myEqu.solveEquation();
    myEqu.outputAnswer();
	system("pause");
	welcomeScreen1();
}


void complexCal(){
	extern double tempReal,tempImaginary;
	system("cls");
	cout << TITLE
		 << "*******************************************************************\n"
		 << "                  计算复数的各种运算(加、减、乘)\n"
	     << endl;
	Complex a,b,c;
	cout << "请设置第一个复数的值\n";
	a.setData();
	cout << "请设置第二个复数的值\n";
	b.setData();
	cout << "两个复数分别为: \n";
	a.printData();
	b.printData();
	cout << "\n两个复数相加:";
	a.Addition(b);
	c.setReal(tempReal);
	c.setImaginary(tempImaginary);
	c.printData();
	cout << "\n两个复数相减:";
	a.Subtraction(b);
	c.setReal(tempReal);
	c.setImaginary(tempImaginary);
	c.printData();
	cout << "\n两个复数相乘:";
	a.Multiplication(b);
	c.setReal(tempReal);
	c.setImaginary(tempImaginary);
	c.printData();
	cout << endl;
	system("pause");
	welcomeScreen1();
}

void copyData(int mtx1[SIZE][SIZE],int mtx2[SIZE][SIZE],int nn){
	for (int i = 0; i < nn; i++)
	{
		for (int j = 0; j < nn; j++)
		{
			mtx2[i][j] = mtx1[i][j];
		}
	}
}

void closureCal(){
	int mtx[SIZE][SIZE];
	int vmtx[SIZE][SIZE];   // inverse
	int imtx[SIZE][SIZE];	// implement
	int rltmtx[SIZE][SIZE];
	int equalmtx[SIZE][SIZE];
	bool pass = true;
	// initializer for equal matrix
	for (int k = 0; k < SIZE; k++)
	{
		for (int l = 0; l < SIZE; l++)
		{
			if (k == l)
			{
				equalmtx[k][l] = 1;
			}
			else
				equalmtx[k][l] = 0;
		}
	}

	system("cls");
	cout << TITLE
		 << "*******************************************************************\n"
		 << "               求解矩阵的自反闭包，对称闭包，传递闭包\n"
	     << endl;
	pass = setSize();
	if (pass == true)
	{
		pass = setDataF1(mtx,vmtx,imtx,nn);
	}
	if (pass == true)
	{
		mtxPlus(mtx,equalmtx,rltmtx,nn);
		cout << "该矩阵为:\n";
		printMat(mtx,nn);
		cout << "其自反闭包为: \n";
		printMat(rltmtx,nn);
		mtxPlus(mtx,vmtx,rltmtx,nn);
		cout << "其对称闭包为: \n";
		printMat(rltmtx,nn);
		cout << "其传递闭包为: \n";
		Warshall(mtx,rltmtx,nn);
		printMat(rltmtx,nn);
	}
	system("pause");
	welcomeScreen1();
}

void mtxPlus(int mtx1[SIZE][SIZE],int mtx2[SIZE][SIZE],int rltmtx[SIZE][SIZE],int nn){
	for (int i = 0; i < nn; i++)
	{
		for (int j = 0 ; j < nn; j++)
		{
			rltmtx[i][j] = mtx1[i][j] + mtx2[i][j];
			if (rltmtx[i][j] > 1)
			{
				rltmtx[i][j] = 1;
			}
		}
	}
}

void Warshall(int mtx[SIZE][SIZE],int rltmtx[SIZE][SIZE],int nn){
	int i,j,k;
	copyData(mtx,rltmtx,nn);
	for(k=0;k<nn;k++)
		for(i=0;i<nn;i++)                                /*warshall*/
			for(j=0;j<nn;j++)
				rltmtx[i][j] += rltmtx[i][j] + rltmtx[i][k] * rltmtx[k][j];
			
	for(i=0;i<nn;i++)
		for(j=0;j<nn;j++)
		{                                /*把rltmtx[]非0项赋值为1*/
			if(!rltmtx[i][j]) continue;
			else rltmtx[i][j]=1;
		}
}