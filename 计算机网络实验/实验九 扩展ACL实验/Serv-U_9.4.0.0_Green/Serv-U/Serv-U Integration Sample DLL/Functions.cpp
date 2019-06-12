/*
Functions.cpp : Defines the exported functions for the Serv-U Integration DLL.
-----------------------------------------------------------------------------
	Copyright © Rhino Software, Inc.
	Serv-U® is a registered trademark of Rhino Software, Inc.
	http://www.RhinoSoft.com/
-----------------------------------------------------------------------------
The intent of this source file is to provide a template for integration into
Serv-U.  This source code assumes that you are already familiar with programming
and creating a DLL for use by a Windows program.

Most of the available functions are optional.  If you do not want to support
a particular function, don't export it in your .DEF file
("Serv-U Integration Sample DLL.def" for this sample DLL).  Just comment out
the function name in your .DEF file.  While all available functions are
included in this DLL, not all of them provide useful functionality.  These
"placeholder" functions are identified by a comment in the body of the
function identifying it as intentionally left empty.

Serv-U's API uses wide characters for almost all strings, except for attribute
names and types where single-byte strintgs are used instead.

Whenever strings are to be returned by your DLL, Serv-U provides a WCHAR
buffer and a buffer size in WCHARs.  When copying to the provided buffer,
be sure not to overflow the boundary.  Serv-U provides a large enough buffer
for all attribute values, however good programming practice dictates that
safety checks should be put in place.

For a quick list of the supported functions review "Serv-U Integration Sample DLL.def".
This API is implemented using 3 groups, Serv-U User Access (SUUA), Serv-U 
Connection (SUCN), and Serv-U Operation Hooks (SUOH).  Functions in each of
the groups are prefixed with these letters to help organize the functionality.
-----------------------------------------------------------------------------
NOTE 1: Each of these functions are executed by Serv-U's main thread; any 
lengthy operations performed by your DLL will delay Serv-U's message processing,
which can cause Serv-U to become unresponsive to clients until your DLL function
finishes execution.

NOTE 2: This API uses BOOL for boolean values to provide better compatibility
for languages other than C/C++.  Serv-U assumes any non-zero BOOL value is
TRUE, while only 0 is FALSE.

NOTE 3: This file uses tab stops set to 4 characters.

NOTE 4: Each supported function includes a string identifying the Serv-U Domain
that provides the context for each call made to your DLL.  However, this sample
DLL never uses this value to ensure that the functionality it provides is applied
to all domains for easy demonstration of the Serv-U Integration DLL API.
-----------------------------------------------------------------------------
CAUTION 1: Do NOT MODIFY this file in Serv-U's installation directory, create your
own directory and your own copies of this file.  If you make changes to this file,
as installed by Serv-U, your WILL be OVERWRITTEN when Serv-U is re-installed on
your computer.  Serv-U's installer installs this file everytime Serv-U is installed.
-----------------------------------------------------------------------------
CAUTION 2: Do NOT use this DLL as-is since the login ID and password for the built-
in user are well-known.  The user account supported by this DLL provides full
access to the computer upon which Serv-U is installed when connected via localhost
(127.0.0.1).
-----------------------------------------------------------------------------
*/

#include "stdafx.h"													// precompiled header
#include <string>													// used by the attribute map
#include <map>														// used to map attributes to their values
#include "SUEventConsts.h"											// Serv-U Event Constants
#include "SUIntegrationDefs.h"										// Serv-U Integration DLL definitions

/////////////////////////////////////////////////////////////////////////////
// function prototype
#define SUIN_FUNCTION_API(retType) __declspec(dllexport) retType WINAPI

/////////////////////////////////////////////////////////////////////////////
// callback function types

/****************************************************************************
	Callback:		SUIN_SESSION_REPLACE_VARS_FUNC
	Parameters:		ULONGLONG ullSessionID
						The session ID that is to be used as the context
						for replacing session variables.  This value
						is supplied to the DLL function that also
						receives this callback function.
					PWSTR pszString
						A buffer for the string containing session variables
						that need to be replaced.
					UINT nStringLength
						The size of pszString in WCHAR.
	Return Value:	TRUE if the session was found, FALSE if not

	Description:
		Call this function to format a string containing session variables
		using the session ID as context for the actual values.  For more
		information on session variables, see the Serv-U Help Documentation.
****************************************************************************/
typedef BOOL	(CALLBACK* SUIN_SESSION_REPLACE_VARS_FUNC) (ULONGLONG ullSessionID, PWSTR pszString, UINT nStringLength);

/****************************************************************************
	Callback:		SUCH_FTP_SESSION_SEND_RESPONSE_FUNC
	Parameters:		ULONGLONG ullSessionID
						The session ID that is that is awaiting a response
						from your DLL in order to complete processing of
						an FTP command.  This value is supplied to the DLL
						function that also receives this callback function.
					PCWSTR pszString
						The properly formatted FTP response to send to the
						session in response to the pending FTP command.
	Return Value:	TRUE if the session was found, FALSE if not

	Description:
		This callback function can be used to complete processing of a
		pending FTP command that your DLL requires substantial time to
		complete.
****************************************************************************/
typedef BOOL	(CALLBACK* SUCH_FTP_SESSION_SEND_RESPONSE_FUNC) (ULONGLONG ullSessionID, PCWSTR pszString);

/////////////////////////////////////////////////////////////////////////////
// macros
#define SUIN_LOGIN_ID												L"SUDLL"
#define SUIN_PASSWORD												L"abcd"
#define NUM_ELEMENTS(arrayVar)										(sizeof(arrayVar) / sizeof(arrayVar[0]))

/////////////////////////////////////////////////////////////////////////////
// millisecond conversions
// HHMMSS --> milliseconds
#define HOURS_TO_MSEC(Hours)										((Hours) * MINUTES_TO_MSEC(60))
#define MINUTES_TO_MSEC(Minutes)									((Minutes) * SECONDS_TO_MSEC(60))
#define SECONDS_TO_MSEC(Seconds)									((Seconds) * 1000)
#define HHMMSS_TO_MSEC(Hours, Minutes, Seconds)						(HOURS_TO_MSEC(Hours) + MINUTES_TO_MSEC(Minutes) + SECONDS_TO_MSEC(Seconds))

/////////////////////////////////////////////////////////////////////////////
// string to wstring map
typedef std::map<std::string, PWSTR, std::less<std::string>>		STRING_WSTRING_MAP;
typedef STRING_WSTRING_MAP::iterator								STRING_WSTRING_MAP_ITER;
typedef STRING_WSTRING_MAP::const_iterator							STRING_WSTRING_MAP_CONST_ITER;

/////////////////////////////////////////////////////////////////////////////
// user values
bool				bInit = true;									// tracks whether or not variables should be initialized
WCHAR				wszPassword[MAX_PATH];							// buffer for storing the user's current password
STRING_WSTRING_MAP	mapAttributeToValue;							// map of the user's attributes to their values

/////////////////////////////////////////////////////////////////////////////
// DllMain function (required for DLLs)

BOOL APIENTRY DllMain(HMODULE hModule, DWORD ulReasonForCall, PVOID pReserved)
{
	// initialize variables if we have not yet done so
	if (bInit) {

		// set the user's password
		wcscpy_s(wszPassword, NUM_ELEMENTS(wszPassword), SUIN_PASSWORD);

		// vars have been initialized
		bInit = false;
	} // if

	// perform DLL operations as needed
	switch (ulReasonForCall) {

		case DLL_PROCESS_ATTACH :
		case DLL_THREAD_ATTACH :
		case DLL_THREAD_DETACH :
			// intentional do nothing
			break;

		case DLL_PROCESS_DETACH :

			// release all mapped attributes
			for (STRING_WSTRING_MAP_CONST_ITER itIter = mapAttributeToValue.begin(); (itIter != mapAttributeToValue.end()); itIter++) {

				// release the allocated value for the attribute
				delete [] itIter->second;
			} // for

			// release all mapped items
			mapAttributeToValue.clear();
			break;
	} // switch

	// success
	return (TRUE);
} // DllMain

/////////////////////////////////////////////////////////////////////////////
// user management
//
// The following functions support the integration of a user account into Serv-U
// using the login ID "SUDLL" and password "abcd".  This user is available to all
// domains on the Serv-U installation.  Users provided to Serv-U in this manner
// are last on the user hierarchy.  In other words, if a user exists in Serv-U
// through other storage means, e.g., a local user account or an external database
// user account, that user supercedes any users provided by an Integration DLL with
// the same login ID.
//
// Additional functions supported by this DLL provide attributes for the user account
// including directory access rules, event notifications, and more.

