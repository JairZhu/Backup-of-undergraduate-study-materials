
function LoadSld( slideId )
{
	if( !g_supportsPPTHTML ) return
	if( slideId )
		parent.SldUpdated(slideId)
	g_origSz=parseInt(SlideObj.style.fontSize)
	g_origH=SlideObj.style.posHeight
	g_origW=SlideObj.style.posWidth
	g_scaleHyperlinks=(document.all.tags("AREA").length>0)
	if( g_scaleHyperlinks )
		InitHLinkArray()
	if( g_scaleInFrame||(IsWin("PPTSld") && parent.IsFullScrMode() ) )
		document.body.scroll="no"
	_RSW()
	if( IsWin("PPTSld") && parent.IsFullScrMode() )	{
		document.oncontextmenu=parent._CM;
		self.focus()
	}
}
function MakeSldVis( fTrans ) 
{
	fTrans=fTrans && g_showAnimation
	if( fTrans )
	{
		if( g_bgSound ) {
			idx=g_bgSound.indexOf(",");
			pptSound.src=g_bgSound.substr( 0, idx );
			pptSound.loop= -(parseInt(g_bgSound.substr(idx+1)));
		}
		SlideObj.filters.revealtrans.Apply()
	}
	SlideObj.style.visibility="visible"
	if( fTrans )
		SlideObj.filters.revealtrans.Play()
}
function MakeNotesVis() 
{
	if( !IsNts() ) return false 
	SlideObj.style.display="none"
	nObj = document.all.item("NotesObj")
	parent.SetHasNts(0)
	if( nObj ) { 
		nObj.style.display=""
		parent.SetHasNts(1)
	}
	return 1
}
function Redirect( frmId,sId )
{
	var str=document.location.hash,idx=str.indexOf('#')
	if(idx>=0) str=str.substr(1);
	if( window.name != frmId && ( sId != str) ) {
		obj = document.all.item("Main-File")
		window.location.href=obj.href+"#"+sId
		return 1
	}
	return 0
}
function HideMenu() { if( frames["PPTSld"] && PPTSld.document.all.item("ctxtmenu") && PPTSld.ctxtmenu.style.display!="none" ) { PPTSld.ctxtmenu.style.display='none'; return true } return false }
function IsWin( name ) { return window.name == name }
function IsNts() { return IsWin("PPTNts") }
function IsSldOrNts() { return( IsWin("PPTSld")||IsWin("PPTNts") ) }
function SupportsPPTAnimation() { return( navigator.platform == "Win32" && navigator.appVersion.indexOf("Windows")>0 ) }
function SupportsPPTHTML()
{
	var appVer=navigator.appVersion, msie=appVer.indexOf("MSIE "), ver=0
	if( msie >= 0 )
		ver=parseFloat( appVer.substring( msie+5, appVer.indexOf(";",msie) ) )
	else
		ver=parseInt(appVer)

	return( ver >= 4 && msie >= 0 )
}
var MHTMLPrefix = CalculateMHTMLPrefix(); 
function CalculateMHTMLPrefix()
{
	if ( document.location.protocol == 'mhtml:') { 
		href=new String(document.location.href) 
		Start=href.indexOf('!')+1 
		End=href.lastIndexOf('/')+1 
		if (End < Start) 
			return href.substring(0, Start) 
		else 
		return href.substring(0, End) 
	}
	return '';
}

function _RSW()
{
	if( !g_supportsPPTHTML || IsNts() ||
	  ( !g_scaleInFrame && (( window.name != "PPTSld" ) || !parent.IsFullScrMode()) ) )
		return

	cltWidth=document.body.clientWidth
	cltHeight=document.body.clientHeight
	factor=(1.0*cltWidth)/g_origW
	if( cltHeight < g_origH*factor )
		factor=(1.0*cltHeight)/g_origH

	newSize = g_origSz * factor
	if( newSize < 1 ) newSize=1

	s=SlideObj.style
	s.fontSize=newSize+"px"
	s.posWidth=g_origW*factor
	s.posHeight=g_origH*factor
	s.posLeft=(cltWidth-s.posWidth)/2
	s.posTop=(cltHeight-s.posHeight)/2

	if( g_scaleHyperlinks )
		ScaleHyperlinks( factor )
}

var g_HLinkArray = new Array();
 
function IMapAreaObj( areaObj, coords )
{
  this.areaObj = areaObj;
  this.coords = coords;
}

function InitHLinkArray()
{
  var appVer = navigator.appVersion;
  var msie = appVer.indexOf ( "MSIE " )
  var ver = 0;
  if ( msie >= 0 )
    ver = parseInt ( appVer.substring( msie+5 ) );

  linkNum = 0;

  for (i=0; i<document.all.tags("AREA").length; i++) {
    areaObj = document.all.tags("AREA").item(i);
    if( ( areaObj.id != "pptxscale" ) || ( ver > 4 ) )
      g_HLinkArray[linkNum++] = new IMapAreaObj( areaObj, ParseCoords( areaObj.coords ) );
  }
}

function ScaleHyperlinks( factor )
{   
  for ( ii=0; ii< g_HLinkArray.length; ii++) {
    coordsStr="";
    imaObj = g_HLinkArray[ii];
    for ( jj=0; jj < imaObj.coords.length-1; jj++ )
  	  coordsStr += (imaObj.coords[jj]*factor) + ",";
    coordsStr += (imaObj.coords[jj]*factor);
    imaObj.areaObj.coords = coordsStr;
  }
}

function ParseCoords( coordsStr )
{
  var numArray = new Array();
  var i = curPos = commaPos = 0;

  while ( ( commaPos = coordsStr.indexOf(",", curPos) ) != -1 ) { 
    numArray[i++] = parseInt( coordsStr.substr( curPos, commaPos ) );
    curPos = commaPos + 1;
  }
  numArray[i] = parseInt( coordsStr.substr( curPos ) );

  return numArray;
}



var g_supportsPPTHTML = SupportsPPTHTML(), g_scaleInFrame = true, gId="", g_bgSound="",
    g_scaleHyperlinks = false, g_allowAdvOnClick = true, g_showInBrowser = false;
var g_showAnimation = g_supportsPPTHTML && SupportsPPTAnimation() && g_showInBrowser;
var g_hasTrans = false, g_autoTrans = false, g_transSecs = 0;
var g_animManager = null;
