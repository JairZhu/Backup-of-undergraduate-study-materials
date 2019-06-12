/*
poj 2001
*/
#include <stdio.h>
#include <string.h>

#define N 200000
#define TK 26

int trie[N+1][TK+1];
char words[1030][30], ans[1030][30];
int top;

void insert(char* word)
{
	int i;
	for (i=0; *word; i=trie[i][*word-'a'],word++)
	{
		trie[i][TK] ++;
		if (trie[i][*word-'a'] == 0)
		{
			trie[i][*word-'a'] = top;
			memset(trie[top], 0, sizeof(trie[top]));
			top ++;
		}
	}
	trie[i][TK] ++;
}

int main()
{
	int t, i, j, k;
//	freopen("T2001.in", "r", stdin);
	memset(trie[0], 0, sizeof(trie[0]));
	top = 1;
	t = 0;
	while (scanf("%s", words[t]) != EOF)
	{
		insert(words[t]);
		t ++;
	}
	for (i=0; i<t; i++)
	{
		for (j=0,k=0; trie[k][TK]>1 && words[i][j]!=0; k=trie[k][words[i][j]-'a'],j++) ans[i][j] = words[i][j];
		ans[i][j+1] = 0;
		printf("%s %s\n", words[i], ans[i]);
	}
//	fclose(stdin);
	return 0;
}
