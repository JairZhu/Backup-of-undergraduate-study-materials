//warpdll.cpp
//Update:2001.8.19
//#include <windows.h>
#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdisp.h>        // MFC Automation classes
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#include <process.h>
#include <stdlib.h>
#include <time.h>
#include "warpdll.h"
#include "des.h"	

#define DllVersion 0x20002

#define Info0 0x420a54e2
#define Info1 0x1e5e8765
#define Info2 0x0b548de4
#define Info3 0x81ad578e
#define Info4 0x13e69d5d
#define Info5 0x481e250a
#define Info6 0xf4d8fa3c

#define TempFileName "temp0215.tmp"
#define BufferGroup 1024

BOOL WINAPI DllEntryPoint(HINSTANCE hDLL,DWORD dwReason,LPVOID Reserved)
{
	switch(dwReason)
	{
		case DLL_PROCESS_ATTACH:
        // Perform any DLL initialization here
        break;

		case DLL_PROCESS_DETACH:
        // Perform any DLL cleanup here
		break;

    }
	return TRUE;
}

EXPORTDLL long CALLBACK Encrypt(PPARAMS pparams)
{
	_beginthread(Enc_Thread,0,pparams);
	return pparams->statue;
}

EXPORTDLL long CALLBACK Decrypt(PPARAMS pparams)
{
	_beginthread(Dec_Thread,0,pparams);
	return pparams->statue;
}

EXPORTDLL long CALLBACK DES_ENC(DWORD* LData,DWORD* RData,
								DWORD* LKey,DWORD* RKey)
{
	desenc(*LData,*RData,*LKey,*RKey);
	return 0;
}

EXPORTDLL long CALLBACK DES_DEC(DWORD* LData,DWORD* RData,
								DWORD* LKey,DWORD* RKey)
{
	desdec(*LData,*RData,*LKey,*RKey);
	return 0;
}

void InitKeys(CString& KeyString,DWORD* key)
{
	int counter[8]={0,0,0,0,0,0,0,0};
	int max[8]={3,4,3,4,3,4,2,4};
	int i;
	for(i=0;i<KeyString.GetLength();i++)
	{
		if(counter[i&7]<max[i&7])
		{
			key[i&7]|=KeyString[i];
			counter[i&7]++;
			key[i&7]<<=8;
		}
	}
	for(i=0;i<6;i++)
	{
		key[i]>>=4;
		key[i]|=key[i+1]>>28;
		key[++i]>>=4;
	}
	key[6]>>=8;
	key[7]>>=8;
}

#define enc(LData,RData,cmpkey1,cmpkey2,cmpkey3) \
	fast_desenc(LData,RData,cmpkey1);\
	fast_desdec(LData,RData,cmpkey2);\
	fast_desenc(LData,RData,cmpkey3);\

#define dec(LData,RData,cmpkey1,cmpkey2,cmpkey3) \
	fast_desdec(LData,RData,cmpkey3);\
	fast_desenc(LData,RData,cmpkey2);\
	fast_desdec(LData,RData,cmpkey1);\

