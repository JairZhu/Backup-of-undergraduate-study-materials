/******************************************************************************
* treeMenuCode.js                                                             *
*                                                                             *
* Copyright 1999 by Mike Hall.                                                *
* Web address: http://www.brainjar.com                                        *
* Last update: September 17, 1999                                             *
*                                                                             *
* Creates an expanding and collapsing menu with files and folders in a child  *
* frame.                                                                      *
******************************************************************************/

//----------------------------------------------------------------------------
// Define the TreeMenuItem object.
//----------------------------------------------------------------------------

// Global index variable.

var treeMenuIndex = 0;

// Constructor.

function TreeMenuItem(text, url, target, icon) {

  this.text = text;

  if (url)
    this.url = url;
  else
    this.url = "";
  if (target)
    this.target = target;
  else
    this.target = "";
  if (icon)
    this.icon = icon;
  else
    this.icon = "";

  this.submenu = null;
  this.index = treeMenuIndex++;
  this.makeSubmenu = TreeMenuMakeSubmenu;
}

// Methods.

function TreeMenuMakeSubmenu(menu) {

  this.submenu = menu;
}

//----------------------------------------------------------------------------
// Define the TreeMenu object.
//----------------------------------------------------------------------------

// Constructor.

function TreeMenu() {

  this.items = new Array();
  this.addItem = treeMenuAddItem;
}

// Methods.

function treeMenuAddItem(item) {

  this.items[this.items.length] = item;
}

//----------------------------------------------------------------------------
// Global variables used in drawing the menu.
//----------------------------------------------------------------------------

var treeMenuDocument;       // Handle to the menu frame document.
var treeMenuWidth;          // Menu width in pixels.
var treeMenuExpand;         // Array created from first cookie.
var treeMenuSelected;       // Index of selected menu item from other cookie.
var treeMenuSelectedFound;  // Indicates if we've displayed the selected item.
var treeMenuScrollX;        // Amount to scroll the window right, if needed.
var treeMenuScrollY;        // Amount to scroll the window down, if needed.
var treeMenuLastItem;       // Flag indicating if we are on a menu's last item.
var treeMenuDepth;          // Keeps track the current menu level.
var treeMenuBars;           // Keeps track of image placement from row to row.

//----------------------------------------------------------------------------
// This function rewrites the menu document to display the menu.
//----------------------------------------------------------------------------

function treeMenuDisplay() {

  var i, cookie;

  // Check for cookies with the menu state data. If not found, or if the menu
  // state has not been set, initialize it.

  cookie = getCookie(treeMenuName);
  if (!cookie) {
    if (!treeMenuExpand) {
      treeMenuExpand = new Array();
      for (i = 0; i < treeMenuIndex; i++)
        treeMenuExpand[i] = 0;
      treeMenuSelected = -1;
    }
  }
  else {
    treeMenuExpand = cookie.split(",");
    cookie = getCookie(treeMenuName + "-selected");
    if (!cookie)
      treeMenuSelected = -1;
    else
      treeMenuSelected = cookie;
  }

  // Set up reference to the menu document.

  treeMenuDocument = window.frames[treeMenuFrame].document;

  // Set global variables used to draw the menu.

  treeMenuDepth = 0;
  treeMenuBars = new Array();

  // Intialize scrolling data.

  treeMenuSelectedFound = false;
  treeMenuScrollX = 36;
  treeMenuScrollY = 18;

  // Draw the menu.

  if (document.images)
    treeMenuDocument.open("text/html", "replace");
  else
    treeMenuDocument.open("text/html");
  treeMenuDocument.writeln('<head>');
  treeMenuDocument.writeln('<title>' + treeMenuRoot + '</title>');
  treeMenuDocument.writeln('<style type="text/css">a {text-decoration:none;}</style>');
  treeMenuDocument.writeln('</head>');
  treeMenuDocument.writeln('<body background="' + treeMenuBackground + '" bgcolor="' + treeMenuBgColor + '" text="' + treeMenuFgColor + '" link="' + treeMenuFgColor + '" alink="' + treeMenuFgColor + '" vlink="' + treeMenuFgColor + '" onLoad="parent.treeMenuScroll();">');
  treeMenuDocument.writeln('<table border=0 cellpadding=0 cellspacing=0>');
  treeMenuDocument.write('<tr valign=top><td>');
  treeMenuDocument.write('<img src="' + treeMenuImgDir + 'menu_root.gif" align=left border=0 vspace=0 hspace=0>');
  treeMenuDocument.write('<a href="#" onClick="return parent.treeMenuClickRoot();">');
  treeMenuDocument.write('<font face="' + treeMenuFont + '" size=' + treeMenuFontSize + '>&nbsp;' + treeMenuRoot + '&nbsp;</font>');
  treeMenuDocument.writeln('</td></tr>');
  treeMenuListItems(treeMenu);
  treeMenuDocument.writeln('</table>');
  treeMenuDocument.writeln('</body>');
  treeMenuDocument.close();
}

