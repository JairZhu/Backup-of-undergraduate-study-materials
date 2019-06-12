// SUIntegrationDefs.h : macros and constants used by the Serv-U Integration DLL
//

// prevent multiple inclusions of this file
#pragma once

/////////////////////////////////////////////////////////////////////////////
// macros
#define SUIN_OK											SUIN_OKAY

/////////////////////////////////////////////////////////////////////////////
// codes
const UINT	SUIN_OKAY									= 0;
const UINT	SUIN_FAIL									= 1;
// SUUAChangePassword() error results
const UINT	SUIN_CHG_PASSWORD_NO_CURRENT_PASSWORD_MATCH	= 10;
const UINT	SUIN_CHG_PASSWORD_TOO_SHORT					= 11;
const UINT	SUIN_CHG_PASSWORD_NOT_COMPLEX				= 12;
const UINT	SUIN_CHG_PASSWORD_CURRENT_NEW_MATCH			= 13;
const UINT	SUIN_CHG_PASSWORD_CANT_CHANGE_ANONYMOUS		= 14;
// operation hook error results
const UINT	SUIN_PERMISSION_DENIED						= 20;
const UINT	SUIN_INVALID_PARAMETER						= 21;
const UINT	SUIN_NOT_FOUND								= 22;
const UINT	SUIN_INTERNAL_ERROR							= 23;
const UINT	SUIN_ALREADY_EXISTS							= 24;
const UINT	SUIN_FILE_IS_DIR							= 25;
const UINT	SUIN_DIR_IS_FILE							= 26;
const UINT	SUIN_NO_SUCH_PATH							= 27;
const UINT	SUIN_INVALID_PATH							= 28;

/////////////////////////////////////////////////////////////////////////////
// directory access macros
// files
#define SUIN_DIR_ACCESS_READ							0x00000001			// read
#define SUIN_DIR_ACCESS_WRITE							0x00000002			// write
#define SUIN_DIR_ACCESS_APPEND							0x00000004			// append
#define SUIN_DIR_ACCESS_DELETE							0x00000008			// delete
#define SUIN_DIR_ACCESS_RENAME							0x00000010			// rename
#define SUIN_DIR_ACCESS_EXECUTE							0x00000020			// execute
// directories
#define SUIN_DIR_ACCESS_LIST							0x00000100			// list
#define SUIN_DIR_ACCESS_CREATE							0x00000200			// create
#define SUIN_DIR_ACCESS_REMOVE							0x00000400			// remove
#define SUIN_DIR_ACCESS_RENAME_DIR						0x00000800			// directory rename
// sub-directories
#define SUIN_DIR_ACCESS_SUBDIR_INHERIT					0x00001000			// sub-directories inherit from the parent
// everything set
#define SUIN_DIR_ACCESS_ALL								(SUIN_DIR_ACCESS_READ | SUIN_DIR_ACCESS_WRITE | SUIN_DIR_ACCESS_APPEND | SUIN_DIR_ACCESS_DELETE | SUIN_DIR_ACCESS_RENAME | SUIN_DIR_ACCESS_EXECUTE | SUIN_DIR_ACCESS_LIST | SUIN_DIR_ACCESS_CREATE | SUIN_DIR_ACCESS_REMOVE | SUIN_DIR_ACCESS_RENAME_DIR | SUIN_DIR_ACCESS_SUBDIR_INHERIT)
#define SUIN_DIR_ACCESS_ALL_NO_EXECUTE					(SUIN_DIR_ACCESS_ALL & (~ SUIN_DIR_ACCESS_EXECUTE))
#define SUIN_DIR_ACCESS_ALL_NO_SUBDIR_INHERIT			(SUIN_DIR_ACCESS_ALL & (~ SUIN_DIR_ACCESS_SUBDIR_INHERIT))
#define SUIN_DIR_ACCESS_DEFAULT							(SUIN_DIR_ACCESS_READ | SUIN_DIR_ACCESS_LIST | SUIN_DIR_ACCESS_SUBDIR_INHERIT)

/////////////////////////////////////////////////////////////////////////////