void __cdecl Enc_Thread(PVOID pvoid)
{
	PPARAMS pparams;
	FILEHEAD filehead;
	DWORD key[8]={0,0,0,0,0,0,0,0};
	CFile SourceFile,TargetFile;
	DWORD FBReg1,FBReg2;
	DWORD buffer[BufferGroup];
	DWORD lFilelength;
	DWORD BufferSize=sizeof(buffer);
	DWORD i,j,Blocks,Tail,TailGroup;
	CString szSourceFile;
	_int64 cmpkey1[16];
	_int64 cmpkey2[16];
	_int64 cmpkey3[16];

	pparams=(PPARAMS)pvoid;
	if(pparams->szFilename.IsEmpty())
	{
		pparams->statue=S_FILE_NAME_EMPTY;
		pparams->iCompletePercent=100;
		_endthread();
	}
	szSourceFile=pparams->szFilename;
	if(!SourceFile.Open(szSourceFile,
		CFile::modeReadWrite|CFile::shareDenyRead|
		CFile::shareDenyWrite,NULL))
	{
		pparams->statue=S_FILE_OPEN_ERROR;
		pparams->iCompletePercent=100;
		_endthread();
	}
	lFilelength=SourceFile.GetLength();
	Tail=lFilelength&(BufferSize-1);
	Blocks=lFilelength/BufferSize;
	if(!TargetFile.Open(TEXT(TempFileName),
		CFile::modeCreate|CFile::modeWrite|
		CFile::shareDenyRead|CFile::shareDenyWrite,NULL))
	{
		SourceFile.Close();
		pparams->statue=S_FILE_OPEN_ERROR;
		pparams->iCompletePercent=100;
		_endthread();
	}
	InitKeys(pparams->Key,key);
	if(isweakkey(key[0],key[1])||isweakkey(key[2],key[3])
		||isweakkey(key[4],key[5]))
	{
		SourceFile.Close();
		TargetFile.Close();
		TargetFile.Remove(TempFileName);
		pparams->statue=S_WEAK_KEY;
		pparams->iCompletePercent=100;
		_endthread();
	}
	rebuild_s_box(key[6],key[7]);
	init_enc_cmpkeys(key[0],key[1],cmpkey1);
	init_dec_cmpkeys(key[2],key[3],cmpkey2);
	init_enc_cmpkeys(key[4],key[5],cmpkey3);
	//Init filehead.
	time_t t;
	srand((unsigned)time(&t));
	filehead.Version=DllVersion;
	filehead.IV1=rand();
	filehead.IV2=rand();
	filehead.CheckInfo[0]=Info0;
	filehead.CheckInfo[1]=Info1;
	filehead.CheckInfo[2]=Info2;
	filehead.CheckInfo[3]=Info3;
	filehead.CheckInfo[4]=Info4;
	filehead.CheckInfo[5]=Info5;
	filehead.CheckInfo[6]=Info6;
	filehead.Tail=Tail;

	filehead.CheckInfo[0]^=filehead.IV1;
	filehead.CheckInfo[1]^=filehead.IV2;
	enc(filehead.CheckInfo[0],filehead.CheckInfo[1],
		cmpkey1,cmpkey2,cmpkey3);
	filehead.CheckInfo[2]^=filehead.CheckInfo[0];
	filehead.CheckInfo[3]^=filehead.CheckInfo[1];
	enc(filehead.CheckInfo[2],filehead.CheckInfo[3],
		cmpkey1,cmpkey2,cmpkey3);
	filehead.CheckInfo[4]^=filehead.CheckInfo[2];
	filehead.CheckInfo[5]^=filehead.CheckInfo[3];
	enc(filehead.CheckInfo[4],filehead.CheckInfo[5],
		cmpkey1,cmpkey2,cmpkey3);
	filehead.CheckInfo[6]^=filehead.CheckInfo[4];
	filehead.Tail^=filehead.CheckInfo[5];
	enc(filehead.CheckInfo[6],filehead.Tail,
		cmpkey1,cmpkey2,cmpkey3);
	TargetFile.Write(&filehead,sizeof(filehead));
	//
	FBReg1=filehead.CheckInfo[6];
	FBReg2=filehead.Tail;
	for(j=0;j<Blocks;j++)
	{
		SourceFile.Read(buffer,BufferSize);
		buffer[0]^=FBReg1;
		buffer[1]^=FBReg2;
		enc(buffer[0],buffer[1],cmpkey1,cmpkey2,cmpkey3);
		for(i=2;i<BufferGroup;++i,++i)
		{
			buffer[i]^=buffer[i-2];
			buffer[i+1]^=buffer[i-1];
			enc(buffer[i],buffer[i+1],cmpkey1,cmpkey2,
				cmpkey3);
		}
		FBReg1=buffer[i-2];
		FBReg2=buffer[i-1];
		TargetFile.Write(buffer,BufferSize);
		if(pparams->bHalt)
		{
			for(i=0;i<16;i++)
			{
				cmpkey1[i]=0;
				cmpkey2[i]=0;
				cmpkey3[i]=0;
			}
			reset_s_box();
			SourceFile.Close();
			TargetFile.Close();
			TargetFile.Remove(TEXT(TempFileName));
			pparams->iCompletePercent=100;
			_endthread();
		}
		pparams->iCompletePercent=j*100/Blocks;
	}
	//Tail
	if(Tail!=0)
	{
		SourceFile.Read(buffer,BufferSize);
		buffer[0]^=FBReg1;
		buffer[1]^=FBReg2;
		enc(buffer[0],buffer[1],cmpkey1,cmpkey2,cmpkey3);
		TailGroup=((Tail>>3)+1)<<1;
		for(i=2;i<TailGroup;++i,++i)
		{
			buffer[i]^=buffer[i-2];
			buffer[i+1]^=buffer[i-1];
			enc(buffer[i],buffer[i+1],cmpkey1,cmpkey2,
				cmpkey3);
		}
		TargetFile.Write(buffer,TailGroup<<2);
	}
	//Destory SourceFile
	for(j=0;j<BufferGroup;j++)
		buffer[j]=0;
	for(j=0;j<Blocks;j++)
		SourceFile.Write(buffer,BufferSize);
	if(Tail!=0)
		SourceFile.Write(buffer,Tail);
	//
	for(i=0;i<16;i++)
	{
		cmpkey1[i]=0;
		cmpkey2[i]=0;
		cmpkey3[i]=0;
	}
	reset_s_box();
	SourceFile.Close();
	TargetFile.Close();
	SourceFile.Remove(szSourceFile);
	TargetFile.Rename(TempFileName,szSourceFile);
	pparams->statue=S_ALL_RIGHT;
	pparams->iCompletePercent=100;
	_endthread();
}