/****************************************************************************
	Function:		SUUAFindUser()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PWSTR pszLoginID
						The login ID to use for the login attempt.
						Serv-U will use this as a return value as
						well as an input because Serv-U login IDs
						are not case sensitive.
					UINT nLoginIDSize
						The size (in WCHAR) of the pszLoginID
						buffer.
	Return Value:	TRUE if the user was found, FALSE if not
	Required:		Yes

	Description:
		Simply checks the domain name and login ID to determine whether or
		not the login exists.  When supporting multiple domains, both the
		domain name (pszDomain) and the login ID (pszLoginID) should be verified
		by your DLL.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAFindUser(PCWSTR pszDomain, PWSTR pszLoginID, UINT nLoginIDSize)
{
	bool	bFound = false;

	// check the user ID, ignoring letter case
	if (_wcsicmp(pszLoginID, SUIN_LOGIN_ID) == 0) {

		// copy over the actual login ID (letter case may be different) - this only serves for
		// cosmetic purposes such as in the Activity Log
		wcscpy_s(pszLoginID, nLoginIDSize, SUIN_LOGIN_ID);

		// yes, the user was found
		bFound = true;
	} // if

	// return true if the user was found, false if not
	return (bFound);
} // SUUAFindUser


/****************************************************************************
	Function:		SUUAUnloadUser()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
	Return Value:	None
	Required:		No

	Description:
		Informative function called when Serv-U unloads a user from RAM,
		usually when all sessions have ended for that user account.  Serv-U
		may reload the user account at any time.

		If your DLL is caching user account information, this function
		can be used to remove that information from the cache.
****************************************************************************/

SUIN_FUNCTION_API(void) SUUAUnloadUser(PCWSTR pszDomain, PCWSTR pszLoginID)
{
	// this function body intentionally left blank
} // SUUAUnloadUser


/****************************************************************************
	Function:		SUUAChangePassword()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					PCWSTR pszCurrentPassword
						The password entered by the user as
						the current password, when changing
						passwords.
					PCWSTR pszNewPassword
						The user's desired new password.
	Return Value:	UINT - see "SUIntegrationDefs.h"
	Required:		No

	Description:
		Export this function if your DLL is to perform password changes.
		This can be used to enforce your own custom password policy such
		as requiring a specific length or even to enforce differences
		between historical passwords for the user.

		If your DLL doesn't export this function, Serv-U will attempt to
		change the user's password itself.  If it is successful, Serv-U
		will then call SUUAPasswordChanged() so your DLL can save the user's
		new password.

		NOTE: If neither SUUAChangePassword() nor SUUAPasswordChanged() is
		exported by your DLL and the domain allows users to change their
		password, your integration DLL cannot receive the new password from
		Serv-U and will continue to require the old password to authenticate
		the user.
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUUAChangePassword(PCWSTR pszDomain, PCWSTR pszLoginID, PCWSTR pszCurrentPassword, PCWSTR pszNewPassword)
{
	UINT	nResult = SUIN_FAIL;	// NOTE: Serv-U uses the SUIN_FAIL return code to show a generic error, see SUIntegrationDefs.h for specific error codes

	// if the login ID matches (case insensitive) and the current password matches (case sensitive), we can change the password
	if (_wcsicmp(pszLoginID, SUIN_LOGIN_ID) == 0) {

		// make sure the current password matches
		if (wcscmp(pszCurrentPassword, wszPassword) == 0) {

			// make sure the current and new passwords do not match
			if (wcscmp(pszCurrentPassword, pszNewPassword) != 0) {

				// make sure the new password is long enough
				if (wcslen(pszNewPassword) >= 4) {

					// set the new password
					wcscpy_s(wszPassword, NUM_ELEMENTS(wszPassword), pszNewPassword);

					// the password was changed
					nResult = SUIN_OKAY;
				} // if
				else
					nResult = SUIN_CHG_PASSWORD_TOO_SHORT;
			} // if
			else
				nResult = SUIN_CHG_PASSWORD_CURRENT_NEW_MATCH;
		} // if
		else
			nResult = SUIN_CHG_PASSWORD_NO_CURRENT_PASSWORD_MATCH;
	} // if

	// return SUIN_OKAY if the password was changed, error code if not
	return (nResult);
} // SUUAChangePassword


/****************************************************************************
	Function:		SUUAPasswordChanged()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					PCWSTR pszNewPassword
						The user's new password.
	Return Value:	None
	Required:		No

	Description:
		Called by Serv-U after a user's password has been changed.  The
		new password is sent to your function.  Your DLL should store the
		password with the user account.
****************************************************************************/

SUIN_FUNCTION_API(void) SUUAPasswordChanged(PCWSTR pszDomain, PCWSTR pszLoginID, PCWSTR pszNewPassword)
{
	// save the new password
	wcscpy_s(wszPassword, NUM_ELEMENTS(wszPassword), pszNewPassword);
} // SUUAPasswordChanged


/****************************************************************************
	Function:		SUUAStoreUser()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
	Return Value:	TRUE if successfully stored, FALSE if not
	Required:		No

	Description:
		Called by Serv-U when it needs to store a user's settings.  If your
		DLL is caching user changes, you should commit the cache to permanent
		storage when this function is called.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAStoreUser(PCWSTR pszDomain, PCWSTR pszLoginID)
{
	// return true if successfully stored, false if not - this sample DLL does not store changes for the
	// user between sessions and so does nothing here.
	return (true);
} // SUUAStoreUser


/****************************************************************************
	Function:		SUUAUserLoaded()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
	Return Value:	None
	Required:		No

	Description:
		Informative function used to inform your DLL that Serv-U has completed
		loading the user.  Your DLL may find it valuable to keep track of when
		the user was last loaded and also maintain when it was changed.

		When SUUAIsUserDirty() calls your DLL, you may use this time stamp to
		determine whether or not a user account needs to be reloaded by Serv-U.
****************************************************************************/

SUIN_FUNCTION_API(VOID) SUUAUserLoaded(PCWSTR pszDomain, PCWSTR pszLoginID)
{
	// this function body intentionally left blank
} // SUUAUserLoaded


/****************************************************************************
	Function:		SUUAGetUserAvailability()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					BOOL* pbLimitToTimeOfDay
						Set to TRUE if the start and end times are
						to be used.
					ULONGLONG* pullStartTime
						The start time of day when a user is
						allowed to login.
					ULONGLONG* pullEndTime
						The end time of day when a user is
						allowed to login.
					UINT* pnDayOfWeek
						Bits representing the days of the week when the
						user can login.  The first bit is Sunday,
						while the 7th bit is Saturday.  The 8th bit is
						ignored.
	Return Value:	TRUE if the user is restricted by time of day or day
					of the week, FALSE if not
	Required:		No

	Description:
		During the user load process, Serv-U calls this function to determine
		when login is allowed for this user.  The start and end times are based
		on the number of milliseconds since midnight.

		Your DLL may accomplish the same solution by returning FALSE when
		SUUAFindUser() is called.  Since Serv-U has this functionality, you
		may find this to be an easy implementation solution.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAGetUserAvailability(PCWSTR pszDomain, PCWSTR pszLoginID, BOOL* pbLimitToTimeOfDay, ULONGLONG* pullStartTime, ULONGLONG* pullEndTime, UINT* pnDayOfWeek)
{
	// never available (clear the day of the week)
	*pnDayOfWeek = 0;						// 0 == Sunday-Saturday unavailable

	// the user is available weekdays only
	*pnDayOfWeek |= (0x00 << 0);			// Sunday			(not available)
	*pnDayOfWeek |= (0x01 << 1);			// Monday
	*pnDayOfWeek |= (0x01 << 2);			// Tuesday
	*pnDayOfWeek |= (0x01 << 3);			// Wednesday
	*pnDayOfWeek |= (0x01 << 4);			// Thursday
	*pnDayOfWeek |= (0x01 << 5);			// Friday
	*pnDayOfWeek |= (0x00 << 6);			// Saturday			(not available)

	// the following commented out code demonstrates how to use the time of day limits
/*
	*pbLimitToTimeOfDay	= TRUE;							// this account is restricted by the time of day
	*pullStartTime		= HHMMSS_TO_MSEC(8, 0, 0);		// 8:00 AM - Access is allowed after this time
	*pullEndTime		= HHMMSS_TO_MSEC(17, 0, 0);		// 5:00 PM - No access is allowed after this time
*/

	// return true if we have user availablity values, false if they do not exist for this user
	return (true);
} // SUUAGetUserAvailability


