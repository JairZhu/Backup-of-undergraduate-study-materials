////////////////////////////////////////////////////////////////////////
//
// FileName : function.cpp
// Creator  : wdx
// Date     : 2010-04-15 
// Comment  : for game tetris
//
////////////////////////////////////////////////////////////////////////

#include "main.h"

int speed,difficulty,score=0,level=0,block_pre;		//block_pre代表的是三维数组里面7的那一维
int speedlevel;											//右移的限制
int x,y,p,q,m,n;									//p表示的是即时的x坐标，q为即时的y坐标
int static gamespace[23][13];						//m,n是在7个图形数组里的坐标
int static part[37][4][4]=							//x,y是gamespace中的坐标
{
	{{1,1,1,1},{0,0,0,0},{0,0,0,0},{0,0,0,0}},		//长条形横1
	{{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}},		//长条形竖1
	{{1,1,1,1},{0,0,0,0},{0,0,0,0},{0,0,0,0}},		//长条形横2
	{{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}},		//长条形竖2
	{{1,1,1,0},{1,0,0,0},{0,0,0,0},{0,0,0,0}},		//正L形1
	{{1,1,0,0},{0,1,0,0},{0,1,0,0},{0,0,0,0}},		//正L形2
	{{0,0,1,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},		//正L形3
	{{1,0,0,0},{1,0,0,0},{1,1,0,0},{0,0,0,0}},		//正L形4
	{{1,1,1,0},{0,0,1,0},{0,0,0,0},{0,0,0,0}},		//反L形1
	{{0,1,0,0},{0,1,0,0},{1,1,0,0},{0,0,0,0}},		//反L形2
	{{1,0,0,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},		//反L形3
	{{1,1,0,0},{1,0,0,0},{1,0,0,0},{0,0,0,0}},		//反L形4
	{{1,1,1,0},{0,1,0,0},{0,0,0,0},{0,0,0,0}},		//T形1
	{{0,1,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}},		//T形2
	{{0,1,0,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},		//T形3
	{{1,0,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}},		//T形4		
	{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},		//正方形1
	{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},		//正方形2
	{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},		//正方形3
	{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},		//正方形4
	{{1,1,0,0},{0,1,1,0},{0,0,0,0},{0,0,0,0}},		//正Z形1
	{{0,1,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}},		//正Z形2
	{{1,1,0,0},{0,1,1,0},{0,0,0,0},{0,0,0,0}},		//正Z形3
	{{0,1,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}},		//正Z形4
	{{0,1,1,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},		//反Z形1
	{{1,0,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}},		//反Z形2
	{{0,1,1,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},		//反Z形3
	{{1,0,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}},		//反Z形4
};


void Tetris(){
	system("cls");
	int i,j,k;
	char c;
	
	for(i=0;i<20;i++) 
		for(j=1;j<=11;j++) 
			gamespace[i][j]=0;
		for(j=0;j<=12;j++)
		{gamespace[20][j]=2;gamespace[21][j]=2;}
		for(i=0;i<22;i++)
			gamespace[i][0]=2;
		for(i=0;i<22;i++)
			gamespace[i][12]=2;
		p=0;q=0;
		Block_Random();
		Welcome();
		Select();
		Display();
		while(1) 
		{
			for(k=0;k<20;k++) 
			{ 
				if(kbhit()) 
				{
					c=getch(); 
					switch(c)
					{
					case 'A':
					case 'a':Left();break; 
					case 'D':
					case 'd':Right();break;
					case 'W':
					case 'w':Clean_Block();Change_Block();Display();break; 
					case 'S':
					case 's':Down();break;
					case 'P':
					case 'p':Pause();break; 
					case 'Q':
					case 'q':{GotoXY(1,25);printf("Game Over"); 
						GotoXY(1,26);printf("Press any key to ESC..."); 
						c=getch(); exit(1);};break; 
					}	
				} 
				Sleep(speed);
			} 
			Down(); 
		} 
}

void Welcome()
{
	printf("◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥\n"); 
	printf("◥◥◥◥◥◥◥◥◥◥◥◥ WDX 小土刀 VERSION V1.0◥◥◥◥◥◥◥◥◥◥◥◥◥◥\n"); 
	printf("◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥\n"); 
	printf("■■■■■■■◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥■■■◥◥◥◥◥◥◥◥◥\n"); 
	printf("■■■■■■■◥◥◥◥◥◥◥◥■■■◥◥◥◥◥◥◥◥■■■◥◥◥◥◥◥◥◥◥\n"); 
	printf("◥◥■■■◥◥◥◥◥◥◥◥◥◥■■■◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥\n"); 
	printf("◥◥■■■◥◥◥■■■■■◥◥■■■■◥■■■◥■◥■■■◥◥■■■■■◥◥\n"); 
	printf("◥◥■■■◥◥■■■■■■■◥■■■■◥■■■■■◥■■■◥■■■■■■■◥\n"); 
	printf("◥◥■■■◥◥■■■◥■■■◥■■■◥◥■■■■■◥■■■◥■■■◥■■■◥\n"); 
	printf("◥◥■■■◥◥■■■■■■■◥■■■◥◥■■■◥◥◥■■■◥■■■◥◥◥◥◥\n"); 
	printf("◥◥■■■◥◥■■■■■■■◥■■■◥◥■■■◥◥◥■■■◥◥■■■■◥◥◥\n"); 
	printf("◥◥■■■◥◥■■■◥◥◥◥◥■■■◥◥■■■◥◥◥■■■◥◥◥■■■■■◥\n"); 
	printf("◥◥■■■◥◥■■■◥■■■◥■■■◥◥■■■◥◥◥■■■◥◥◥◥◥■■■◥\n"); 
	printf("◥◥■■■◥◥■■■◥■■■◥■■■◥◥■■■◥◥◥■■■◥■■■◥■■■◥\n"); 
	printf("◥◥■■■◥◥■■■■■■■◥■■■■◥■■■◥◥◥■■■◥■■■■■■■◥\n"); 
	printf("◥◥■■■◥◥◥■■■■■◥◥■■■■◥■■■◥◥◥■■■◥◥■■■■■◥◥\n"); 
	printf("◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥\n"); 
	printf("◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥\n"); 
	printf("◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥◥\n"); 
	printf("				【俄罗斯方块】V1.0 by wdx\n"); 
	printf("	  **旋转:【W】 下落:【S】 左移:【A】 右移:【D】**\n");
	printf("	  **暂停:【P】 退出:【Q】**\n");
	printf("	  **平均每提高20分 速度会加快一点喔!**\n"); 
	system("pause"); //打断一下程序运行
	system("cls"); //清屏
}

void Select()
{
	printf("请输入方块下落的速度(1~5)\n");
	scanf("%d",&speedlevel);
	speed=30-speedlevel*5;
	printf("你所选择的速度为%d\n",speedlevel);
	system("pause");
	system("cls");//清屏
}

void Left()
{
	for(y=q+3;y>=q;y--)
		for(x=p+5;x<=p+8;x++)
			if(gamespace[y][x-1]==2&&gamespace[y][x]==1)
				return;
	Clean_Block(); 
	p--; 
	Fill_Block(); 
	Display(); 
}

void Right()
{	
	for(y=q+3;y>=q;y--)
		for(x=p+8;x>=p+5;x--)
			if(gamespace[y][x]==1&&gamespace[y][x+1]==2)
				return;
	Clean_Block(); 
	p++; 
	Fill_Block(); 
	Display(); 
}

void Down()
{
	Clean_Block();
	q++;
	Display();
	Check_Block();
}

void Display()
{
	int i,j;  
	Fill_Block();
	GotoXY(1,1); 
	for(i=0;i<=20;i++) 
	{ 
		for(j=0;j<=12;j++) 
		{
			switch(gamespace[i][j]) 
			{
			case 0:printf("  ");break; 
			case 1:printf("□");break; 
			case 2:printf("■");break;
			}
		} 
		printf("\n");
	} 
	GotoXY(1,23);
	printf("SCORE:%d",score); 
	GotoXY(1,24);
	printf("LEVEL=%d",score/20); 
}

void GotoXY(int x, int y)
{  
	COORD c;  
	c.X = x-1;  
	c.Y = y-1;  
	SetConsoleCursorPosition (GetStdHandle(STD_OUTPUT_HANDLE), c);  
}  

void Block_Random() 
{ 
	int k;
	srand((unsigned)time(NULL));  
	k=rand()%29; 
	block_pre=k;		/*block_pre为全局变量，作为生成方块的标志，以便其他函数调用*/ 
}

void Fill_Block(void)
{
	for (y=q+3,n=3;y>=q;y--,n--)
		for (x=p+8,m=3;x>=p+5;x--,m--)
			if(gamespace[y][x]!=2)
				gamespace[y][x]=part[block_pre][n][m];
}

void Clean_Block(void)
{
	for (y=q+3;y>=q;y--)
		for (x=p+8;x>=p+5;x--)
			if(gamespace[y][x]==1)
				gamespace[y][x]=0;
}

void Change_Block(void)
{
	Clean_Block(); 
	switch(block_pre)
	{
	case 0:block_pre=1;break;
	case 1:{if(p+5<=8) block_pre=2;
			   else break;}break;
	case 2:block_pre=3;break;
	case 3:{if(p+5<=8) block_pre=0;
			   else break;}break;
	//**************************//
	case 4:block_pre=5;break;
	case 5:{if(p+5<=9) block_pre=6;
			   else break;}break;
	case 6:block_pre=7;break;
	case 7:{if(p+5<=9) block_pre=4;
			   else break;}break;
		//
	case 8:block_pre=9;break;
	case 9:{if(p+5<=9) block_pre=10;
			   else break;}break;
	case 10:block_pre=11;break;
	case 11:{if(p+5<=9) block_pre=8;
			   else break;}break;
		//
	case 12:block_pre=13;break;
	case 13:{if(p+5<=9) block_pre=14;
			   else break;}break;
	case 14:block_pre=15;break;
	case 15:{if(p+5<=9) block_pre=12;
			   else break;}break;
		//
	case 16:block_pre=17;break;
	case 17:block_pre=18;break;
	case 18:block_pre=19;break;
	case 19:block_pre=16;break;
		//
	case 20:block_pre=21;break;
	case 21:{if(p+5<=9) block_pre=22;
			   else break;}break;
	case 22:block_pre=23;break;
	case 23:{if(p+5<=9) block_pre=20;
			   else break;}break;
		//
	case 24:block_pre=25;break;
	case 25:{if(p+5<=9) block_pre=26;
			   else break;}break;
	case 26:block_pre=27;break;
	case 27:{if(p+5<=9) block_pre=24;
			   else break;}break;
	case 28:block_pre=28;break;
	case 29:block_pre=29;break;
	case 30:block_pre=30;break;
	case 31:block_pre=31;break;
		//
	case 32:block_pre=33;break;
	case 33:{if(p+5<=9) block_pre=34;
		else break;}break;
	case 34:block_pre=35;break;
	case 35:{if(p+5<=9) block_pre=32;
			   else break;}break;
	case 36:block_pre=36;break;
	}
	Fill_Block(); 
	Display();
}

void Pause(void) 
{
	char c; 
	GotoXY(1,23);
	printf("Pause! "); 
	do 
	{c=getch();} 
	while(c!='p'&&c!='P'); 
}

void Check_Block()
{
	int x,y,k,flag=0; 
	char c; 
	Display(); 
	for(x=1;x<=11;x++) 
		if(gamespace[0][x]==2&&gamespace[1][x]==2) End(); 
	for(y=q+3;y>=q;y--)
		for(x=p+8;x>=p+5;x--)
			if(gamespace[y][x]==1&&gamespace[y+1][x]==2)
			{flag=1;break;}			
    if(flag==1)
	{
		for(y=q+3;y>=q;y--)
			for(x=p+8;x>=p+5;x--)
				if(gamespace[y][x]==1)	
					gamespace[y][x]=2;
		Check_Line();
		Block_Random();
		p=0;q=0;
		Fill_Block();
		Check_Block();
		Display();	
	}	
	if(flag!=1) 
	{
		for(k=0;k<25;k++) 
		{ 
			if(kbhit()) 
			{
				c=getch(); 
				switch(c)
				{
				case 'a':Left();break; 
				case 'd':Right();break;
				case 'w':Clean_Block();Change_Block();Display();break; 
				case 's':Down();break;
				case 'P':
				case 'p':Pause();break; 
				case 'Q':
				case 'q':{
					GotoXY(1,25);
					printf("Game Over"); 
					GotoXY(1,26);
					printf("Press any key to ESC..."); 
					c=getch(); 
					welcomeScreen1();
						 };break; 
				}
			} 
			Sleep(speed);
		} 
		Down();
	}

}

void End()
{
	char c=0; 
	GotoXY(1,23);printf("SCORE:%d",score); 
	GotoXY(1,24);printf("LEVEL=%d",score/20); 
	GotoXY(1,25);printf("Game Over"); 
	GotoXY(1,26);printf("Press Q to ESC..."); 
	do 
	{
		c=getch();
	} 
	while(c!='q'&&c!='Q'); 
		welcomeScreen1(); 
}

void Check_Line()
{
	int i,j,s=0,t=0; 
	for(i=0;i<20;i++) 
	{
		s=0; 
		for(j=1;j<=11;j++) 
			s+=gamespace[i][j]; 
		if (s==22) {s=0;Clean_Line(i);t++;} 
	} 
	switch (t) 
	{
	case 1:score++;break; 
	case 2:score+=4;break; 
	case 3:score+=8;break; 
	case 4:score+=16;break; 
	} 
	switch(score/20) 
	{
	case 0:speed=30-speedlevel*5;break; 
	case 1:speed=25-speedlevel*5;break; 
	case 2:speed=20-speedlevel*5;break; 
	case 3:speed=15-speedlevel*5;break; 
	case 4:speed=10-speedlevel*5;break; 
	case 5:speed=5-speedlevel*5;break; 
	}
	if(speed<=5) speed=5;
}

void Clean_Line(int l)
{
	int i,j; 
	for(i=l-1;i>=0;i--) 
		for(j=1;j<=11;j++) 
			gamespace[i+1][j]=gamespace[i][j]; 
		for(j=1;j<=11;j++) 
		gamespace[0][j]=0; 
}
