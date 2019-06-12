#include <windows.h>
#include <richedit.h>
#include "resource.h"
#include "LLongInt.h"

int GetPrime(int decBitCount, LLongInt &result)
{
	int a = 0;
	char number;
	char *strDec;
	strDec = new char[decBitCount+1];
	if (strDec != NULL)
	{
		while (a < decBitCount)
		{
			__asm
			{
				rdtsc
				mov number, al
			}
			number = number & 0x0f;
			if (a > 0)
				number = number ^ (strDec[a-1] - '0');
			if (number > 9)
				number = number - 6;
			if (a==0 && number==0)
				number = 5;
				
			strDec[a] = number + '0';
			a++;
			
		}
		strDec[decBitCount] = 0;

		result = LLongInt(strDec);
		if (result % LLongInt(2) == LLongInt("0"))
			result = result + LLongInt(1);
		while (result.IsPrime()==0)
			result = result + LLongInt(2);
		delete strDec;
		return 1;
	}
	return 0;
}

int GetRandomLongInt(int decBitCount, LLongInt &result)
{
	int a = 0;
	char number;
	char *strDec;
	strDec = new char[decBitCount+1];
	if (strDec != NULL)
	{
		while (a < decBitCount)
		{
			__asm
			{
				rdtsc
				mov number, al
			}
			number = number & 0x0f;
			if (a > 0)
				number = number ^ (strDec[a-1] - '0');
			if (number > 9)
				number = number - 6;
			if (a==0 && number==0)
				number = 5;
				
			strDec[a] = number + '0';
			a++;
			
		}
		strDec[decBitCount] = 0;
		result = LLongInt(strDec);
		delete strDec;
		return 1;
	}
	return 0;
}


LLongInt gcd(LLongInt a, LLongInt b)
{
	LLongInt rm, quotient;
	quotient = a.Divide(b, a, rm);
	if (rm == LLongInt((__int64)0))
		return b;
	return gcd(b, rm);
}


LLongInt d, n, e;

int PrepareRSA(HWND hwnd)
{
	char buff[1024];
	GetDlgItemText(hwnd, IDC_EDIT_PUBLICKEY, buff, 200);
	if (strlen(buff) < 50)
	{
		MessageBox(hwnd, "输入的公钥的长度太短！请输入一个至少为50个十进制位的。", 
				"错误", MB_ICONERROR);
		return 0;
	}
	LLongInt p(buff);
	if (p.IsPrime() == 0)
	{
		MessageBox(hwnd, "你输入的公钥不是素数！", "错误", MB_OK || MB_ICONERROR);
		return 0;
	}
	GetDlgItemText(hwnd, IDC_EDIT_PRIVATEKEY, buff, 200);
	if (strlen(buff) < 50)
	{
		MessageBox(hwnd, "输入的密钥的长度太短！请输入一个至少为50个十进制位的。", 
				"错误", MB_ICONERROR);
		return 0;
	}

	LLongInt q(buff);
	if (q.IsPrime() == 0)
	{
		MessageBox(hwnd, "你输入的密钥不是素数！", "错误", MB_OK || MB_ICONERROR);
		return 0;
	}
	n = p * q;
	LLongInt Rn = (p-LLongInt(1)) * (q-LLongInt(1));
	GetRandomLongInt(10, e);
	while (gcd(e, Rn) != LLongInt(1))
		e = e + LLongInt(1);
	int rc = e.ModRevert(Rn, d);
	if (rc == 0)
	{
		MessageBox(hwnd, "e的对于Mod ∮(n) 的逆元不存在，你给出的密钥很可能有一个不是素数。", "错误", MB_ICONERROR);
		return 0;
	}
	return 1;
}