/****************************************************************************
	Function:		SUUAIsUserDirty()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
	Return Value:	TRUE if the user account is dirty and should be reloaded,
					FALSE if the user account is not dirty and does not need
					to be reloaded.
	Required:		No

	Description:
		Serv-U calls this function very frequently to determine whether or
		not the user account should be reloaded before continuing.  Use
		this function in conjunction with SUUAUserLoaded() to determine
		whether or not Serv-U needs to reload a user account.  If your DLL's
		user data can be manipulated by another program, this function provides
		a way for those those changes to be propagated to Serv-U.

		NOTE: Because Serv-U calls this function very frequently, be sure not
		to spend too much time in this function as Serv-U performance can be
		compromised.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAIsUserDirty(PCWSTR pszDomain, PCWSTR pszLoginID)
{
	// return true if the user is dirty, and should be reloaded; false if it is still clean and does not need to be reloaded
	return (false);
} // SUUAIsUserDirty

/////////////////////////////////////////////////////////////////////////////
// attribute functions
//
// Users defined in an Integration DLL must also provide information about that
// user through its attributes.  The best way to see all possible attributes
// supported by a user is to create a user within the Management Console and
// then export it to a CSV.  The column headers in the first line of the exported
// CSV lists all possible attribute names.  If an attribute value is not provided
// by your Integration DLL, Serv-U uses a built-in default value for that
// attribute instead.

/****************************************************************************
	Function:		SUUAGetAttribute()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					PCSTR pszAttributeName
						The name of the attribute to load.
					PCSTR pszAttributeType
						The Serv-U attribute type.
					PWSTR pszValue
						A buffer to receive the attribute value as
						a NULL terminated string.
					UINT nValueSize
						The buffer size of pszValue in WCHAR values.
	Return Value:	TRUE if the DLL has the specified attribute, FALSE if not.
	Required:		Yes

	Description:
		This function is called during the load process to load individual
		user attributes.  The requested attribute name is specified in pszAttributeName
		and is normally a unique value (i.e., the user has only one attribute
		of this name).  However, if SUUAGetAttributeEx() is not exported by
		your DLL, this function is also called for dynamic attributes
		(attributes where they may or may not exist, or have multiples) such
		as "HomeDir".  If SUUAGetAttributeEx() is exported, SUUAGetAttributeEx()
		is called for dynamic attributes instead of SUUAGetAttribute().

		If your DLL does not provide a value for the requested attribute, Serv-U
		uses the built-in default value for that attribute.

		NOTE: The pszAttributeName and pszAttributeType values are PCSTRs, not
		Unicode strings.

		CAUTION: Be certain not to overflow the pszValue buffer by using the
		nValueSize parameter.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAGetAttribute(PCWSTR pszDomain, PCWSTR pszLoginID, PCSTR pszAttributeName, PCSTR pszAttributeType, PWSTR pszValue, UINT nValueSize)
{
	bool	bHaveAttribute = true;

	// set the user's home directory to the computer's root
	if (strcmp(pszAttributeName, "HomeDir") == 0)
		wcscpy_s(pszValue, nValueSize, L"\\");

	// set the user's password
	// NOTE: Serv-U will not verify the password if SUUAVerifyPassword() is exported by your DLL (i.e., Serv-U ignores the Password attribute)
	else if (strcmp(pszAttributeName, "Password") == 0)
		wcscpy_s(pszValue, nValueSize, wszPassword);

	// look up the attribute in the map of attributes, if found, place the value in the Serv-U buffer for the value
	else {
		STRING_WSTRING_MAP_CONST_ITER	itIter = mapAttributeToValue.find(pszAttributeName);

		// if we have this attribute, copy it over to Serv-U's buffer
		if (itIter != mapAttributeToValue.end())
			wcscpy_s(pszValue, nValueSize, itIter->second);
		else
			bHaveAttribute = false;
	} // else

	// return true if we have the requested attribute, false if not
	return (bHaveAttribute);
} // SUUAGetAttribute


/****************************************************************************
	Function:		SUUAGetAttributeEx()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					PCSTR pszAttributeName
						The name of the attribute to load.
					PCSTR pszAttributeType
						The Serv-U attribute type.
					UINT nIndex
						The index number for the attribute, starting at
						zero for the first attribute of pszAttributeName.
					PWSTR pszValue
						A buffer to receive the attribute value as
						a NULL terminated string.
					UINT nValueSize
						The buffer size of pszValue in WCHAR values.
					BOOL* pbLimitToTimeOfDay
						TRUE if the start and end times are
						to be used.
					ULONGLONG* pullStartTime
						The start time of day when an
						attribute is to be applied.
					ULONGLONG* pullEndTime
						The end time of day when an attribute
						is to be applied.
					UINT* pnDayOfWeek
						Bits representing the days of the week when the
						attribute should be applied.  The first bit is Sunday,
						while the 7th bit is Saturday.  The 8th bit is
						ignored.
	Return Value:	TRUE if the DLL has the specified attribute, FALSE if not.
	Required:		Yes

	Description:
		This function is an extension of SUUAGetAttribute().  If exported,
		this function is called by Serv-U for dynamic attributes, which may
		or may not have availability limits applied (advanced limit settings
		in the Serv-U Management Console).  This function is called multiple
		times for a dynamic attribute, until it returns false.  Serv-U
		increments nIndex for each call for a particular attribute.

		The start and end times are based upon the number of milliseconds
		since midnight.

		NOTE: The pszAttributeName and pszAttributeType values are PCSTRs, not
		Unicode strings.

		NOTE: If your implementation does not support multiple limits and
		settings and availability, don't export this function; simply comment
		out SUUAGetAttributeEx() from the .DEF file.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAGetAttributeEx(PCWSTR pszDomain, PCWSTR pszLoginID, PCSTR pszAttributeName, PCSTR pszAttributeType, UINT nIndex, PWSTR pszValue, UINT nValueSize, BOOL* pbLimitToTimeOfDay, ULONGLONG* pullStartTime, ULONGLONG* pullEndTime, UINT* pnDayOfWeek)
{
	BOOL	bRet;

	// NOTE: this sample doesn't really implement multiple dynamic attributes with availability values,
	// so it simply calls the non-Ex version of this function, and returns false when nIndex exceeds
	// the first value (0).

	// we do not have multiple attributes in this sample
	if (nIndex > 0)
		return (false);

	// limit both the upload and download rates to 20 KB/sec Monday-Friday 8:00-17:00
	if ((nIndex == 0) && ((strcmp(pszAttributeName, "MaxUserUploadRate") == 0) || (strcmp(pszAttributeName, "MaxUserDownloadRate") == 0))) {

		// set the speed limit value
		swprintf_s(pszValue, nValueSize, L"%.4lf", (double) 20.00);

		// never available (clear the day of the week)
		*pnDayOfWeek = 0;						// 0 == Sunday-Saturday unavailable

		// the user is available weekdays only
		*pnDayOfWeek |= (0x00 << 0);			// Sunday			(not available)
		*pnDayOfWeek |= (0x01 << 1);			// Monday
		*pnDayOfWeek |= (0x01 << 2);			// Tuesday
		*pnDayOfWeek |= (0x01 << 3);			// Wednesday
		*pnDayOfWeek |= (0x01 << 4);			// Thursday
		*pnDayOfWeek |= (0x01 << 5);			// Friday
		*pnDayOfWeek |= (0x00 << 6);			// Saturday			(not available)

		// this limit applies only from 8:00-17:00
		*pbLimitToTimeOfDay	= TRUE;							// this account is restricted by the time of day
		*pullStartTime		= HHMMSS_TO_MSEC(8, 0, 0);		// 8:00 AM - Access is allowed after this time
		*pullEndTime		= HHMMSS_TO_MSEC(17, 0, 0);		// 5:00 PM - No access is allowed after this time

		// we have this attribute, set the return value
		bRet = TRUE;
	} // if
	else
		bRet = SUUAGetAttribute(pszDomain, pszLoginID, pszAttributeName, pszAttributeType, pszValue, nValueSize);

	// return TRUE if we have the requested attribute, FALSE if not
	return (bRet);
} // SUUAGetAttributeEx


/****************************************************************************
	Function:		SUUASetAttribute()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					PCSTR pszAttributeName
						The name of the attribute to set.
					PCSTR pszAttributeType
						The Serv-U attribute type.
					PCWSTR pszValue
						A NULL terminated string containing the
						attribute value.
	Return Value:	TRUE if the DLL has the specified attribute, FALSE if not.
	Required:		Yes

	Description:
		Called when Serv-U needs to save or change certain attribute values.
		Since Serv-U currently has no user interface for users from integration
		DLLs, the values that Serv-U sets are only run-time values used by
		Serv-U for statistics, and other run-time values.  Your DLL should save
		all attributes for the user and return them (via SUUAGetAttribute()).

		NOTE: The pszAttributeName and pszAttributeType values are PCSTRs, not
		Unicode strings.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUASetAttribute(PCWSTR pszDomain, PCWSTR pszLoginID, PCSTR pszAttributeName, PCSTR pszAttributeType, PCWSTR pszValue)
{
	bool	bHaveAttribute = false;

	// this sample simply maps all attribute values into a map for fast lookup

	// attempt to find the attribute in the attribute to value map
	STRING_WSTRING_MAP_CONST_ITER itIter = mapAttributeToValue.find(pszAttributeName);

	// if we previously had a value, get rid of it
	if (itIter != mapAttributeToValue.end()) {

		// release the allocated value
		delete [] itIter->second;

		// get rid of the mapped string
		mapAttributeToValue.erase(itIter);
	} // if

	// determine the length of the new value
	int nLen = (int) (wcslen(pszValue) + 1 /* EOS */);

	// allocate memory for the new value
	PWCHAR wszValue = new WCHAR [nLen];

	// make sure the new value was allocated, then copy to the map
	if (wszValue) {

		// copy the value over to the allocated value string
		wcscpy_s(wszValue, nLen, pszValue);

		// add the attribute and the value to the map
		mapAttributeToValue[pszAttributeName] = wszValue;

		// set the return value for Serv-U that we have the attribute
		bHaveAttribute = true;
	} // if

	// return true if we have the requested  attribute, false if not
	return (bHaveAttribute);
} // SUUASetAttribute

