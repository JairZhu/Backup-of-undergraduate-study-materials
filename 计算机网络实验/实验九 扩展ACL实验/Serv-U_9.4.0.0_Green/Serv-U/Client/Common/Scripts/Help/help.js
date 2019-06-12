
// global variables

/////////////////////////////////////////////////////////////////////////////
// public functions

/////////////////////////////////////////////////////////////////////////////
// the following are general helper functions

function GetHelpVar(sVariable)
{
	var sQuery = window.location.search.substring(1);
	var aQueryVars = sQuery.split("&");
	for (var i=0;i<aQueryVars.length;i++) {
		var aQueryPair = aQueryVars[i].split("=");
		if (aQueryPair[0] == sVariable)
		return aQueryPair[1];		
	} // for
	return ("");
} // GetHelpVar


function createCookie(name,value,days) 
{
	var expires, sDomainHost, sHost, nPortPos;
	
	// get the host string
	sHost = top.location.host.toLowerCase();
	
	// check if the host has a port #
	nPortPos = sHost.indexOf(":");

	if (nPortPos != -1) {
		sHost = sHost.substr(0,nPortPos);
	} // if

	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		expires = "; expires="+date.toGMTString();
	} // if
	else 
		expires = "; expires=Thu, 01-Jan-1970 00:00:01 GMT";

	if (sHost != "localhost")
		sDomainHost = "domain=" + sHost;
	else
		sDomainHost = "";

	document.cookie = name+"="+value+expires+"; path=/;" + sDomainHost;
} // createCookie