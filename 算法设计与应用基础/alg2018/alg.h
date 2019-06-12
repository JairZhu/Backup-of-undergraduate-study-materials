//
// Created by 李新锐 on 05/07/2018.
//

#ifndef ALG2018_ALG_H
#define ALG2018_ALG_H

#include <vector>
#include <utility>
#include <algorithm>
#include <cmath>
#include <deque>
#include <map>
#include <set>
#include <iostream>
#include <queue>
#include <stack>
#include <array>
#include <numeric>
using namespace std;

#include "fmt/format.h"
using namespace fmt;

inline
vector<int> randv(int size = 100, int max = 1000)
{
    srand(time(0));
    vector<int> v(size);
    generate(v.begin(), v.end(), [max](){return rand() % max;});
    return v;
}
#endif //ALG2018_ALG_H
