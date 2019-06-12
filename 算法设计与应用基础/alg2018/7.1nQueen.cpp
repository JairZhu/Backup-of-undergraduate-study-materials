//
// Created by 李新锐 on 10/07/2018.
//
#include "alg.h"
bool place(const vector<int>& X, int k)
{
    for(int i = 0; i < k; ++i)
        if(X[i] == X[k] || abs(X[i] - X[k]) == abs(i - k))
            return false;
    return true;
}

void nQueen(int n)
{
    vector<int> X(n, 0);
    int k = 0;
    while(k >= 0)
    {
        X[k]++;
        while(X[k] <= n && !place(X, k))
            X[k]++;
        if(X[k] <= n)
        {
            if(k == n - 1)
            {
                for(auto i : X)
                    cout << i << ' ';
                cout << endl;
            }
            else
            {
                k++;
                X[k] = 0;
            }
        }
        else
        {
            k--;
        }
    }
}

int main()
{
    nQueen(8);
}

void nnQueen(int n)
{
    vector<int> X(n, 0);
    int k = 0;
    while(k >= 0)
    {
        X[k]++;
        while(X[k] <= n && !place(X,k))
            X[k]++;
        if(X[k] <= n)
        {
            if(k == n - 1)
            {
                for(auto i : X)
                    cout << i << ' ';
                cout << endl;
            }
            else
            {
                k++;
                X[k] = 0;
            }
        }
        else
        {
            k--;
        }
    }
}