//----------------------------------------------------------------------------
// This function displays each item in the given menu or submenu.
//----------------------------------------------------------------------------

function treeMenuListItems(menu) {

  var i;

  for (i = 0; i < menu.items.length; i++) {
    if (i == menu.items.length - 1)
      treeMenuLastItem = true;
    else
      treeMenuLastItem = false;
    treeMenuDisplayItem(menu.items[i]);
  }
}

//----------------------------------------------------------------------------
// This displays a single menu or submenu item.
//----------------------------------------------------------------------------

function treeMenuDisplayItem(item) {

  var bars, cmd, expanded, i, img, alt, link, more, submenu;

  // Update vertical scrolling amount until we find the selected item.

  if (item.index == treeMenuSelected)
    treeMenuSelectedFound = true;
  if (!treeMenuSelectedFound)
    treeMenuScrollY += 18;

  // If this item is a submenu, determine if should be expanded. For older
  // browsers, always expand.

  if (treeMenuExpand[item.index] == 1)
    expanded = true;
  else
    expanded = false;

  // Define the command used when an item is clicked. For older browsers, just
  // return true or false so links will be followed.

  if (item.submenu)
    submenu = true;
  else
    submenu = false;
  if (item.url != "")
    link = true;
  else
    link = false;
  cmd = "return parent.treeMenuClick(" + item.index + ", " + link + ", " + submenu + ");";

  // Start the table row.

  treeMenuDocument.write('<tr valign=top><td nowrap>');

  // Draw descending bars from upper levels, also set horizontal scrolling
  // amount if this is the selected item.

  bars = new Array();
  for (i = 0; i < treeMenuDepth; i++) {
    if (treeMenuBars[i]) {
      treeMenuDocument.write('<img src="' + treeMenuImgDir + 'menu_bar.gif" align=left border=0 vspace=0 hspace=0>');
      bars[i] = true;
    }
    else {
      treeMenuDocument.write('<img src="' + treeMenuImgDir + 'menu_spacer.gif" align=left border=0 vspace=0 hspace=0>');
      bars[i] = false;
    }
    if (item.index == treeMenuSelected)
      treeMenuScrollX += 18;
  }

  // Determine if this is a submenu item that contains other submenus.

  more = false;
  if (item.submenu && treeMenuFolders >= 0)
    for (i = 0; i < item.submenu.items.length; i++)
      if (item.submenu.items[i].submenu != null || treeMenuFolders == 1)
        more = true;

  // Draw tee bar or corner if this item is not a submenu or if it is a
  // submenu but doesn't contain other submenus.

  if (!more) {
    if (treeMenuLastItem) {
      img = "menu_corner.gif";
      bars[bars.length] = false;
    }
    else {
      img = "menu_tee.gif";
      bars[bars.length] = true;
    }
    treeMenuDocument.write('<img src="' + treeMenuImgDir + img + '" align=left border=0 vspace=0 hspace=0>');
  }

  // Write the start of the link tag so all of the following images and text
  // will be clickable.

  if (item.url != "")
    treeMenuDocument.write('<a href="' + item.url + '" target="' + item.target + '" onClick="' + cmd + '">');
  else
    treeMenuDocument.write('<a href="#" onClick="' + cmd + '">');

  // For a submenu item that contains other submenus, draw a tee bar or corner
  // with a plus or minus sign.

  if (more) {
    if (expanded) {
      if (treeMenuLastItem) {
        img = "menu_corner_minus.gif";
        bars[bars.length] = false;
      }
      else {
        img = "menu_tee_minus.gif";
        bars[bars.length] = true;
      }
    }
    else {
      if (treeMenuLastItem) {
        img = "menu_corner_plus.gif";
        bars[bars.length] = false;
      }
      else {
        img = "menu_tee_plus.gif";
        bars[bars.length] = true;
      }
    }
    treeMenuDocument.write('<img src="' + treeMenuImgDir + img + '" align=left border=0 vspace=0 hspace=0>');
  }

  // If the item is a submenu, draw an open or closed folder icon. Otherwise
  // draw a link icon.

  if (item.submenu) {
    if (expanded)
      img = "menu_folder_open.gif";
    else
      img = "menu_folder_closed.gif";
  }
  else {
    if (item.icon != "")
      img = item.icon;
    else if (item.url.indexOf("http://") == 0)
      img = "menu_link_external.gif";
    else
      img = "menu_link_local.gif";
  }
  if (treeMenuAltText)
    alt = ' alt="' + item.text + '"';
  else
    alt = '';
  treeMenuDocument.write('<img src="' + treeMenuImgDir + img + '"' + alt + ' align=left border=0 vspace=0 hspace=0>');

  // Write the link text and finish the link and table row.

  if (item.index == treeMenuSelected)
    treeMenuDocument.write('<font face="' + treeMenuFont + '" size=' + treeMenuFontSize + '>&nbsp;<span style="background-color:' + treeMenuHiBg + ';color:' + treeMenuHiFg + ';">' + item.text + '</span></font>');
  else
    treeMenuDocument.write('<font face="' + treeMenuFont + '" size=' + treeMenuFontSize + '>&nbsp;' + item.text + '</font>');
  treeMenuDocument.write('</a>');
  treeMenuDocument.writeln('</td></tr>');

  // Set the placement of vertical bars needed for the next row.

  treeMenuBars = bars;

  // If the item is a submenu and it is expanded, make a recursive call to
  // draw its item list.

  if (item.submenu && expanded) {
    treeMenuDepth++;
    treeMenuListItems(item.submenu);
    treeMenuDepth--;
  }
}

