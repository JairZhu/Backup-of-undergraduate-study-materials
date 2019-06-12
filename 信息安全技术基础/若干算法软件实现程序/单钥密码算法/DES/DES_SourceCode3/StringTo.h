//CString to other 
long StrToLng(CString String)
{
	long temp;
	char* tempChar=NULL;
	char* ptrChar;
	int Stringlen;
	Stringlen=String.GetLength();
	tempChar=
		(TCHAR*)malloc(Stringlen*sizeof(TCHAR));
	ptrChar=tempChar;
	for(int i=0;i<Stringlen;i++,++ptrChar)
		*ptrChar=String[i];
	*ptrChar='\0';
	temp=atol(tempChar);
	return temp;
}