/////////////////////////////////////////////////////////////////////////////
// collections
//
// Certain attributes for a user are stored as collections.  In order to retrieve
// these collections, Serv-U calls one of the corresponding DLL functions below
// passing in an integer value that begins at 0 and is incremented with each
// subsequent call to the same function as long as the Integration DLL returns
// TRUE.  If all values of that collection have been queried or if no values exist,
// your DLL should return FALSE.

/****************************************************************************
	Function:		SUUAEnumDirAccess()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					UINT nIndex
						The Directory Access object number, starting 
						with 0.  When no more are to be defined, this
						function should return FALSE.
					PWSTR pszPath
						The physical path defining access.
					UINT nPathSize
						The size of the pszPath buffer in WCHAR.
					UINT* pnAccess
						Pointer to the access values (see "SUIntegrationDefs.h").
					ULONGLONG* pullMaxSize
						Maximum size of the contents of this directory
						in bytes; use 0 for no limit.
					PWSTR pszNTUser
						Windows user ID Serv-U should use to access this
						directory.
					UINT nNTUserSize
						The size of the pszNTUser buffer in WCHAR.
					PWSTR pszNTPassword
						Windows password for pszNTUser.
					UINT nNTPasswordSize
						The size of the pszNTPassword buffer in WCHAR.
					PWSTR pszNTDomain
						Windows domain for pszNTUser.
					UINT nNTDomainSize
						The size of the pszNTDomain buffer in WCHAR.
	Return Value:	TRUE if the DLL has the directory access rule for the user,
					FALSE if not.
	Required:		Yes (if SUUAEnumGroupName() is not exported and group support
					is not being used).

	Description:
		Called to enumerate and build the directory access rules for
		a user account.  Serv-U repeatedly calls this function, incrementing
		nIndex each time, until this function returns FALSE.  The values
		used for pnAccess are defined in "SUIntegrationDefs.h".
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAEnumDirAccess(PCWSTR pszDomain, PCWSTR pszLoginID, UINT nIndex, PWSTR pszPath, UINT nPathSize, UINT* pnAccess, ULONGLONG* pullMaxSize, PWSTR pszNTUser, UINT nNTUserSize, PWSTR pszNTPassword, UINT nNTPasswordSize, PWSTR pszNTDomain, UINT nNTDomainSize)
{
	bool	bHaveDirAccess = false;

	// we're giving the user one directory access rule
	if (nIndex == 0) {

		// give access to the user's home directory
		wcscpy_s(pszPath, nPathSize, L"%HOME%");

		// access to everything except execute
		*pnAccess = SUIN_DIR_ACCESS_ALL_NO_EXECUTE;

		// we have a directory access rule for Serv-U at nIndex
		bHaveDirAccess = true;
	} // if

	// return true if we have a directory access rule at nIndex, false if not
	return (bHaveDirAccess);
} // SUUAEnumDirAccess


/****************************************************************************
	Function:		SUUAEnumVirtualPath()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					UINT nIndex
						The Virtual Path object number, starting 
						with 0.  When no more are to be defined, this
						function should return FALSE.
					PWSTR pszPhysicalPath
						The physical location of the Virtual Path.
					UINT nPhysicalPathSize
						The size of pszPhysicalPath in WCHAR.
					PWSTR pszVirtualPath
						The virtual location of the physical path,
						must contain a physical path or use one
						of Serv-U's special tags, such as %HOME%.
						The last path segment of this value indicates
						the name of the virtual path.
					UINT nVirtualPathSize
						The size of pszVirtualPath in WCHAR.
					UINT* pnIncludeInMaxSize
						Set to TRUE to include in maximum
						directory size calculations.
	Return Value:	TRUE if the DLL has the virtual path for the user, FALSE if not.
	Required:		No

	Description:
		Called to enumerate and build the virtual paths for a user account.
		Serv-U repeatedly calls this function, incrementing nIndex each time,
		until this function returns FALSE.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAEnumVirtualPath(PCWSTR pszDomain, PCWSTR pszLoginID, UINT nIndex, PWSTR pszPhysicalPath, UINT nPhysicalPathSize, PWSTR pszVirtualPath, UINT nVirtualPathSize, UINT* pnIncludeInMaxSize)
{
	bool	bHaveVirtualPath = false;

	// we're giving the user one virtual path
	if (nIndex == 0) {

		// set the physical path to the root of the C drive
		wcscpy_s(pszPhysicalPath, nPhysicalPathSize, L"C:\\");

		// set the virtual path to be mapped to the user's home directory under the name "C Drive"
		wcscpy_s(pszVirtualPath, nVirtualPathSize, L"%HOME%\\C Drive");

		// we have a virtual path for Serv-U at nIndex
		bHaveVirtualPath = true;
	} // if

	// return true if we have a virtual path at nIndex, false if not
	return (bHaveVirtualPath);
} // SUUAEnumVirtualPath


/****************************************************************************
	Function:		SUUAEnumIPAccess()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					UINT nIndex
						The IP Access object number, starting 
						with 0.  When no more are to be defined, this
						function should return FALSE.
					PWSTR pszIP
						The IP address or domain name used for the IP
						Access rule.
					UINT nIPSize
						The size of pszIP in WCHAR.
					UINT* pnAllow
						Set to TRUE to allow access based upon pszIP, or FALSE
						to deny access.
	Return Value:	TRUE if the DLL has the IP access rule for the user, FALSE if not.
	Required:		No

	Description:
		Called to enumerate and build the IP access rules for a user account.
		Serv-U repeatedly calls this function, incrementing nIndex each time,
		until this function returns FALSE.

		NOTE: The value of pszIP can be an IP address, domain name, or even
		use wildcard values.  See the Serv-U help documentation on IP access
		rules for all the usages of this value.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAEnumIPAccess(PCWSTR pszDomain, PCWSTR pszLoginID, UINT nIndex, PWSTR pszIP, UINT nIPSize, UINT* pnAllow)
{
	bool	bHaveIPAccess = false;

	// return one IP access rule, only allow access from localhost
	if (nIndex == 0) {

		// set the IP access rule to localhost
		wcscpy_s(pszIP, nIPSize, L"localhost");

		// allow users from localhost to connect
		*pnAllow = true;

		// we have an IP access rule for Serv-U at nIndex
		bHaveIPAccess = true;
	} // if

	// return true if we have an IP access rule at nIndex, false if not
	return (bHaveIPAccess);
} // SUUAEnumIPAccess


/****************************************************************************
	Function:		SUUAEnumUlDlRatioFreeFile()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					UINT nIndex
						The UlDl Ratio Free File object number, starting 
						with 0.  When no more are to be defined, this
						function should return FALSE.
					PWSTR pszMask
						The file mask.
					UINT nMaskSize
						The size of pszMask in WCHAR.
	Return Value:	TRUE if the DLL has the UlDl ratio free file object for the
					user, FALSE if not.
	Required:		No

	Description:
		Called to enumerate and build the upload / download ratio free file
		objects for a user account.  Serv-U repeatedly calls this function,
		incrementing nIndex each time, until this function returns FALSE.

		NOTE: The value of pszMask can be an explicit file name using a full or
		relative path, or even use wildcard values.  See the Serv-U help
		documentation on UL/DL Ratio Free Files for all the usages of this value.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAEnumUlDlRatioFreeFile(PCWSTR pszDomain, PCWSTR pszLoginID, UINT nIndex, PWSTR pszMask, UINT nMaskSize)
{
	bool	bHaveUlDlRatioFreeFile = false;

	// create a single ul/dl ratio free file
	if (nIndex == 0) {

		// all text files are free to users restricted by an ul/dl ratio
		wcscpy_s(pszMask, nMaskSize, L"*.txt");

		// yes, we have a ratio free file mask at nIndex
		bHaveUlDlRatioFreeFile = true;
	} // if

	// return true if we have a ul/dl ratio free file at nIndex, false if not
	return (bHaveUlDlRatioFreeFile);
} // SUUAEnumUlDlRatioFreeFile


/****************************************************************************
	Function:		SUUAEnumEvent()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					UINT nIndex
						The event object number, starting with 0.
						When no more are to be defined, this function
						should return FALSE.
					UINT* pnEventID
						The event ID, see "SUEventConsts.h"
					UINT* pnAction
						The event action, see "SUEventConsts.h"
					PWSTR pszData1
						EMAIL --> the subject of the email message
						BALLOON --> Balloon title
						EXEC --> parameters to executable
					UINT nData1Size
						The size of pszData1 in WCHAR.
					PWSTR pszData2
						EMAIL --> Email Message
						BALLOON --> Balloon tip message
						EXEC --> ignored
					UINT nData2Size
						The size of pszData2 in WCHAR.
					PWSTR pszEmailToAddress
						The To: email address(es) for the
						message, multiples may be comma
						separated.
					UINT nEmailToAddressSize
						The size of pszEmailToAddress in WCHAR.
					PWSTR pszEmailToAddressBCC
						The BCC: email address(es) for the message,
						BCC'ed addresses do not appear in the email
						header, multiples may be comma separated.
					UINT nEmailToAddressBCCSize
						The size of pszEmailToAddressBCC in WCHAR.
					PWSTR pszExeFilePath
						The path to a .EXE, .BAT, .XXX file to
						be executed for the event.
					UINT nExeFilePathSize
						The size of pszExeFilePath in WCHAR.
					UINT* pnExecWaitSecs
						The number of seconds to wait before
						timing out an EXEC action.
	Return Value:	TRUE if the DLL has the event object for the user, FALSE
					if not.
	Required:		No

	Description:
		Called to enumerate and build the event objects for a user account.
		Serv-U repeatedly calls this function, incrementing nIndex each time,
		until this function returns FALSE.

		NOTE: The values for pszData1 and pszData2 can contain special Serv-U
		system variables.  See the Serv-U Help documentation on System Variables
		for more information.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAEnumEvent(PCWSTR pszDomain, PCWSTR pszLoginID, UINT nIndex, UINT* pnEventID, UINT* pnAction, PWSTR pszData1, UINT nData1Size, PWSTR pszData2, UINT nData2Size, PWSTR pszEmailToAddress, UINT nEmailToAddressSize, PWSTR pszEmailToAddressBCC, UINT nEmailToAddressBCCSize, PWSTR pszExeFilePath, UINT nExeFilePathSize, UINT* pnExecWaitSecs)
{
	bool	bHaveEvent = false;

	// create an event to do a balloon tip when this user logs in
	if (nIndex == 0) {

		// set the event ID to tell us when this user logs in
		*pnEventID = SUEVENT_ID_USER_LOGIN;

		// use a tray balloon tip
		*pnAction = SUEVENT_ACTION_BALLOON_TIP;

		// set the balloon title
		wcscpy_s(pszData1, nData1Size, L"User \"$Name\" Has Logged In ($Protocol)");

		// set the balloon tip body
		wcscpy_s(pszData2, nData2Size, L"Connecting from $IP ($IPName)\n$UThisName active sessions\n$UserSessions24H logins in past 24 hours");

		// yes, we have an event at nIndex
		bHaveEvent = true;
	} // if

	// create an event to do a balloon tip when this user logs off
	else if (nIndex == 1) {

		// set the event ID to tell us when this user logs off
		*pnEventID = SUEVENT_ID_USER_LOGOUT;

		// use a tray balloon tip
		*pnAction = SUEVENT_ACTION_BALLOON_TIP;

		// set the balloon title
		wcscpy_s(pszData1, nData1Size, L"User \"$Name\" Has Logged Out ($Protocol)");

		// set the balloon tip body
		wcscpy_s(pszData2, nData2Size, L"IP: $IP ($IPName)\n$UThisName remaining active sessions\n$UserSessions24H logins in past 24 hours");

		// yes, we have an event at nIndex
		bHaveEvent = true;
	} // else if

	// return true if we have an event at nIndex, false if not
	return (bHaveEvent);
} // SUUAEnumEvent


/****************************************************************************
	Function:		SUUAEnumGroupName()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					UINT nIndex
						The Group Name number, starting with 0.
						When no more are to be defined, this
						function should return FALSE.
					PWSTR pszGroupName
						The name of the group that has a membership
						for the user defined by pszLoginID.
					UINT nGroupNameSize
						The size of pszGroupName in WCHAR.
	Return Value:	TRUE if the DLL has the group name for the user, FALSE if not.
	Required:		No

	Description:
		Called to enumerate and build the group names for a user account.
		Serv-U repeatedly calls this function, incrementing nIndex each time,
		until this function returns FALSE.

		The value returned in pszGroupName should correspond to an existing
		group name defined in the domain specified by pszDomain.  Groups can
		only be created and configured within the Serv-U Management Console.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAEnumGroupName(PCWSTR pszDomain, PCWSTR pszLoginID, UINT nIndex, PWSTR pszGroupName, UINT nGroupNameSize)
{
	bool	bHaveGroupName = false;

	// return true if we have a group name at nIndex, false if not
	return (bHaveGroupName);
} // SUUAEnumGroupName

/////////////////////////////////////////////////////////////////////////////
// upload / download ratios
//
// Serv-U supports 4 different kinds of upload/download ratios:
// 1) Files per user (counted across all sessions for a user)
// 2) Bytes per user (counted across all sessions for a user)
// 3) Files per session (counted against the current session only)
// 4) Bytes per session (counted against the current session only)
//
// Only one of these types of ratio may be active at a time for each user.
// In order to discover which of these types of ratios is active for a user
// provided by your Integration DLL, Serv-U sequentially calls each of the exported
// functions below.  The first function to return TRUE informs Serv-U of the
// type of ratio to apply.  Once TRUE is returned by one of these functions,
// Serv-U does *not* call the remaining ratio discovery functions.

/****************************************************************************
	Function:		SUUAGetUserFilesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of files the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of files the user is credited to download
						after uploading the corresponding number of files.
					double* pdCredit
						The current credit value for the user, in number of
						files.
	Return Value:	TRUE if the DLL has the ratio for the user, FALSE if not.
	Required:		No

	Description:
		Called to get the ratio for the user in files.  This ratio is calculated
		for the user across all of its sessions.

		NOTE: Only one upload / download ratio call may return false.
		Serv-U will stop making these calls once true has been received.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAGetUserFilesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG* pullUploadValue, ULONGLONG* pullDownloadValue, double* pdCredit)
{
	bool	bHaveRatio = false;

	// return true if we have ratio at nIndex, false if not
	return (bHaveRatio);
} // SUUAGetUserFilesUlDlRatio


/****************************************************************************
	Function:		SUUAGetUserBytesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of bytes the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of bytes the user is credited to download
						after uploading the corresponding number of bytes.
					double* pdCredit
						The current credit value for the user, in number of
						bytes.
	Return Value:	TRUE if the DLL has the ratio for the user, FALSE if not.
	Required:		No

	Description:
		Called to get the ratio for the user in bytes.  This ratio is calculated
		for the user across all of its sessions.

		NOTE: Only one upload / download ratio call may return false.
		Serv-U will stop making these calls once true has been received.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAGetUserBytesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG* pullUploadValue, ULONGLONG* pullDownloadValue, double* pdCredit)
{
	bool	bHaveRatio = false;

	// return true if we have ratio at nIndex, false if not
	return (bHaveRatio);
} // SUUAGetUserBytesUlDlRatio


/****************************************************************************
	Function:		SUUAGetSessionFilesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of files the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of files the user is credited to download
						after uploading the corresponding number of files.
					double* pdCredit
						The current credit value for the user, in number of
						files.
	Return Value:	TRUE if the DLL has the ratio for the user, FALSE if not.
	Required:		No

	Description:
		Called to get the ratio for the session in files.

		NOTE: Only one upload / download ratio call may return false.
		Serv-U will stop making these calls once true has been received.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAGetSessionFilesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG* pullUploadValue, ULONGLONG* pullDownloadValue, double* pdCredit)
{
	bool	bHaveRatio = false;

	// return true if we have ratio at nIndex, false if not
	return (bHaveRatio);
} // SUUAGetSessionFilesUlDlRatio


/****************************************************************************
	Function:		SUUAGetSessionBytesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of bytes the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of bytes the user is credited to download
						after uploading the corresponding number of bytes.
					double* pdCredit
						The current credit value for the user, in number of
						bytes.
	Return Value:	TRUE if the DLL has the ratio for the user, FALSE if not.
	Required:		No

	Description:
		Called to get the ratio for the session in bytes.

		NOTE: Only one upload / download ratio call may return false.
		Serv-U will stop making these calls once true has been received.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAGetSessionBytesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG* pullUploadValue, ULONGLONG* pullDownloadValue, double* pdCredit)
{
	bool	bHaveRatio = false;

	// return true if we have ratio at nIndex, false if not
	return (bHaveRatio);
} // SUUAGetSessionBytesUlDlRatio


/****************************************************************************
	Function:		SUUASetUserFilesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of files the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of files the user is credited to download
						after uploading the corresponding number of files.
					double* pdCredit
						The current credit value for the user, in number of
						files.
	Return Value:	None
	Required:		No

	Description:
		Called to set the ratio for the user in files.
****************************************************************************/

