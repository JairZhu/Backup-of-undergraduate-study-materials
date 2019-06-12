//warpdll.h
//Update:2003.2.28
#ifdef __cplusplus
#define EXPORTDLL extern "C" __declspec(dllexport)
#else
#define EXPORTDLL __declspec(dllexport)
#endif

#pragma inline_depth(3)

#ifndef __WARPDLL
#define __WARPDLL

#define PROGRESS_ALL_FINISHED 101
#define PROGRESS_WRITING_FINISHED 100

enum Statues
{
	S_ALL_RIGHT=0,
	S_VERSION_NOT_MATCH,
	S_FILE_OPEN_ERROR,
	S_FILE_NAME_EMPTY,
	S_FILE_CORRUPTED,
	S_KEY_INCURRECT,
	S_WEAK_KEY,
	S_CANCELED
};

typedef struct
{
	char* lpszFileName;
	char* lpszKeys;
	bool bHalt;
	int iCompleteProgress;
	Statues statue;
}
WARPARAMS,*PWARPARAMS;
#endif

typedef struct
{
	DWORD Version;
	DWORD IV1,IV2;
	DWORD CheckInfo[7];
	DWORD Tail;
}
FILEHEAD;

//Interface
EXPORTDLL unsigned long CALLBACK Version();

EXPORTDLL unsigned long CALLBACK ThreadEncrypt(PWARPARAMS pparams);
EXPORTDLL unsigned long CALLBACK ThreadDecrypt(PWARPARAMS pparams);

EXPORTDLL void CALLBACK Encrypt(PWARPARAMS pparams);
EXPORTDLL void CALLBACK Decrypt(PWARPARAMS pparams);

EXPORTDLL void CALLBACK ENC(DWORD* LData,DWORD* RData,
							DWORD* LKey,DWORD* RKey, unsigned long S_Box_Indentifer);
EXPORTDLL void CALLBACK DEC(DWORD* LData,DWORD* RData,
							DWORD* LKey,DWORD* RKey, unsigned long S_Box_Indentifer);

EXPORTDLL long CALLBACK IsWeakKey(DWORD* LKey,DWORD* RKey);

EXPORTDLL unsigned long CALLBACK Gen_S_Box();

EXPORTDLL void CALLBACK Init_S_Box(DWORD* LExKey,
									  DWORD* RExKey, 
									  unsigned long S_Box_Indentifer);

EXPORTDLL void CALLBACK Reset_S_Box(unsigned long S_Box_Indentifer);

EXPORTDLL void CALLBACK Drop_S_Box(unsigned long S_Box_Indentifer);

EXPORTDLL void CALLBACK Init_ENC_Subkeys(DWORD* LKey,
										 DWORD* RKey,
										 unsigned long S_Box_Indentifer);
EXPORTDLL void CALLBACK Init_DEC_Subkeys(DWORD* LKey,
										 DWORD* RKey,
										 unsigned long S_Box_Indentifer);

EXPORTDLL void CALLBACK Reset_Subkeys(unsigned long S_Box_Indentifer);

EXPORTDLL void CALLBACK Fast_ENC(DWORD* LData,DWORD* RData,
								 unsigned long S_Box_Indentifer);
EXPORTDLL void CALLBACK Fast_DEC(DWORD* LData,DWORD* RData,
								 unsigned long S_Box_Indentifer);

void InitKeys(char* KeyString,DWORD* key);
//

void __cdecl Enc_Thread(PVOID pvoid);
void __cdecl Dec_Thread(PVOID pvoid);