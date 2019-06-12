/**********************************************************************
*Function: 常用函数构成工具包
*Author:   吴丹 00234015 3号
*Date:     2003/3/13
*Version:  V1.0
***********************************************************************/
#ifndef __mypackage
#define __mypackage

#include <iostream.h>
#include <limits.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>   // gets(),puts()
#include <stddef.h>
#include <fstream.h>
#include <ctype.h>
#include <time.h>
#include <string.h>


enum  Error_code {success,fail,range_error,underflow,overflow,fatal,
		  not_present,duplicate_eror,entry_inserted,entry_found,
		  internal_error};

bool users_says_yes();   //用于询问用户
int openInFile(ifstream&); // 用于打开输入文件
int openOutFile(ofstream&); // 用于打开输出文件
 
#endif