SUIN_FUNCTION_API(void) SUUASetUserFilesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullUploadValue, ULONGLONG ullDownloadValue, double dCredit)
{
	// this function body intentionally left blank
} // SUUASetUserFilesUlDlRatio


/****************************************************************************
	Function:		SUUASetUserBytesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of bytes the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of bytes the user is credited to download
						after uploading the corresponding number of bytes.
					double* pdCredit
						The current credit value for the user, in number of
						bytes.
	Return Value:	None
	Required:		No

	Description:
		Called to set the ratio for the user in bytes.
****************************************************************************/

SUIN_FUNCTION_API(void) SUUASetUserBytesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullUploadValue, ULONGLONG ullDownloadValue, double dCredit)
{
	// this function body intentionally left blank
} // SUUASetUserBytesUlDlRatio


/****************************************************************************
	Function:		SUUASetSessionFilesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of files the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of files the user is credited to download
						after uploading the corresponding number of files.
					double* pdCredit
						The current credit value for the user, in number of
						files.
	Return Value:	None
	Required:		No

	Description:
		Called to set the ratio for the session in files.
****************************************************************************/

SUIN_FUNCTION_API(void) SUUASetSessionFilesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullUploadValue, ULONGLONG ullDownloadValue, double dCredit)
{
	// this function body intentionally left blank
} // SUUASetSessionFilesUlDlRatio