//----------------------------------------------------------------------------
// This function handles a click on a menu item.
//----------------------------------------------------------------------------

function treeMenuClick(n, link, submenu) {

  var date, cookie;

  // Fix bug that occurs when the top-level page is reloaded.

  if (!treeMenuExpand)
    treeMenuDisplay();

  // If this is a submenu, toggle the expansion flag.

  if (submenu)
    treeMenuExpand[n] = 1 - treeMenuExpand[n];

  // Save the selected item index and update the cookies.

  treeMenuSelected = n;
  var date = new Date ();
  date.setTime (date.getTime() + (86400 * 1000 * treeMenuDays));
  cookie = treeMenuExpand.toString();
  setCookie(treeMenuName, cookie, date)
  setCookie(treeMenuName + "-selected", treeMenuSelected, date)

  // Set up redraw the menu frame.

  setTimeout("treeMenuDisplay()", 10);

  // Return the link flag.

  return link;
}

//----------------------------------------------------------------------------
// This function handles a click on the menu root.
//----------------------------------------------------------------------------

function treeMenuClickRoot() {

  // Clear the menu state.

  treeMenuExpand = null;
  treeMenuSelected = null;

  // Delete cookies.

  deleteCookie(treeMenuName);
  deleteCookie(treeMenuName + "-selected");

  // Set up redraw the menu frame.

  setTimeout("treeMenuDisplay()", 10);

  return false;
}

//----------------------------------------------------------------------------
// This function scrolls the window to ensure the selected item is in view.
// It should only be called after the page has loaded.
//
// Note: This code is browser-dependent. Scrolling may be ignored for older
// browsers.
//----------------------------------------------------------------------------

function treeMenuScroll() {

  var win, height, width;

  // Get a handle to the menu frame.

  win = window.frames[treeMenuFrame];

  // Find the dimensions of the frame.

  if (document.layers) {
    height = win.innerHeight;
    width = win.innerWidth;
  }
  else if (document.all) {
    height = win.document.body.clientHeight;
    width = win.document.body.clientWidth;
  }
  else if (document.images) {
    win.scroll(0, treeMenuScrollY);
    return;
  }
  else
    return;

  // Scroll the frame if necessary.

  if (treeMenuScrollY > height)
    win.scrollBy(0, treeMenuScrollY);
  if (treeMenuScrollX > width)
    win.scrollBy(treeMenuScrollX, 0);
}

//----------------------------------------------------------------------------
// Set a cookie given a name, value and expiration date.
//----------------------------------------------------------------------------


function setCookie (name, value, expires) {

  document.cookie = name + "=" + escape(value) + "; expires=" + expires.toGMTString() +  "; path=/";
}

//----------------------------------------------------------------------------
// Returns the value of the named cookie.
//----------------------------------------------------------------------------

function getCookie(name) {

  var search;

  search = name + "="
  offset = document.cookie.indexOf(search) 
  if (offset != -1) {
    offset += search.length ;
    end = document.cookie.indexOf(";", offset) ;
    if (end == -1)
      end = document.cookie.length;
    return unescape(document.cookie.substring(offset, end));
  }
  else
    return "";
}

//----------------------------------------------------------------------------
// Delete the named cookie.
//----------------------------------------------------------------------------

function deleteCookie(name) {

  var expdate = new Date();
  expdate.setTime(expdate.getTime() - (86400 * 1000 * 1));
  setCookie(name, "", expdate);
}