DWORD CALLBACK RSADlgProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	static char *strEncrypt = NULL;
	static char *strDecrypt = NULL;
	static int enTxtLen = 0;
	static int deTxtLen = 0;
	static rsaPrepared = 0;
	switch(msg)
	{
		case WM_INITDIALOG:
			SetDlgItemText(hwnd, IDC_EDIT_PUBLICKEY, "4899540976259964394471845043944718734415425419221787504471845083734885697772440777425419227976260431");
			SetDlgItemText(hwnd, IDC_EDIT_PRIVATEKEY, "8652875601744651885568756095429481687345073847847958699867386354255285560954255609542556095425429741");
			SetDlgItemText(hwnd, IDC_EDIT_ENCRYPT, "你好，这是RSA加密和解密的演示程序。");
			{
				char buff[1024];
				GetDlgItemText(hwnd, IDC_EDIT_PUBLICKEY, buff, 200);
				LLongInt p(buff);
				GetDlgItemText(hwnd, IDC_EDIT_PRIVATEKEY, buff, 200);
				LLongInt q(buff);
				n = p * q;
				LLongInt Rn = (p-LLongInt(1)) * (q-LLongInt(1));
				GetRandomLongInt(10, e);
				while (gcd(e, Rn) != LLongInt(1))
					e = e + LLongInt(1);
				int rc = e.ModRevert(Rn, d);
				rsaPrepared = 1;
			}
			break;

		case WM_COMMAND:
		{
			if (HIWORD(wParam) == EN_CHANGE)
			{
				switch(LOWORD(wParam))
				{
				case IDC_EDIT_ENCRYPT:
					SetWindowText(GetDlgItem(hwnd, IDC_EDIT_DECRYPT), "");
					SetWindowText(GetDlgItem(hwnd, IDC_EDIT_DECRYPTRESULT), "");
					break;
				case IDC_EDIT_DECRYPT:
					SetWindowText(GetDlgItem(hwnd, IDC_EDIT_ENCRYPT), "");
					SetWindowText(GetDlgItem(hwnd, IDC_EDIT_DECRYPTRESULT), "");
					break;
				case IDC_EDIT_PUBLICKEY:
				case IDC_EDIT_PRIVATEKEY:
					rsaPrepared = 0;
					enTxtLen = 0;
					deTxtLen = 0;
					break;
				default:
					break;
				}
			}

			switch(LOWORD(wParam))
			{
			case IDC_BUTTON_ABOUT:
				MessageBox(hwnd, "作者: 卢学东\nEMail: LuXueDong@163.net", "关于RSA演示", MB_ICONINFORMATION);
				break;

			case IDC_BUTTON_GENKEYS:
			{
				LLongInt p, q;
				GetPrime(100, p);
				GetPrime(100, q);
				char buff[1024];
				SetWindowText(GetDlgItem(hwnd, IDC_EDIT_PUBLICKEY), p.LLongInt2A(buff, 10));
				SetWindowText(GetDlgItem(hwnd, IDC_EDIT_PRIVATEKEY), q.LLongInt2A(buff, 10));
				n = p * q;
				LLongInt Rn = (p-LLongInt(1)) * (q-LLongInt(1));
				GetRandomLongInt(10, e);
				while (gcd(e, Rn) != LLongInt(1))
					e = e + LLongInt(1);
				int rc = e.ModRevert(Rn, d);
				if (rc == 0)
				{
					MessageBox(hwnd, "e的对于Mod ∮(n) 的逆元不存在，你给出的密钥很可能有一个不是素数。", "错误", MB_ICONERROR);
					return 0;
				}
				rsaPrepared = 1;
			}
				break;

			case IDC_BUTTON_ENCRYPT:
			{
				if (rsaPrepared == 0)
					if (PrepareRSA(hwnd) == 0)
						break;
				rsaPrepared = 1;
				if (strEncrypt != NULL)
				{
					delete strEncrypt;
					strEncrypt = NULL;
				}
				int txtLen;
				txtLen = SendMessage(GetDlgItem(hwnd, IDC_EDIT_ENCRYPT), EM_GETLIMITTEXT, 0, 0);
				if (txtLen > 0)
				{
					strEncrypt = new char[txtLen + 4];
					if (strEncrypt != NULL)
					{
						if (strDecrypt != NULL)
						{
							delete strDecrypt;
							strDecrypt = NULL;
						}
						strDecrypt = new char[((txtLen+3)/4)*(n.GetBuffLength()+1)];
						if (strDecrypt != NULL)
						{
							GetDlgItemText(hwnd, IDC_EDIT_ENCRYPT, strEncrypt, txtLen+1);
							SetDlgItemText(hwnd, IDC_EDIT_DECRYPT, "");
							SetDlgItemText(hwnd, IDC_EDIT_DECRYPTRESULT, "");
							enTxtLen = strlen(strEncrypt);
							enTxtLen = (enTxtLen + 3) /4 * 4;
							deTxtLen = 0;
							if (enTxtLen > 0)
							{
								strEncrypt[enTxtLen+1] = 0;
								strEncrypt[enTxtLen+2] = 0;
								strEncrypt[enTxtLen+3] = 0;
								unsigned int *pInt = (unsigned int*)strEncrypt;
								unsigned int *pIntDecrypt = (unsigned int*)strDecrypt;
								int intLen = (enTxtLen + 3) / 4;
								int a, b;
								for (a=0; a<intLen; a++)
								{
									__int64 i64 = *pInt;
									LLongInt m(i64);
									LLongInt c;
									c = m.ExpMod(e, n); 
									*(unsigned int*)pIntDecrypt = c.GetBuffLength();
									pIntDecrypt++;
									memcpy(pIntDecrypt, c.GetBuff(), c.GetBuffLength()*sizeof(unsigned int));
									pIntDecrypt += c.GetBuffLength();
									deTxtLen = deTxtLen + c.GetBuffLength()*sizeof(unsigned int) + sizeof(unsigned int);
									pInt++;
								}
								char *strTmp = new char[deTxtLen*8];
								if (strTmp != NULL)
								{
									strTmp[0] = 0;
									pInt = (unsigned int*)strDecrypt;
									for (a=0; a<intLen; a++)
									{
										b = *pInt;
										pIntDecrypt = pInt + 1;
										while (b > 0)
										{
											wsprintf(strTmp + strlen(strTmp), "%08x ", *pIntDecrypt);
											pIntDecrypt++;
											b--;
										}
										int len = strlen(strTmp);
										strTmp[len-1] = '\n';
										strTmp[len] = 0;
										
										pInt = pInt + *pInt + 1;
									}
									SetDlgItemText(hwnd, IDC_EDIT_DECRYPT, strTmp);
									delete strTmp;
								}
							}
						}
					}
				}
			}
				break;

			case IDC_BUTTON_DECRYPT:
			{
				if (rsaPrepared == 0)
					if (PrepareRSA(hwnd) == 0)
						break;
				rsaPrepared = 1;
				if (deTxtLen > 0)
				{
					char *strTmp = new char[deTxtLen+4];
					if (strTmp != NULL)
					{
						int len = deTxtLen;
						int a = 0;
						unsigned int *pInt = (unsigned int*)strDecrypt;
						while (len > 0)
						{
							LLongInt c(pInt+1, *pInt, 0);
							LLongInt dc = c.ExpMod(d, n);
							*(int*)(strTmp+a) = *(dc.GetBuff());
							len = len - 4 - *pInt*4;
							pInt = pInt + *pInt + 1;
							a += 4;
						}
						strTmp[a] = 0;
						SetDlgItemText(hwnd, IDC_EDIT_DECRYPTRESULT, strTmp);
						delete strTmp;
					}
				}
			}
				break;

			case IDC_BUTTON_EN_TOFILE:
			{
				OPENFILENAME ofn;
				char fn[MAX_PATH];
				fn[0] = 0;
				memset(&ofn, 0, sizeof(ofn));
				ofn.lStructSize = sizeof(ofn);
				ofn.hwndOwner = hwnd;
				ofn.lpstrFilter = "所有文本文件（*.txt）\0*.txt\0\0";
				ofn.lpstrTitle = "保存要加密的文字";
				ofn.lpstrFile = fn;
				ofn.lpstrDefExt = "txt";
				ofn.nMaxFile = sizeof(fn);
				ofn.Flags = OFN_OVERWRITEPROMPT;
				int rc;
				rc = GetSaveFileName(&ofn);
				if (rc != 0)
				{
					int txtLen;
					txtLen = SendMessage(GetDlgItem(hwnd, IDC_EDIT_ENCRYPT), EM_GETLIMITTEXT, 0, 0);
					if (txtLen > 0)
					{
						if (strEncrypt != NULL)
						{
							delete strEncrypt;
							strEncrypt = NULL;
						}
						strEncrypt = new char[txtLen + 4];
						if (strEncrypt != NULL)
						{
							GetWindowText(GetDlgItem(hwnd, IDC_EDIT_ENCRYPT), strEncrypt, txtLen+1);
							HANDLE hFile = CreateFile(ofn.lpstrFile, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS,
									FILE_ATTRIBUTE_NORMAL, NULL);
							if (hFile != INVALID_HANDLE_VALUE)
							{
								DWORD dwWritten;
								WriteFile(hFile, strEncrypt, strlen(strEncrypt), &dwWritten, NULL);
								CloseHandle(hFile);
							}
						}
					}
				}
			}
				break;

			case IDC_BUTTON_DE_TOFILE:
			{
				OPENFILENAME ofn;
				char fn[MAX_PATH];
				fn[0] = 0;
				memset(&ofn, 0, sizeof(ofn));
				ofn.lStructSize = sizeof(ofn);
				ofn.hwndOwner = hwnd;
				ofn.lpstrFilter = "所有RSA加密文件（*.rsa）\0*.rsa\0\0";
				ofn.lpstrTitle = "保存加密了的文字";
				ofn.lpstrFile = fn;
				ofn.lpstrDefExt = "rsa";
				ofn.nMaxFile = sizeof(fn);
				ofn.Flags = OFN_OVERWRITEPROMPT;
				int rc;
				rc = GetSaveFileName(&ofn);
				if (rc != 0)
				{
					if (deTxtLen > 0)
					{
						if (strDecrypt != NULL)
						{
							HANDLE hFile = CreateFile(ofn.lpstrFile, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS,
									FILE_ATTRIBUTE_NORMAL, NULL);
							if (hFile != INVALID_HANDLE_VALUE)
							{
								DWORD dwWritten;
								WriteFile(hFile, strDecrypt, deTxtLen, &dwWritten, NULL);
								CloseHandle(hFile);
							}
						}
					}
				}
			}
				break;

			case IDC_BUTTON_EN_FROMFILE:
			{
				OPENFILENAME ofn;
				char fn[MAX_PATH];
				fn[0] = 0;
				memset(&ofn, 0, sizeof(ofn));
				ofn.lStructSize = sizeof(ofn);
				ofn.hwndOwner = hwnd;
				ofn.lpstrFilter = "所有文本文件（*.txt）\0*.txt\0\0";
				ofn.lpstrTitle = "打开要加密的文件";
				ofn.lpstrFile = fn;
				ofn.nMaxFile = sizeof(fn);
				ofn.Flags = OFN_FILEMUSTEXIST;
				int rc;
				rc = GetOpenFileName(&ofn);
				if (rc != 0)
				{
					if (strEncrypt != NULL)
					{
						delete strEncrypt;
						strEncrypt = NULL;
					}
					WIN32_FILE_ATTRIBUTE_DATA wfad;
					rc = GetFileAttributesEx(ofn.lpstrFile, GetFileExInfoStandard, &wfad);
					if (rc != 0)
					{
						strEncrypt = new char[wfad.nFileSizeLow + 4];
						if (strEncrypt != NULL)
						{
							HANDLE hFile = CreateFile(ofn.lpstrFile, GENERIC_READ, FILE_SHARE_READ, NULL,
								OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
							if (hFile != INVALID_HANDLE_VALUE)
							{
								DWORD dwRead;
								ReadFile(hFile, strEncrypt, wfad.nFileSizeLow, &dwRead, NULL);
								strEncrypt[dwRead] = 0;
								SetWindowText(GetDlgItem(hwnd, IDC_EDIT_ENCRYPT), strEncrypt);
								CloseHandle(hFile);
								SetWindowText(GetDlgItem(hwnd, IDC_EDIT_DECRYPT), "");
								SetWindowText(GetDlgItem(hwnd, IDC_EDIT_DECRYPTRESULT), "");
							}
						}
						enTxtLen = wfad.nFileSizeLow;
						deTxtLen = 0;
					}
				}
			}
				break;

			case IDC_BUTTON_DE_FROMFILE:
			{
				OPENFILENAME ofn;
				char fn[MAX_PATH];
				fn[0] = 0;
				memset(&ofn, 0, sizeof(ofn));
				ofn.lStructSize = sizeof(ofn);
				ofn.hwndOwner = hwnd;
				ofn.lpstrFilter = "所有RSA加密文件（*.rsa）\0*.rsa\0\0";
				ofn.lpstrTitle = "打开已经加密了的文件";
				ofn.lpstrFile = fn;
				ofn.nMaxFile = sizeof(fn);
				ofn.Flags = OFN_FILEMUSTEXIST;
				int rc;
				rc = GetOpenFileName(&ofn);
				if (rc != 0)
				{
					if (strDecrypt != NULL)
					{
						delete strDecrypt;
						strDecrypt = NULL;
					}
					WIN32_FILE_ATTRIBUTE_DATA wfad;
					rc = GetFileAttributesEx(ofn.lpstrFile, GetFileExInfoStandard, &wfad);
					if (rc != 0)
					{
						strDecrypt = new char[wfad.nFileSizeLow + 4];
						if (strDecrypt != NULL)
						{
							HANDLE hFile = CreateFile(ofn.lpstrFile, GENERIC_READ, FILE_SHARE_READ, NULL,
								OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
							if (hFile != INVALID_HANDLE_VALUE)
							{
								DWORD dwRead;
								ReadFile(hFile, strDecrypt, wfad.nFileSizeLow, &dwRead, NULL);
								strDecrypt[dwRead] = 0;
								SetWindowText(GetDlgItem(hwnd, IDC_EDIT_DECRYPT), strDecrypt);
								CloseHandle(hFile);
								SetWindowText(GetDlgItem(hwnd, IDC_EDIT_ENCRYPT), "");
								SetWindowText(GetDlgItem(hwnd, IDC_EDIT_DECRYPTRESULT), "");
							}
						}
						deTxtLen = wfad.nFileSizeLow;
						enTxtLen = 0;
						rsaPrepared = 0;
						char *strTmp = new char[deTxtLen*8];
						if (strTmp != NULL)
						{
							strTmp[0] = 0;
							int a, b;
							int len = deTxtLen;
							unsigned int *pInt = (unsigned int*)strDecrypt;
							unsigned int *pDecryptBlock;
							while (len > 0)
							{
								b = *pInt;
								pDecryptBlock = pInt + 1;
								while (b > 0)
								{
									wsprintf(strTmp + strlen(strTmp), "%08x ", *pDecryptBlock);
									pDecryptBlock++;
									b--;
								}
								int lenStrTmp = strlen(strTmp);
								strTmp[lenStrTmp-1] = '\n';
								strTmp[lenStrTmp] = 0;
								len = len - *pInt * 4 - 4;
								pInt = pInt + *pInt + 1;
							}
								
							SetDlgItemText(hwnd, IDC_EDIT_DECRYPT, strTmp);
							delete strTmp;
						}
					}
				}
			}
				break;

			case IDCANCEL:
				if (strEncrypt != NULL)
					delete strEncrypt;
				if (strDecrypt != NULL)
					delete strDecrypt;
				EndDialog(hwnd, 0);
				break;

			default:
				break;
			}
		}
			break;
		default:
			break;
	}
	return 0;
}

int WINAPI WinMain(HINSTANCE hInstThis, HINSTANCE hInstPrev, LPSTR strCmd, int showCmd)
{
	DialogBox(hInstThis, MAKEINTRESOURCE(IDD_RSADLG), 0, (DLGPROC)RSADlgProc);
}
