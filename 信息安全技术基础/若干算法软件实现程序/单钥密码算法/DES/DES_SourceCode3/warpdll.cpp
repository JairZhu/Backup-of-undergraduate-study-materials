//warpdll.cpp
//Update:2003.4.15
#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdisp.h>        // MFC Automation classes
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#include <process.h>
#include <stdlib.h>
#include <time.h>
#include "warpdll.h"
#include "des.h"
#include "lfsr.h"	

#define DllVersion 0x50002

#define Info0 0x420a54e2
#define Info1 0x1e5e8765
#define Info2 0x0b548de4
#define Info3 0x81ad578e
#define Info4 0x13e69d5d
#define Info5 0x481e250a
#define Info6 0xf4d8fa3c

#define Security1 20
#define Security2 22
#define Security3 19
#define Security4 53
#define Security5 16
#define Security6 12

#define BufferGroup 131072	//Must below 0x4fffffff

#define MAXTHREADNUMBER 20

CRITICAL_SECTION _WarpDllCS;
long _ThreadCounter = 0;
unsigned long S_Boxes[MAXTHREADNUMBER][512];
short S_Box_Status[MAXTHREADNUMBER] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
									   1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
unsigned char Subkey[MAXTHREADNUMBER][128];	//ScheduleKeys


BOOL WINAPI DllEntryPoint(HINSTANCE hDLL, DWORD dwReason, LPVOID Reserved)
{
	switch (dwReason)
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

EXPORTDLL unsigned long CALLBACK ThreadEncrypt(PWARPARAMS pparams)
{
	return _beginthread(Enc_Thread, 0, pparams);
}

EXPORTDLL unsigned long CALLBACK ThreadDecrypt(PWARPARAMS pparams)
{
	return _beginthread(Dec_Thread, 0, pparams);
}

EXPORTDLL void CALLBACK Encrypt(PWARPARAMS pparams)
{
	Enc_Thread(pparams);
	return;
}

EXPORTDLL void CALLBACK Decrypt(PWARPARAMS pparams)
{
	Dec_Thread(pparams);
	return;
}

EXPORTDLL void CALLBACK ENC(DWORD* LData, DWORD* RData, 
							DWORD* LKey, DWORD* RKey, unsigned long S_Box_Indentifer)
{
	desenc(*LData, *RData, *LKey, *RKey, S_Boxes[S_Box_Indentifer]);
	return;
}

EXPORTDLL void CALLBACK DEC(DWORD* LData, DWORD* RData, 
							DWORD* LKey, DWORD* RKey, unsigned long S_Box_Indentifer)
{
	desdec(*LData, *RData, *LKey, *RKey, S_Boxes[S_Box_Indentifer]);
	return;
}

void InitKeys(char* KeyString, DWORD* key)
{
	int counter[8]={0, 0, 0, 0, 0, 0, 0, 0};
	int max[8]={3, 4, 3, 4, 3, 4, 2, 4};
	int i;
	long KeyLength = strlen(KeyString);
	for (i = 0; i < KeyLength; i++)
	{
		if (counter[i & 7] < max[i & 7])
		{
			key[i & 7] |= KeyString[i];
			counter[i & 7]++;
			key[i & 7] <<= 8;
		}
	}
	for (i = 0; i < 6; i++)
	{
		key[i] >>= 4;
		key[i] |= key[i + 1] >> 28;
		key[++i] >>= 4;
	}
	key[6] >>= 8;
	key[7] >>= 8;
}

#define enc(LData, RData, cmpkey1, cmpkey2, cmpkey3) \
	fast_desenc(LData, RData, cmpkey1, S_Box);\
	fast_desdec(LData, RData, cmpkey2, S_Box);\
	fast_desenc(LData, RData, cmpkey3, S_Box);\

#define dec(LData, RData, cmpkey1, cmpkey2, cmpkey3) \
	fast_desdec(LData, RData, cmpkey3, S_Box);\
	fast_desenc(LData, RData, cmpkey2, S_Box);\
	fast_desdec(LData, RData, cmpkey1, S_Box);\

void __cdecl Enc_Thread(PVOID pvoid)
{
	PWARPARAMS pparams;
	FILEHEAD filehead;
	DWORD key[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	CFile SourceFile, TargetFile;
	DWORD FBReg1, FBReg2;
	DWORD buffer[BufferGroup];
	DWORD lFileLength;
	DWORD BufferSize = sizeof(buffer);
	DWORD i, j, Blocks, Tail, TailGroup;
	DWORD SecurityIV;
	CString szSourceFile;
	char szTempFileName[MAX_PATH];
	unsigned char cmpkey1[128];
	unsigned char cmpkey2[128];
	unsigned char cmpkey3[128];
	unsigned long S_Box[512];

	pparams = (PWARPARAMS)pvoid;
	if (strcmp(pparams->lpszFileName, "") == 0)
	{
		pparams->statue = S_FILE_NAME_EMPTY;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	szSourceFile = pparams->lpszFileName;
	if (!SourceFile.Open(szSourceFile, 
		CFile::modeReadWrite | CFile::shareDenyRead | 
		CFile::shareDenyWrite, NULL))
	{
		pparams->statue = S_FILE_OPEN_ERROR;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	lFileLength = SourceFile.GetLength();
	Tail = lFileLength % BufferSize;
	Blocks = lFileLength / BufferSize;
	if (!GetTempFileName(_T(".\\"), _T("wop"), 0, szTempFileName))
	{
		SourceFile.Close();
		pparams->statue = S_FILE_OPEN_ERROR;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	if (!TargetFile.Open(szTempFileName, 
		CFile::modeCreate | CFile::modeWrite | 
		CFile::shareDenyRead | CFile::shareDenyWrite, NULL))
	{
		SourceFile.Close();
		pparams->statue = S_FILE_OPEN_ERROR;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	InitKeys(pparams->lpszKeys, key);
	if (isweakkey(key[0], key[1]) || isweakkey(key[2], key[3])
		 || isweakkey(key[4], key[5]))
	{
		SourceFile.Close();
		TargetFile.Close();
		TargetFile.Remove(szTempFileName);
		pparams->statue = S_WEAK_KEY;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	init_s_box(key[6], key[7], S_Box);
	init_enc_cmpkeys(key[0], key[1], cmpkey1);
	init_dec_cmpkeys(key[2], key[3], cmpkey2);
	init_enc_cmpkeys(key[4], key[5], cmpkey3);
	//Init filehead.
	time_t t;
	srand((unsigned)time(&t));
	filehead.Version = DllVersion;
	filehead.IV1 = rand();
	filehead.IV2 = rand();
	SecurityIV = rand();
	filehead.CheckInfo[0] = Info0^SecurityIV;
	SecurityIV=lfsr(SecurityIV, Security1);
	filehead.CheckInfo[1] = Info1^SecurityIV;
	SecurityIV=lfsr(SecurityIV, Security2);
	filehead.CheckInfo[2] = Info2^SecurityIV;
	SecurityIV=lfsr(SecurityIV, Security3);
	filehead.CheckInfo[3] = Info3^SecurityIV;
	SecurityIV=lfsr(SecurityIV, Security4);
	filehead.CheckInfo[4] = Info4^SecurityIV;
	SecurityIV=lfsr(SecurityIV, Security5);
	filehead.CheckInfo[5] = Info5^SecurityIV;
	SecurityIV=lfsr(SecurityIV, Security6);
	filehead.CheckInfo[6] = Info6^SecurityIV;
	filehead.Tail=Tail;

	filehead.CheckInfo[0] ^= filehead.IV1;
	filehead.CheckInfo[1] ^= filehead.IV2;
	enc(filehead.CheckInfo[0], filehead.CheckInfo[1], 
		cmpkey1, cmpkey2, cmpkey3);
	filehead.CheckInfo[2] ^= filehead.CheckInfo[0];
	filehead.CheckInfo[3] ^= filehead.CheckInfo[1];
	enc(filehead.CheckInfo[2], filehead.CheckInfo[3], 
		cmpkey1, cmpkey2, cmpkey3);
	filehead.CheckInfo[4] ^= filehead.CheckInfo[2];
	filehead.CheckInfo[5] ^= filehead.CheckInfo[3];
	enc(filehead.CheckInfo[4], filehead.CheckInfo[5], 
		cmpkey1, cmpkey2, cmpkey3);
	filehead.CheckInfo[6] ^= filehead.CheckInfo[4];
	filehead.Tail ^= filehead.CheckInfo[5];
	enc(filehead.CheckInfo[6], filehead.Tail, 
		cmpkey1, cmpkey2, cmpkey3);
	TargetFile.Write(&filehead, sizeof(filehead));
	//
	FBReg1 = filehead.CheckInfo[6];
	FBReg2 = filehead.Tail;
	for (j = 0; j < Blocks; j++)
	{
		SourceFile.Read(buffer, BufferSize);
		buffer[0] ^= FBReg1;
		buffer[1] ^= FBReg2;
		enc(buffer[0], buffer[1], cmpkey1, cmpkey2, cmpkey3);
		for (i = 2; i < BufferGroup; ++i, ++i)
		{
			buffer[i] ^= buffer[i - 2];
			buffer[i + 1] ^= buffer[i - 1];
			enc(buffer[i], buffer[i + 1], cmpkey1, cmpkey2, 
				cmpkey3);
		}
		FBReg1 = buffer[i - 2];
		FBReg2 = buffer[i - 1];
		TargetFile.Write(buffer, BufferSize);
		if (pparams->bHalt)
		{
			for (i = 0; i < 128; i++)
			{
				cmpkey1[i] = 0;
				cmpkey2[i] = 0;
				cmpkey3[i] = 0;
			}
			reset_s_box(S_Box);
			SourceFile.Close();
			TargetFile.Close();
			TargetFile.Remove(szTempFileName);
			pparams->statue = S_CANCELED;
			pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
			return;
		}
		pparams->iCompleteProgress = j * 100 / Blocks;
	}
	//Tail
	if (Tail != 0)
	{
		SourceFile.Read(buffer, BufferSize);
		buffer[0] ^= FBReg1;
		buffer[1] ^= FBReg2;
		enc(buffer[0], buffer[1], cmpkey1, cmpkey2, cmpkey3);
		TailGroup = ((Tail >> 3) + 1) << 1;
		for (i = 2; i < TailGroup; ++i, ++i)
		{
			buffer[i] ^= buffer[i - 2];
			buffer[i + 1] ^= buffer[i - 1];
			enc(buffer[i], buffer[i + 1], cmpkey1, cmpkey2, 
				cmpkey3);
		}
		TargetFile.Write(buffer, TailGroup<<2);
	}
	//Destory SourceFile
	SourceFile.SeekToBegin();
	for (j = 0; j < BufferGroup; j++)
		buffer[j] = 0xffffffff;
	for (j = 0; j < Blocks; j++)
		SourceFile.Write(buffer, BufferSize);
	if (Tail != 0)
		SourceFile.Write(buffer, BufferSize);
	SourceFile.SeekToBegin();
	for (j = 0; j < BufferGroup; j++)
		buffer[j] = 0;
	for (j = 0; j < Blocks; j++)
		SourceFile.Write(buffer, BufferSize);
	if (Tail != 0)
		SourceFile.Write(buffer, BufferSize);
	SourceFile.SeekToBegin();
	for (j = 0; j < BufferGroup; j++)
		buffer[j] = 0xaaaaaaaa;
	for (j = 0; j < Blocks; j++)
		SourceFile.Write(buffer, BufferSize);
	if (Tail != 0)
		SourceFile.Write(buffer, BufferSize);
	//
	for(i = 0; i < 128; i++)
	{
		cmpkey1[i] = 0;
		cmpkey2[i] = 0;
		cmpkey3[i] = 0;
	}
	reset_s_box(S_Box);
	SourceFile.Close();
	TargetFile.Close();
	SourceFile.Remove(szSourceFile);
	TargetFile.Rename(szTempFileName, szSourceFile);
	pparams->statue = S_ALL_RIGHT;
	pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
	return;
}

void __cdecl Dec_Thread(PVOID pvoid)
{
	PWARPARAMS pparams;
	FILEHEAD filehead;
	DWORD key[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	CFile SourceFile,  TargetFile;
	DWORD FBReg1,  FBReg2,  FBReg3,  FBReg4;
	DWORD buffer[BufferGroup];
	DWORD lFileLength;
	DWORD BufferSize = sizeof(buffer);
	DWORD i,  j,  Blocks,  Tail,  TailGroup;
	DWORD SecurityIV;
	CString szSourceFile;
	char szTempFileName[MAX_PATH];
	unsigned char cmpkey1[128];
	unsigned char cmpkey2[128];
	unsigned char cmpkey3[128];
	unsigned long S_Box[512];

	pparams = (PWARPARAMS)pvoid;
	if (strcmp(pparams->lpszFileName, "") == 0)
	{
		pparams->statue = S_FILE_NAME_EMPTY;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	szSourceFile = pparams->lpszFileName;
	if (!SourceFile.Open(szSourceFile,  
		CFile::modeReadWrite | CFile::shareDenyRead | 
		CFile::shareDenyWrite,  NULL))
	{
		pparams->statue = S_FILE_OPEN_ERROR;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	lFileLength = SourceFile.GetLength() - sizeof(filehead);
	if (lFileLength < 0)
	{
		pparams->statue = S_FILE_CORRUPTED;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	if (!GetTempFileName(_T(".\\"), _T("wop"), 0, szTempFileName))
	{
		SourceFile.Close();
		pparams->statue = S_FILE_OPEN_ERROR;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	if (!TargetFile.Open(TEXT(szTempFileName), 
		CFile::modeCreate | CFile::modeWrite | 
		CFile::shareDenyRead | CFile::shareDenyWrite, NULL))
	{
		SourceFile.Close();
		pparams->statue = S_FILE_OPEN_ERROR;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	InitKeys(pparams->lpszKeys, key);
	init_s_box(key[6], key[7], S_Box);
	init_dec_cmpkeys(key[0], key[1], cmpkey1);
	init_enc_cmpkeys(key[2], key[3], cmpkey2);
	init_dec_cmpkeys(key[4], key[5], cmpkey3);
	//Verify filehead.
	SourceFile.Read(&filehead, sizeof(filehead));
	if ((filehead.Version & 0xffff0000) != (DllVersion & 0xffff0000))
	{
		for (i = 0; i < 128; i++)
		{
			cmpkey1[i] = 0;
			cmpkey2[i] = 0;
			cmpkey3[i] = 0;
		}
		reset_s_box(S_Box);
		SourceFile.Close();
		TargetFile.Close();
		TargetFile.Remove(szTempFileName);
		pparams->statue = S_VERSION_NOT_MATCH;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	FBReg1 = filehead.CheckInfo[0];
	FBReg2 = filehead.CheckInfo[1];
	dec(filehead.CheckInfo[0], filehead.CheckInfo[1], 
		cmpkey1, cmpkey2, cmpkey3);
	filehead.CheckInfo[0] ^= filehead.IV1;
	filehead.CheckInfo[1] ^= filehead.IV2;
	FBReg3 = filehead.CheckInfo[2];
	FBReg4 = filehead.CheckInfo[3];
	dec(filehead.CheckInfo[2], filehead.CheckInfo[3], 
		cmpkey1, cmpkey2, cmpkey3);
	filehead.CheckInfo[2] ^= FBReg1;
	filehead.CheckInfo[3] ^= FBReg2;
	FBReg1 = FBReg3;
	FBReg2 = FBReg4;
	FBReg3 = filehead.CheckInfo[4];
	FBReg4 = filehead.CheckInfo[5];
	dec(filehead.CheckInfo[4], filehead.CheckInfo[5], 
		cmpkey1, cmpkey2, cmpkey3);
	filehead.CheckInfo[4] ^= FBReg1;
	filehead.CheckInfo[5] ^= FBReg2;
	FBReg1 = FBReg3;
	FBReg2 = FBReg4;
	FBReg3 = filehead.CheckInfo[6];
	FBReg4 = filehead.Tail;

	dec(filehead.CheckInfo[6], filehead.Tail, 
		cmpkey1, cmpkey2, cmpkey3);
	filehead.CheckInfo[6] ^= FBReg1;
	filehead.Tail ^= FBReg2;

	SecurityIV = filehead.CheckInfo[0]^Info0;
	filehead.CheckInfo[0] ^= SecurityIV;
	SecurityIV = lfsr(SecurityIV, Security1);
	filehead.CheckInfo[1] ^= SecurityIV;
	SecurityIV = lfsr(SecurityIV, Security2);
	filehead.CheckInfo[2] ^= SecurityIV;
	SecurityIV = lfsr(SecurityIV, Security3);
	filehead.CheckInfo[3] ^= SecurityIV;
	SecurityIV = lfsr(SecurityIV, Security4);
	filehead.CheckInfo[4] ^= SecurityIV;
	SecurityIV = lfsr(SecurityIV, Security5);
	filehead.CheckInfo[5] ^= SecurityIV;
	SecurityIV = lfsr(SecurityIV, Security6);
	filehead.CheckInfo[6] ^= SecurityIV;

	if (filehead.CheckInfo[0] != Info0 || 
		filehead.CheckInfo[1] != Info1 || 
		filehead.CheckInfo[2] != Info2 || 
		filehead.CheckInfo[3] != Info3 || 
		filehead.CheckInfo[4] != Info4 || 
		filehead.CheckInfo[5] != Info5 || 
		filehead.CheckInfo[6] != Info6)
	{
		for (i =0; i < 128; i++)
		{
			cmpkey1[i] = 0;
			cmpkey2[i] = 0;
			cmpkey3[i] = 0;
		}
		reset_s_box(S_Box);
		SourceFile.Close();
		TargetFile.Close();
		TargetFile.Remove(szTempFileName);
		pparams->statue = S_KEY_INCURRECT;
		pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
		return;
	}
	lFileLength -= (8 - filehead.Tail & 7) & 7;	//Get real file length
	Tail = lFileLength % BufferSize;		//Recalculate tail
	Blocks = lFileLength / BufferSize;
	//
	FBReg1 = FBReg3;
	FBReg2 = FBReg4;
	for (j = 0; j < Blocks; j++)
	{
		SourceFile.Read(buffer, BufferSize);
		for (i = 0; i < BufferGroup; ++i, ++i)
		{
			FBReg3 = buffer[i];
			FBReg4 = buffer[i + 1];
			dec(buffer[i], buffer[i + 1], cmpkey1, cmpkey2, 
				cmpkey3);
			buffer[i] ^= FBReg1;
			buffer[i + 1] ^= FBReg2;
			FBReg1 = FBReg3;
			FBReg2 = FBReg4;
		}
		TargetFile.Write(buffer, BufferSize);
		if (pparams->bHalt)
		{
			for (i = 0; i < 128; i++)
			{
				cmpkey1[i] = 0;
				cmpkey2[i] = 0;
				cmpkey3[i] = 0;
			}
			reset_s_box(S_Box);
			SourceFile.Close();
			TargetFile.Close();
			TargetFile.Remove(szTempFileName);
			pparams->statue = S_CANCELED;
			pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
			return;
		}
		pparams->iCompleteProgress = j * 100 / Blocks;
	}
	if (Tail != 0)
	{
		SourceFile.Read(buffer, BufferSize);
		TailGroup = ((Tail >> 3) + 1) << 1;
		for (i = 0; i < TailGroup; ++i, ++i)
		{
			FBReg3 = buffer[i];
			FBReg4 = buffer[i+1];
			dec(buffer[i], buffer[i+1], cmpkey1, cmpkey2, 
				cmpkey3);
			buffer[i] ^= FBReg1;
			buffer[i + 1] ^= FBReg2;
			FBReg1 = FBReg3;
			FBReg2 = FBReg4;
		}
		TargetFile.Write(buffer, Tail);
	}
	//Destory SourceFile
	SourceFile.SeekToBegin();
	for (j = 0; j < BufferGroup; j++)
		buffer[j] = 0xffffffff;
	for (j = 0; j < Blocks; j++)
		SourceFile.Write(buffer, BufferSize);
	if (Tail != 0)
		SourceFile.Write(buffer, BufferSize);
	SourceFile.SeekToBegin();
	for (j = 0; j < BufferGroup; j++)
		buffer[j] = 0;
	for (j = 0; j < Blocks; j++)
		SourceFile.Write(buffer, BufferSize);
	if (Tail != 0)
		SourceFile.Write(buffer, BufferSize);
	SourceFile.SeekToBegin();
	for (j = 0; j < BufferGroup; j++)
		buffer[j] = 0xaaaaaaaa;
	for (j = 0; j < Blocks; j++)
		SourceFile.Write(buffer, BufferSize);
	if (Tail != 0)
		SourceFile.Write(buffer, BufferSize);
	//
	for (i = 0; i < 128; i++)
	{
		cmpkey1[i] = 0;
		cmpkey2[i] = 0;
		cmpkey3[i] = 0;
	}
	reset_s_box(S_Box);
	SourceFile.Close();
	TargetFile.Close();
	SourceFile.Remove(szSourceFile);
	TargetFile.Rename(szTempFileName, szSourceFile);
	pparams->statue = S_ALL_RIGHT;
	pparams->iCompleteProgress = PROGRESS_ALL_FINISHED;
	return;
}

EXPORTDLL unsigned long CALLBACK Version()
{
	return DllVersion;
}

EXPORTDLL long CALLBACK IsWeakKey(DWORD* LKey, DWORD* RKey)
{
	return isweakkey(*LKey, *RKey);
}

EXPORTDLL void CALLBACK Init_S_Box(DWORD* LExKey, DWORD* RExKey, 
								   unsigned long S_Box_Indentifer)
{
	init_s_box(*LExKey, *RExKey, S_Boxes[S_Box_Indentifer]);
	return;
}

EXPORTDLL void CALLBACK Reset_S_Box(unsigned long S_Box_Indentifer)
{
	reset_s_box(S_Boxes[S_Box_Indentifer]);
	return;
}

EXPORTDLL void CALLBACK Init_ENC_Subkeys(DWORD* LKey, 
										 DWORD* RKey, 
										 unsigned long S_Box_Indentifer)
{
	init_enc_cmpkeys(*LKey, *RKey, Subkey[S_Box_Indentifer]);
	return;
}

EXPORTDLL void CALLBACK Init_DEC_Subkeys(DWORD* LKey, DWORD* RKey, 
									 unsigned long S_Box_Indentifer)
{
	init_dec_cmpkeys(*LKey, *RKey, Subkey[S_Box_Indentifer]);
	return;
}

EXPORTDLL void CALLBACK Fast_ENC(DWORD* LData, DWORD* RData, 
								 unsigned long S_Box_Indentifer)
{
	fast_desenc(*LData, *RData, Subkey[S_Box_Indentifer], S_Boxes[S_Box_Indentifer]);
	return;
}

EXPORTDLL void CALLBACK Fast_DEC(DWORD* LData, DWORD* RData, 
									 unsigned long S_Box_Indentifer)
{
	fast_desdec(*LData, *RData, Subkey[S_Box_Indentifer], S_Boxes[S_Box_Indentifer]);
	return;
}

EXPORTDLL unsigned long CALLBACK Gen_S_Box()
{
	unsigned long rslt;
	InitializeCriticalSection(&_WarpDllCS);
	EnterCriticalSection(&_WarpDllCS);
	int i;
	
	if (_ThreadCounter < MAXTHREADNUMBER)
	{
		_ThreadCounter++;
		for (i = 0; i < MAXTHREADNUMBER; i++)
			if (S_Box_Status[i]) break;
		rslt = i;
	}
	else
		rslt = -1;
	LeaveCriticalSection(&_WarpDllCS);
	return rslt;
}

EXPORTDLL void CALLBACK Drop_S_Box(unsigned long S_Box_Indentifer)
{
	InitializeCriticalSection(&_WarpDllCS);
	EnterCriticalSection(&_WarpDllCS);
	if (_ThreadCounter > 0)
	{
		if (!S_Box_Status[S_Box_Indentifer])
		{
			_ThreadCounter --;
			S_Box_Status[S_Box_Indentifer] = 1;
		}
	}
	LeaveCriticalSection(&_WarpDllCS);
}

EXPORTDLL void CALLBACK Reset_Subkeys(unsigned long S_Box_Indentifer)
{
	for (int i = 0; i < 128; i++)
		Subkey[S_Box_Indentifer][i] = 0;
}