/****************************************************************************
	Function:		SUUASetSessionBytesUlDlRatio()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG* pullUploadValue
						The number of bytes the user must upload to earn
						the corresponding download credit.
					ULONGLONG* pullDownloadValue
						The number of bytes the user is credited to download
						after uploading the corresponding number of bytes.
					double* pdCredit
						The current credit value for the user, in number of
						bytes.
	Return Value:	None
	Required:		No

	Description:
		Called to set the ratio for the session in bytes.
****************************************************************************/

SUIN_FUNCTION_API(void) SUUASetSessionBytesUlDlRatio(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullUploadValue, ULONGLONG ullDownloadValue, double dCredit)
{
	// this function body intentionally left blank
} // SUUASetSessionBytesUlDlRatio

/////////////////////////////////////////////////////////////////////////////
// login
//
// Exported login functions are called by Serv-U to verify the credentials for
// a connected session before allowing access to the File Server.

/****************************************************************************
	Function:		SUUAVerifyPassword()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					PCWSTR pszPassword
						The password the user is attempting to
						use to login to Serv-U.
	Return Value:	TRUE if the password is valid for the user account, FALSE if
					it is not.
	Required:		No (if the "Password" attribute is provided by
					SUUAGetAttribute()).

	Description:
		Serv-U calls this function, if exported, to verify a password.
		If not provided, Serv-U uses the "Password" attribute provided
		by your DLL and verifies the password itself.

		CAUTION: If an empty password is provided via SUUAGetAttribute and this
		function is not exported, Serv-U assumes the user account has no password
		and will allow login for the user simply if pszLoginID is validated through
		the SUUAFindUser() function.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAVerifyPassword(PCWSTR pszDomain, PCWSTR pszLoginID, PCWSTR pszPassword)
{
	bool	bOkay = false;

	// NOTE: By implementing this function, you're telling Serv-U that you want to verify
	//		 user passwords for login regardless of the Password attribute.  If this function
	//		 exists, Serv-U assumes this DLL is verifying all passwords for users implemented
	//		 by this DLL.  Remove this function and its corresponding declaration in the .DEF
	//		 file to allow Serv-U to perform password verification.

	// if the login ID matches (case insensitive) and the password matches (case sensitive) the password is okay
	if ((_wcsicmp(pszLoginID, SUIN_LOGIN_ID) == 0) && (wcscmp(pszPassword, wszPassword) == 0))
		bOkay = true;

	// return true if the password is okay
	return (bOkay);
} // SUUAVerifyPassword


/****************************************************************************
	Function:		SUUAVerifyIP()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					PCWSTR pszIP
						The client's IP address.
	Return Value:	TRUE if the user's login is allowed.
	Required:		No

	Description:
		Serv-U calls this function, if exported, after login to verify
		whether or not a user is allowed to login based on the IP address
		of the connection.  Serv-U will perform this task for you if
		SUUAEnumIPAccess() is exported and returns IP Access rules.  If
		your DLL needs to perform other verifications this function is
		available.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUUAVerifyIP(PCWSTR pszDomain, PCWSTR pszLoginID, PCWSTR pszIP)
{
	bool	bAllow = true;

	// allow connections from 127.0.0.1 only
	if (wcscmp(pszIP, L"127.0.0.1") != 0)
		bAllow = false;

	// return whether or not this connection should be allowed
	return (bAllow);
} // SUUAVerifyIP

/////////////////////////////////////////////////////////////////////////////
// connection functions (SUCN)
//
// The following connection functions are not tied to a specific user account.
// Instead, they apply to domain-level session events, such as connection
// establishment and disconnection.  This allows an Integration DLL to
// establish hooks to domain-level properties.

/****************************************************************************
	Function:		SUCNConnect()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the connection attempt is being made.
					PCWSTR pszIP
						The client IP address of the connnection.
					PCWSTR pszServerIP
						The server IP address the client is connected to.
					UINT nServerPort
						The server port the client is connected on.
					UINT nListenerType
						The listener type:
							0 - FTP
							1 - FTP (Implicit)
							2 - SFTP (SSH2)
							3 - HTTP
							4 - HTTPS
	Return Value:	TRUE to allow the connect, FALSE to deny the connection.
	Required:		No

	Description:
		This function is called for every connection attempt to a listener.
		Return TRUE to allow the connection or FALSE to deny it.  If you use
		this function as an informative function, always return TRUE.

		NOTE: HTTP makes many connections for a single session.  Each
		connection attempt is verified through this function.  If the session
		IP address is desired, use SUUAVerifyIP() instead since that function
		is called only once after login.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUCNConnect(PCWSTR pszDomain, PCWSTR pszIP, PCWSTR pszServerIP, UINT nServerPort, UINT nListenerType)
{
	bool	bAllow = true;

	// allow connections from 127.0.0.1 only
	if (wcscmp(pszIP, L"127.0.0.1") != 0)
		bAllow = false;

	// return whether or not this connection should be allowed
	return (bAllow);
} // SUCNConnect


/****************************************************************************
	Function:		SUCNDisconnect()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.  Can
						be NULL or empty if unavailable.
					PCWSTR pszIP
						The client IP address of the connnection.
					PCWSTR pszServerIP
						The server IP address the client was connected to.
					UINT nServerPort
						The server port the client was connected on.
	Return Value:	None
	Required:		No

	Description:
		Informative function used to tell your DLL about a client disconnect.

		NOTE: If the Login ID is unknown, pszLoginID may be NULL or empty.
		This can occur if a client disconnects before providing a login ID.
****************************************************************************/