void __cdecl Dec_Thread(PVOID pvoid)
{
	PPARAMS pparams;
	FILEHEAD filehead;
	DWORD key[8]={0,0,0,0,0,0,0,0};
	CFile SourceFile,TargetFile;
	DWORD FBReg1,FBReg2,FBReg3,FBReg4;
	DWORD buffer[BufferGroup];
	DWORD lFilelength;
	DWORD BufferSize=sizeof(buffer);
	DWORD i,j,Blocks,Tail,TailGroup;
	CString szSourceFile;
	_int64 cmpkey1[16];
	_int64 cmpkey2[16];
	_int64 cmpkey3[16];

	pparams=(PPARAMS)pvoid;
	if(pparams->szFilename.IsEmpty())
	{
		pparams->statue=S_FILE_NAME_EMPTY;
		pparams->iCompletePercent=100;
		_endthread();
	}
	szSourceFile=pparams->szFilename;
	if(!SourceFile.Open(szSourceFile,
		CFile::modeReadWrite|CFile::shareDenyRead|
		CFile::shareDenyWrite,NULL))
	{
		pparams->statue=S_FILE_OPEN_ERROR;
		pparams->iCompletePercent=100;
		_endthread();
	}
	lFilelength=SourceFile.GetLength()-sizeof(filehead);
	if(lFilelength<0)
	{
		pparams->statue=S_FILE_CORRUPTED;
		pparams->iCompletePercent=100;
		_endthread();
	}
	if(!TargetFile.Open(TEXT(TempFileName),
		CFile::modeCreate|CFile::modeWrite|
		CFile::shareDenyRead|CFile::shareDenyWrite,NULL))
	{
		SourceFile.Close();
		pparams->statue=S_FILE_OPEN_ERROR;
		pparams->iCompletePercent=100;
		_endthread();
	}
	InitKeys(pparams->Key,key);
	rebuild_s_box(key[6],key[7]);
	init_dec_cmpkeys(key[0],key[1],cmpkey1);
	init_enc_cmpkeys(key[2],key[3],cmpkey2);
	init_dec_cmpkeys(key[4],key[5],cmpkey3);
	//Verify filehead.
	SourceFile.Read(&filehead,sizeof(filehead));
	if((filehead.Version)&0xffff0000!=DllVersion&0xffff0000)
	{
		for(i=0;i<16;i++)
		{
			cmpkey1[i]=0;
			cmpkey2[i]=0;
			cmpkey3[i]=0;
		}
		reset_s_box();
		SourceFile.Close();
		TargetFile.Close();
		TargetFile.Remove(TEXT(TempFileName));
		pparams->statue=S_VERSION_NOT_MATCH;
		pparams->iCompletePercent=100;
		_endthread();
	}
	FBReg1=filehead.CheckInfo[0];
	FBReg2=filehead.CheckInfo[1];
	dec(filehead.CheckInfo[0],filehead.CheckInfo[1],
		cmpkey1,cmpkey2,cmpkey3);
	filehead.CheckInfo[0]^=filehead.IV1;
	filehead.CheckInfo[1]^=filehead.IV2;
	FBReg3=filehead.CheckInfo[2];
	FBReg4=filehead.CheckInfo[3];
	dec(filehead.CheckInfo[2],filehead.CheckInfo[3],
		cmpkey1,cmpkey2,cmpkey3);
	filehead.CheckInfo[2]^=FBReg1;
	filehead.CheckInfo[3]^=FBReg2;
	FBReg1=FBReg3;
	FBReg2=FBReg4;
	FBReg3=filehead.CheckInfo[4];
	FBReg4=filehead.CheckInfo[5];
	dec(filehead.CheckInfo[4],filehead.CheckInfo[5],
		cmpkey1,cmpkey2,cmpkey3);
	filehead.CheckInfo[4]^=FBReg1;
	filehead.CheckInfo[5]^=FBReg2;
	FBReg1=FBReg3;
	FBReg2=FBReg4;
	FBReg3=filehead.CheckInfo[6];
	FBReg4=filehead.Tail;

	dec(filehead.CheckInfo[6],filehead.Tail,
		cmpkey1,cmpkey2,cmpkey3);
	filehead.CheckInfo[6]^=FBReg1;
	filehead.Tail^=FBReg2;
	if(filehead.CheckInfo[0]!=Info0||
		filehead.CheckInfo[1]!=Info1||
		filehead.CheckInfo[2]!=Info2||
		filehead.CheckInfo[3]!=Info3||
		filehead.CheckInfo[4]!=Info4||
		filehead.CheckInfo[5]!=Info5||
		filehead.CheckInfo[6]!=Info6)
	{
		for(i=0;i<16;i++)
		{
			cmpkey1[i]=0;
			cmpkey2[i]=0;
			cmpkey3[i]=0;
		}
		reset_s_box();
		SourceFile.Close();
		TargetFile.Close();
		TargetFile.Remove(TEXT(TempFileName));
		pparams->statue=S_KEY_INCURRECT;
		pparams->iCompletePercent=100;
		_endthread();
	}
	Tail=filehead.Tail;
	Blocks=lFilelength/BufferSize;
	//
	FBReg1=FBReg3;
	FBReg2=FBReg4;
	for(j=0;j<Blocks;j++)
	{
		SourceFile.Read(buffer,BufferSize);
		FBReg3=buffer[0];
		FBReg4=buffer[1];
		dec(buffer[0],buffer[1],cmpkey1,cmpkey2,cmpkey3);
		buffer[0]^=FBReg1;
		buffer[1]^=FBReg2;
		FBReg1=FBReg3;
		FBReg2=FBReg4;
		for(i=2;i<BufferGroup;++i,++i)
		{
			FBReg3=buffer[i];
			FBReg4=buffer[i+1];
			dec(buffer[i],buffer[i+1],cmpkey1,cmpkey2,
				cmpkey3);
			buffer[i]^=FBReg1;
			buffer[i+1]^=FBReg2;
			FBReg1=FBReg3;
			FBReg2=FBReg4;
		}
		TargetFile.Write(buffer,BufferSize);
		if(pparams->bHalt)
		{
			for(i=0;i<16;i++)
			{
				cmpkey1[i]=0;
				cmpkey2[i]=0;
				cmpkey3[i]=0;
			}
			reset_s_box();
			SourceFile.Close();
			TargetFile.Close();
			TargetFile.Remove(TEXT(TempFileName));
			pparams->iCompletePercent=100;
			_endthread();
		}
		pparams->iCompletePercent=j*100/Blocks;
	}
	if(Tail!=0)
	{
		SourceFile.Read(buffer,BufferSize);
		FBReg3=buffer[0];
		FBReg4=buffer[1];
		dec(buffer[0],buffer[1],cmpkey1,cmpkey2,cmpkey3);
		buffer[0]^=FBReg1;
		buffer[1]^=FBReg2;
		FBReg1=FBReg3;
		FBReg2=FBReg4;
		TailGroup=((Tail>>3)+1)<<1;
		for(i=2;i<TailGroup;++i,++i)
		{
			FBReg3=buffer[i];
			FBReg4=buffer[i+1];
			dec(buffer[i],buffer[i+1],cmpkey1,cmpkey2,
				cmpkey3);
			buffer[i]^=FBReg1;
			buffer[i+1]^=FBReg2;
			FBReg1=FBReg3;
			FBReg2=FBReg4;
		}
		TargetFile.Write(buffer,Tail);
	}
	//Destory SourceFile
	for(j=0;j<BufferGroup;j++)
		buffer[j]=0;
	for(j=0;j<Blocks;j++)
		SourceFile.Write(buffer,BufferSize);
	if(Tail!=0)
		SourceFile.Write(buffer,BufferSize);
	//
	for(i=0;i<16;i++)
	{
		cmpkey1[i]=0;
		cmpkey2[i]=0;
		cmpkey3[i]=0;
	}
	reset_s_box();
	SourceFile.Close();
	TargetFile.Close();
	SourceFile.Remove(szSourceFile);
	TargetFile.Rename(TempFileName,szSourceFile);
	pparams->statue=S_ALL_RIGHT;
	pparams->iCompletePercent=100;
	_endthread();
}

