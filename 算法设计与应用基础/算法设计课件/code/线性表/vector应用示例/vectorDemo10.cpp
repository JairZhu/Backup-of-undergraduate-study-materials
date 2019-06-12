/* 用泛型算法count()和count_if()计数示例 */

#include <vector>
#include <iostream>
#include <algorithm>
#include <string>

using namespace std;

class IsFull 
{
public:
    bool operator() (int & score) 
    {
        return score==100;
    }       
};

int main (void) 
{
  vector <int> Scores;
  
  //构造成绩单
  Scores.push_back(67);  Scores.push_back(89);
  Scores.push_back(100); Scores.push_back(86);
  Scores.push_back(56);  Scores.push_back(100);
  Scores.push_back(99);  Scores.push_back(74);

  int NFullScoresV;     
  NFullScoresV = count (Scores.begin(), Scores.end(), 100);
  cout<<"用count()计数："<<endl;
  cout << "There were " << NFullScoresV << " fullscores!" << endl;

  int NFullScoresF;     
  NFullScoresF = count_if (Scores.begin(), Scores.end(), IsFull());
  cout<<"用count_if()计数："<<endl;
  cout << "There were " << NFullScoresF << " fullscores!" << endl;
  
  system("pause");
  return 0;
}
