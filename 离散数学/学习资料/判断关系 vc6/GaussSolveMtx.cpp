//////////////////////////////////////////////////////////////////////////
//
// FileName : GaussSolveMtx.cpp
// Creator  : wdx
// Date     : 2010.04.09
// Comment  : The Gauss Method to solve matrix equations
//
//////////////////////////////////////////////////////////////////////////

#include "main.h"

void GaussSolveMtx::inputEquation(){
	double dataTemp;
	vector < double > vtemp;
	cout << "请输入方程(变量)个数: ";
	cin >> mn;
	cout << "请依次输入方程的系数(必须是整理好的)，每行的最后一位是等号右边的得数:\n";
	for (int i(0); i < mn; ++i)
	{
		equationMtx.push_back(vtemp);
		for (int j(0); j <= mn; ++j)
		{
			cin >> dataTemp;
			equationMtx[i].push_back(dataTemp);
		}
		if (equationMtx[i].size() != mn+1)
		{
			cout << "输入有误，请重新输入上一个方程。\n";
			--i;
		}
	}
}

void  GaussSolveMtx::solveEquation()
{
    vector < vector <double> >::iterator iter;
    iter = equationMtx.begin();
	for (int m( 0 );m < mn - 1 ; ++m)
	{
		// 将绝对值最大的主元素移上去。此举是为了减少误差 
		for (vector < vector <double> >::iterator iter2 = iter + 1 ;iter2 != equationMtx.end(); ++ iter2)
		{
			if (fabsl(iter -> front()) < fabsl(iter2 -> front()))
			{
                swap( * iter, * iter2);
            } 
        } 
		// 进行消元 
		for ( int i = m + 1 ;i < mn; ++i)
		{
			double  dm;
            dm = equationMtx[i][m] / equationMtx[m][m];
			for (int j = m;j < mn + 1 ; ++j)
			{
                equationMtx[i][j] -= dm * equationMtx[m][j];
            } 
        } 
		++ iter;
    } 
	cout << "\n以下是化简后的矩阵\n";
	for (int k(0); k < mn; k++)
	{
		for (int e(0); e < mn+1; e++)
		{
			if (equationMtx[k][e] < PRELIMIT)
			{
				equationMtx[k][e] = 0;
			}
			cout << setw(10) << setprecision(4) << equationMtx[k][e] << " ";
		}
		cout << endl;
	}

	// 初始化answerMtx向量 
	for (int i(0);i < mn; ++i) answerMtx.push_back(0);
	// 求解答案 
	answerMtx[mn - 1] = equationMtx[mn - 1][mn] / equationMtx[mn - 1][mn - 1];
	
	for ( int l = mn - 2 ;l >= 0 ; --l)
	{
        answerMtx[l] = equationMtx[l][mn];
		for ( int j = mn - 1 ;j > l; --j)
            answerMtx[l] -= answerMtx[j] * equationMtx[l][j];
        answerMtx[l] /= equationMtx[l][l];
    }    
}

void  GaussSolveMtx::outputAnswer()
{
	for (int i(1);i <= mn; ++i)
	{
        cout << " x(" << i << ") = " << answerMtx[i - 1] << endl;
    } 
}