SUIN_FUNCTION_API(void) SUCNDisconnect(PCWSTR pszDomain, PCWSTR pszLoginID, PCWSTR pszIP, PCWSTR pszServerIP, UINT nServerPort)
{
	// this function body intentionally left blank
} // SUCNDisconnect

/////////////////////////////////////////////////////////////////////////////
// status functions (SUST)
//
// The following are domain level status functions called when Serv-U fires
// a domain event or logs a string to the domain log.

/****************************************************************************
	Function:		SUSTFireEvent()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the event being fired belongs.
					UINT nEventID
						The Serv-U Event ID (see "SUEventIDs.h")
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	None
	Required:		No

	Description:
		Informative function allowing your DLL to hook into all domain events.
		This function allows your DLL to handle all events for a domain, without
		having to create Serv-U's event objects using SUUAEnumEvent().

		To receive additional information about the event or session, use the
		pfnSUINSessionReplaceVars() callback function to replace system
		variables in a string.  pfnSUINSessionReplaceVars() returns TRUE
		if the session was found, FALSE if not.

		NOTE: This function is called for all Serv-U sessions, not only those
		permitted by your DLL.
****************************************************************************/

SUIN_FUNCTION_API(void) SUSTFireEvent(PCWSTR pszDomain, UINT nEventID, ULONGLONG ullSessionID, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	WCHAR	pszString[1024];

	// fill the variables that we're looking for (these are documented in Serv-U's help file)
	wcscpy_s(pszString, NUM_ELEMENTS(pszString), L"ServerVersionShort=$ServerVersionShort\nServerVersionLong=$ServerVersionLong\nLoginID=$Name\nIP=$IP");

	// call Serv-U to replace string vars
	(* pfnSUINSessionReplaceVars) (ullSessionID, pszString, NUM_ELEMENTS(pszString));
} // SUSTFireEvent


/****************************************************************************
	Function:		SUSTLogString()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the log string applies.
					UINT nType
						The Serv-U log type; see Serv-U logs & help files.
					PCWSTR pszIPAddress
						The IP address of the client, can be NULL or empty.
					PCWSTR pszIPName
						The IP name (reverse DNS) of the client, can be NULL
						or empty.
					PCWSTR pszStr
						The string that will be logged.
	Return Value:	None
	Required:		No

	Description:
		Serv-U calls this function whenever it logs information to its
		domain log (even when not logging to a file).  The string values
		provided to this function cannot be modified and are supplied 
		only as additional information to an Integration DLL that may
		choose to perform its own independent logging.

		CAUTION: Both pszIPAddress and pszIPName can be NULL if Serv-U
		doesn't have these values available.
****************************************************************************/

SUIN_FUNCTION_API(void) SUSTLogString(PCWSTR pszDomain, UINT nType, PCWSTR pszIPAddress, PCWSTR pszIPName, PCWSTR pszStr)
{
	// this function body intentionally left blank
} // SUSTLogString

/////////////////////////////////////////////////////////////////////////////
// operation hooks (SUOH)
//
// The following exported functions allow an Integration DLL to directly modify input
// variables provided by a connected session that performs various actions on the
// File Server.  This gives your Integration DLL an opportunity to provide an extra
// layer of authentication or logging capabilities for each individual action
// taken by a session, including altering filenames and paths for transfers,
// file and folder deletions, or even directory changes.

/****************************************************************************
	Function:		SUOHRetrieve()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszPath
						The path of the file to be downloaded; may be changed if
						desired.
					UINT nPathSize
						The size of pszPath in WCHAR.
					ULONGLONG* pullStartPos
						A pointer to the starting position of the download, in bytes.
					ULONGLONG* pullEndPos
						A pointer to the ending position of the download, in bytes.
					UINT nThumbnailType
						The thumbnail type, values may be:
							const UINT	GDIP_MIME_UNKNOWN		= UINT_MAX;
							const UINT	GDIP_MIME_BMP			= 0;
							const UINT	GDIP_MIME_JPEG			= 1;
							const UINT	GDIP_MIME_GIF			= 2;
							const UINT	GDIP_MIME_TIFF			= 3;
							const UINT	GDIP_MIME_PNG			= 4;
					UINT nWidth
						The width of the thumbnail being created, 0 if N/A.
					UINT nHeight
						The height of the thumbnail being created, 0 if N/A.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	Operation hook error result as defined in SUIntegrationDefs.h
	Required:		No

	Description:
		Serv-U calls this function prior to starting a download or opening
		a file for SFTP.  The path may be changed, as can the start and
		end positions (not used for SFTP).  The start position is usually used
		to resume a download, while the end position is used by clients such as
		QuickTime to get just a portion of the file (during an HTTP session).
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUOHRetrieve(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszPath, UINT nPathSize, ULONGLONG* pullStartPos, ULONGLONG* pullEndPos, UINT nThumbnailType, UINT nWidth, UINT nHeight, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	UINT	nRet = SUIN_OKAY;

	// return SUIN_OKAY if allowed to perform this operation, otherwise an error code defined in SUIntegrationDefs.h
	return (nRet);
} // SUOHRetrieve


/****************************************************************************
	Function:		SUOHStore()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszPath
						The path of the file to be uploaded; may be changed if
						desired.
					UINT nPathSize
						The size of pszPath in WCHAR.
					ULONGLONG* pullPos
						The starting position where the download is to begin, in
						bytes; use 0 for the start of the file.
					BOOL bAppend
						Set to TRUE if appending to a file.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	Operation hook error result as defined in SUIntegrationDefs.h
	Required:		No

	Description:
		Serv-U calls this function prior to uploading a file.  Return
		SUIN_OKAY to allow Serv-U to accept the file (pszPath) being
		uploaded.  The storage path and filename may be changed through pszPath.
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUOHStore(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszPath, UINT nPathSize, ULONGLONG* pullPos, BOOL bAppend, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	UINT	nRet = SUIN_OKAY;

	// return SUIN_OKAY if allowed to perform this operation, otherwise an error code defined in SUIntegrationDefs.h
	return (nRet);
} // SUOHStore


/****************************************************************************
	Function:		SUOHRename()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszOldPath
						The path of the file to be renamed; may be changed if
						desired.
					UINT nOldPathSize
						The size of pszOldPath in WCHAR.
					PWSTR pszNewPath
						The new path (destination path) of the file to be
						renamed; may be changed if desired.
					UINT nNewPathSize
						The size of pszNewPath in WCHAR.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	Operation hook error result as defined in SUIntegrationDefs.h
	Required:		No

	Description:
		Serv-U calls this function prior to renaming a file or directory.
		Return SUIN_OKAY to allow Serv-U to rename the path.
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUOHRename(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszOldPath, UINT nOldPathSize, PWSTR pszNewPath, UINT nNewPathSize, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	UINT	nRet = SUIN_OKAY;

	// return SUIN_OKAY if allowed to perform this operation, otherwise an error code defined in SUIntegrationDefs.h
	return (nRet);
} // SUOHRename


/****************************************************************************
	Function:		SUOHDeleteFile()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszPath
						The path of the file to be deleted; may be changed if
						desired.
					UINT nPathSize
						The size of pszPath in WCHAR.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	Operation hook error result as defined in SUIntegrationDefs.h
	Required:		No

	Description:
		Serv-U calls this function prior to deleting a file.
		Return SUIN_OKAY to allow Serv-U to delete the file specified by
		pszPath.  The file being deleted may be changed through pszPath.
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUOHDeleteFile(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszPath, UINT nPathSize, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	UINT	nRet = SUIN_OKAY;

	// return SUIN_OKAY if allowed to perform this operation, otherwise an error code defined in SUIntegrationDefs.h
	return (nRet);
} // SUOHDeleteFile


/****************************************************************************
	Function:		SUOHDeleteDirectory()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszPath
						The path of the directory to be deleted; may be changed if
						desired.
					UINT nPathSize
						The size of pszPath in WCHAR.
					BOOL bDeleteContent
						TRUE if the files and sub-directories contained within
						pszPath are also to be deleted.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	Operation hook error result as defined in SUIntegrationDefs.h
	Required:		No

	Description:
		Serv-U calls this function prior to deleting a directory.
		Return SUIN_OKAY to allow Serv-U to delete the directory specified by
		pszPath.  The directory being deleted may be changed through pszPath.

		NOTE: This function is called when deleting a single directory as well as
		when deleting the directory and its contents (through the RMDA FTP command).
		When bDeleteContent is set to TRUE, this function is only called once, and
		not for subsequent sub-directories deleted as a result of the command.
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUOHDeleteDirectory(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszPath, UINT nPathSize, BOOL bDeleteContent, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	UINT	nRet = SUIN_OKAY;

	// return SUIN_OKAY if allowed to perform this operation, otherwise an error code defined in SUIntegrationDefs.h
	return (nRet);
} // SUOHDeleteDirectory


/****************************************************************************
	Function:		SUOHCreateDirectory()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszPath
						The path of the directory to be created; may be changed if
						desired.
					UINT nPathSize
						The size of pszPath in WCHAR.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	Operation hook error result as defined in SUIntegrationDefs.h
	Required:		No

	Description:
		Serv-U calls this function prior to creating the directory specified
		by pszPath. Return SUIN_OKAY to allow Serv-U to create the directory.
		The directory being created may be changed through pszPath.
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUOHCreateDirectory(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszPath, UINT nPathSize, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	UINT	nRet = SUIN_OKAY;

	// return SUIN_OKAY if allowed to perform this operation, otherwise an error code defined in SUIntegrationDefs.h
	return (nRet);
} // SUOHCreateDirectory


/****************************************************************************
	Function:		SUOHChangeWorkingDirectory()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U to
						which the login ID belongs.
					PCWSTR pszLoginID
						The login ID for the user account.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszPath
						The path of the new current directory; may be changed if
						desired.
					UINT nPathSize
						The size of pszPath in WCHAR.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	Operation hook error result as defined in SUIntegrationDefs.h
	Required:		No

	Description:
		Serv-U calls this function before changing a session's current
		directory to pszPath.  Return SUIN_OKAY to allow Serv-U to change
		the session's current path.  The directory being made current can be
		changed through pszPath.
****************************************************************************/

