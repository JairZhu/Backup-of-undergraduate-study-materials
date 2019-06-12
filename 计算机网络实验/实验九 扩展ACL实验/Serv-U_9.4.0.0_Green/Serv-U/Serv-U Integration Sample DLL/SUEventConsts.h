// SUEventConsts.h : header file
//

// prevent multiple inclusions of this file
#pragma once

/////////////////////////////////////////////////////////////////////////////
// CSUEvent macros
#define USER_EMAIL_ADDRESS_VAR							SU_DOLLAR_SIGN _T(SU_VAR_USER_EMAIL_ADDRESS)

/////////////////////////////////////////////////////////////////////////////
// CSUEvent constants

// misc.
const UINT	SUEVENT_MAX_BALLOON_TITLE_LEN				= 64;
const UINT	SUEVENT_MAX_BALLOON_LEN						= 256;

// NOTE: When changing or adding to these events, remember to change CSUEvent::GetEventNameString()
// vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
// event IDs
const UINT	SUEVENT_ID_NONE								= 0;
// ----- available to CServer -----
// server events
const UINT	SUEVENT_ID_SERVER_START						= 1;
const UINT	SUEVENT_ID_SERVER_STOP						= 2;
// ----- available to CDomain and CServer -----
// domain events
const UINT	SUEVENT_ID_DOMAIN_START						= 100;
const UINT	SUEVENT_ID_DOMAIN_STOP						= 101;
const UINT	SUEVENT_ID_SESSION_CONNECT					= 102;
const UINT	SUEVENT_ID_SESSION_DISCONNECT				= 103;
const UINT	SUEVENT_ID_SESSION_CONNECT_FAILURE			= 104;
const UINT	SUEVENT_ID_LOG_DELETED						= 105;
// ----- available to CUser, CGroup, CDomain, and CServer -----
// user events
const UINT	SUEVENT_ID_USER_LOGIN						= 200;
const UINT	SUEVENT_ID_USER_LOGOUT						= 201;
const UINT	SUEVENT_ID_USER_LOGIN_FAILURE				= 202;
const UINT	SUEVENT_ID_USER_PASSWORD_CHANGE				= 203;
const UINT	SUEVENT_ID_USER_PASSWORD_CHANGE_FAILURE		= 204;
const UINT	SUEVENT_ID_USER_ENABLED						= 205;
const UINT	SUEVENT_ID_USER_DISABLED					= 206;
const UINT	SUEVENT_ID_USER_DELETED						= 207;
const UINT	SUEVENT_ID_USER_ADDED						= 208;
const UINT	SUEVENT_ID_USER_PASSWORD_RECOVERY_SENT		= 209;
const UINT	SUEVENT_ID_USER_PASSWORD_RECOVERY_FAILED	= 210;
// security events
const UINT	SUEVENT_ID_IP_BLOCKED						= 300;
const UINT	SUEVENT_ID_IP_BLOCKED_TIME					= 301;
const UINT	SUEVENT_ID_TOO_MANY_SESSIONS				= 302;
const UINT	SUEVENT_ID_TOO_MANY_SESSIONS_ON_IP			= 303;
const UINT	SUEVENT_ID_IP_ADDR_AUTO_BLOCKED_TIME		= 304;
// file events
const UINT	SUEVENT_ID_FILE_UPLOAD						= 400;
const UINT	SUEVENT_ID_FILE_UPLOAD_FAIL					= 401;
const UINT	SUEVENT_ID_FILE_DOWNLOAD					= 402;
const UINT	SUEVENT_ID_FILE_DOWNLOAD_FAIL				= 403;
const UINT	SUEVENT_ID_FILE_DELETE						= 404;
const UINT	SUEVENT_ID_FILE_MOVE						= 405;
// directory events
const UINT	SUEVENT_ID_DIR_CREATE						= 500;
const UINT	SUEVENT_ID_DIR_DELETE						= 501;
const UINT	SUEVENT_ID_DIR_CHANGE						= 502;
const UINT	SUEVENT_ID_DIR_MOVE							= 503;
// quota and disk space
const UINT	SUEVENT_ID_QUOTA_OVERAGE					= 600;
const UINT	SUEVENT_ID_DISK_SPACE_OVERAGE				= 601;
// NOTE: When changing or adding to these events, remember to change CSUEvent::GetEventNameString()
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

// event actions
const UINT	SUEVENT_ACTION_EMAIL						= 0;
const UINT	SUEVENT_ACTION_BALLOON_TIP					= 1;
const UINT	SUEVENT_ACTION_EXEC							= 2;
// NOTE: if adding new values be sure to change the values below
#define		SUEVENT_ACTION_FIRST						SUEVENT_ACTION_EMAIL
#define		SUEVENT_ACTION_LAST							SUEVENT_ACTION_EXEC

/////////////////////////////////////////////////////////////////////////////