EXPORTDLL long CALLBACK Version()
{
	return DllVersion;
}

EXPORTDLL long CALLBACK IsWeakKey(DWORD* LKey,DWORD* RKey)
{
	return isweakkey(*LKey,*RKey);
}

EXPORTDLL long CALLBACK Rebuild_S_Box(DWORD* LExKey,
									  DWORD* RExKey)
{
	rebuild_s_box(*LExKey,*RExKey);
	return 0;
}

EXPORTDLL long CALLBACK Reset_S_Box()
{
	reset_s_box();
	return 0;
}

EXPORTDLL long CALLBACK Init_ENC_Cmpkeys(DWORD* LKey,
										 DWORD* RKey,
										 _int64* Compressed_ENC_Key)
{
	init_enc_cmpkeys(*LKey,*RKey,Compressed_ENC_Key);
	return 0;
}

EXPORTDLL long CALLBACK Init_DEC_Cmpkeys(DWORD* LKey,
										 DWORD* RKey,
										 _int64* Compressed_DEC_Key)
{
	init_dec_cmpkeys(*LKey,*RKey,Compressed_DEC_Key);
	return 0;
}

EXPORTDLL long CALLBACK Fast_DES_ENC(DWORD* LData,DWORD* RData,
									 _int64* Compressed_ENC_Key)
{
	fast_desenc(*LData,*RData,Compressed_ENC_Key);
	return 0;
}
EXPORTDLL long CALLBACK Fast_DES_DEC(DWORD* LData,DWORD* RData,
									 _int64* Compressed_DEC_Key)
{
	fast_desdec(*LData,*RData,Compressed_DEC_Key);
	return 0;
}