SUIN_FUNCTION_API(UINT) SUOHChangeWorkingDirectory(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszPath, UINT nPathSize, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	UINT	nRet = SUIN_OKAY;

	// return SUIN_OKAY if allowed to perform this operation, otherwise an error code defined in SUIntegrationDefs.h
	return (nRet);
} // SUOHChangeWorkingDirectory

/////////////////////////////////////////////////////////////////////////////
// command hooks (SUCH)
//
// A command hook can be used to create custom FTP commands.  A command may
// be created as a base-level FTP command, such as USER or RETR, or it may
// also be implemented as a custom SITE command.  Keep in mind that creating
// a custom base-level command may confuse firewalls on either side of the
// FTP connection that can cause unexpected results.  These functions only
// work for FTP connections.  These functions are not called when handling
// the universal FTP commands defined by the various FTP related RFCs.
//
// NOTE: Make sure to include a response code in your response as Serv-U
// does not provide one for your message.  If a response code is not included,
// the client software may become confused.

/****************************************************************************
	Function:		SUCHFTPAppendFEAT()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U that
						is processing the FEAT command.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PWSTR pszResponse
						Additional FEAT response lines, separated by "\n"
						(line feed characters).  NOTE:  These must NOT include 
						FTP response codes.
					UINT nResponseSize
						The size of pszResponse in WCHAR.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
	Return Value:	None
	Required:		No

	Description:
		Serv-U calls this function after building its FEAT response, allowing
		your DLL to add additional FEAT response values.  This allows you to
		insert additional FTP commands and custom SITE commands implemented
		by your Integration DLL in to the FEAT response received by the client.
****************************************************************************/

SUIN_FUNCTION_API(VOID) SUCHFTPAppendFEAT(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PWSTR pszResponse, UINT nResponseSize, SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars)
{
	// this Integration DLL supports the "SITE TIME" and "IDLE" commands, so
	// copy them over to the provided buffer to include them in the FEAT response
	wcscpy_s(pszResponse, nResponseSize, L"SITE TIME\nIDLE");
} // SUCHFTPAppendFEAT


/****************************************************************************
	Function:		SUCHFTPSITE()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U that
						is processing the SITE command.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PCWSTR pszCommand
						A string containing the command following "SITE".  For
						example, if the command sent by the client is "SITE XWHO 123",
						then pszCommand would contain "XWHO 123".
					PWSTR pszResponse
						A properly formatted FTP response.  This response may
						contain "\n" characters (line feed) to represent multiple
						lines in the response.
					UINT nResponseSize
						The size of pszResponse in WCHAR.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
					SUCH_FTP_SESSION_SEND_RESPONSE_FUNC pfnSUCHFTPSessionSendResponse
						Pointer to a callback function to use if your
						implementation requires extra time to reply to
						the client.  You may ONLY call this function from
						the context of this thread.
	Return Value:	TRUE if the SITE command was handled by your DLL,
					FALSE if not.
	Required:		No

	Description:
		Serv-U calls this function when an FTP "SITE" command is received by
		Serv-U.  Return TRUE if your function handles the command, FALSE if
		not.  If TRUE is returned, pszResponse must contain a properly
		formatted FTP response that is then sent to the client.  If FALSE is
		returned and the SITE command is recognized, Serv-U processes the
		command as normal.

		NOTE: If your implementation requires substantial time to complete,
		return "TRUE" but do not return a response in pszResponse, or simply
		return an "incomplete" response to the client, for example a 100 level
		response code, or a multi-line response where the first three
		characters are not a number and the fourth is not a space.  When your
		operation is complete, call pfnSUCHFTPSessionSendResponse.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUCHFTPSITE(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PCWSTR pszCommand, PWSTR pszResponse, UINT nResponseSize,
		SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars, SUCH_FTP_SESSION_SEND_RESPONSE_FUNC pfnSUCHFTPSessionSendResponse)
{
	bool	bHandled = false;

	// check for our custom SITE command
	if (_wcsicmp(pszCommand, L"TIME") == 0) {

		// copy over the response string to the provided buffer
		wcscpy_s(pszResponse, nResponseSize, L"200 The current local time is:\nDate: $Date\nTime: $Time");

		// we handled this command
		bHandled = true;
	} // if

	// return true if this SITE FTP command was handled
	return (bHandled);
} // SUCHFTPSITE


/****************************************************************************
	Function:		SUCHFTPCommand()
	Parameters:		PCWSTR pszDomain
						The name of the domain defined in Serv-U that
						is processing the given FTP command.
					ULONGLONG ullSessionID
						Serv-U's internal ID used to identify the session.
						This value is passed to pfnSUINSessionReplaceVars().
					PCWSTR pszCommand
						A string containing the command.
					PWSTR pszResponse
						A properly formatted FTP response.  This response may
						contain "\n" characters (line feed) to represent multiple
						lines in the response.
					UINT nResponseSize
						The size of pszResponse in WCHAR.
					SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars
						Pointer to a callback function to use for
						session system variable replacement.
					SUCH_FTP_SESSION_SEND_RESPONSE_FUNC pfnSUCHFTPSessionSendResponse
						Pointer to a callback function to use if your
						implementation requires extra time to reply to
						the client.  You may ONLY call this function from
						the context of this thread.
	Return Value:	TRUE if the FTP command was handled by your DLL,
					FALSE if not.
	Required:		No

	Description:
		Serv-U calls this function whenever an FTP command is issued to Serv-U.
		Return TRUE if your function handles the command, FALSE if not.  If TRUE
		is returned, pszResponse must contain a properly formatted FTP response
		that is then sent to the client.  If FALSE is returned, Serv-U processes
		the command as normal.

		NOTE: If your implementation requires substantial time to complete,
		return "TRUE" but do not return a response in pszResponse, or simply
		return an "incomplete" response to the client, for example a 100 level
		response code, or a multi-line response where the first three
		characters are not a number and the fourth is not a space.  When your
		operation is complete, call pfnSUCHFTPSessionSendResponse.
****************************************************************************/

SUIN_FUNCTION_API(BOOL) SUCHFTPCommand(PCWSTR pszDomain, PCWSTR pszLoginID, ULONGLONG ullSessionID, PCWSTR pszCommand, PWSTR pszResponse, UINT nResponseSize,
		SUIN_SESSION_REPLACE_VARS_FUNC pfnSUINSessionReplaceVars, SUCH_FTP_SESSION_SEND_RESPONSE_FUNC pfnSUCHFTPSessionSendResponse)
{
	bool	bHandled = false;

	// check for our custom FTP command
	if (_wcsicmp(pszCommand, L"IDLE") == 0) {

		// copy over the response string to the provided buffer
		wcscpy_s(pszResponse, nResponseSize, L"200 IDLE command received.\nDoing nothing...\nFinished!");

		// we handled this command
		bHandled = true;
	} // if

	// return true if this FTP command was handled
	return (bHandled);
} // SUCHFTPCommand
