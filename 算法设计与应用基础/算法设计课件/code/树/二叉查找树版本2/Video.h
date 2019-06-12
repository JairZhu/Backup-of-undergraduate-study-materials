#ifndef VIDEO_CLASS
#define VIDEO_CLASS

#include <iostream>
#include <string>

using namespace std;

class Video
{
public:
	// 构造函数。初始化filmTitle和numCopies
	Video(const string& film = "", int copies = 1):
		filmTitle(film), numCopies(copies)
	{}

	// 副本数目加n。注意：如果n是负数，则就是减去
	void updateCopies(int n)
	{
		numCopies += n;
	}
	
	// 返回影片副本数目
	int getCopies()
	{
		return numCopies;
	}
	
	// 如果两Video对象有相同title，则它们相等
	friend bool operator== (const Video& lhs, const Video& rhs)
	{
		return lhs.filmTitle == rhs.filmTitle;
	}

	// 以filmTitle为关键码比较Video对象
	friend bool operator< (const Video& lhs, const Video& rhs)
	{
		return lhs.filmTitle < rhs.filmTitle;
	}

	// 输出Video对象
	friend ostream& operator<< (ostream& ostr, const Video& obj)
	{ 
		ostr << obj.filmTitle << " (" << obj.numCopies << ")" ;
		return ostr;
	}
private:
	// 影片标题
	string filmTitle;
	// 副本数目(>= 0)
	int numCopies;
};

#endif	// VIDEO_CLASS
