//
// Created by 李新锐 on 08/07/2018.
//
#include "alg.h"

int minDistance(string word1, string word2) {
    vector<vector<int>> E;
    auto m = word1.size();
    auto n = word2.size();
    for(int i = 0; i <= m; ++i)
        E.emplace_back(vector<int>(n+1, 0));
    for(int i = 0; i <= m; ++i)
        E[i][0] = i;
    for(int j = 0; j <= n; ++j)
        E[0][j] = j;
    for(int i = 1; i <= m; ++i)
    {
        for(int j = 1; j <= n; ++j)
        {
            int a[3] = {E[i-1][j] + 1, E[i][j-1] + 1,
                        E[i-1][j-1]+(word1[i] != word2[j])};
            E[i][j] = *min_element(a, a+3);
        }
    }
    return E[m][n];
}