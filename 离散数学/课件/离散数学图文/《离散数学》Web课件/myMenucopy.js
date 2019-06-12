/******************************************************************************
* This file defines the tree menu with it's items and submenus.               *
******************************************************************************/

// User-defined tree menu data.

var treeMenu           = new TreeMenu();  // This is the main menu.
var treeMenuName       = "myMenu_2.0";    // Make this unique for each tree menu.
var treeMenuDays       = 7;               // Number of days to keep the cookie.
var treeMenuFrame      = "mulu";          // Name of the menu frame.
var treeMenuImgDir     = "graphics/"      // Path to graphics directory.
var treeMenuBackground = "Image/di.gif";              // Background image for menu frame.   
var treeMenuBgColor    = "";       // Color for menu frame background.   
var treeMenuFgColor    = "#000000";       // Color for menu item text.
var treeMenuHiBg       = "#008080";       // Color for selected item background.
var treeMenuHiFg       = "#ffffff";       // Color for selected item text.
var treeMenuFont       = 
      "MS Sans Serif,Arial,Helvetica,Time New Roman";    // Text font face.
var treeMenuFontSize   = 1;               // Text font size.
var treeMenuRoot       = "离散数学";      // Text for the menu root.
var treeMenuFolders    = 0;               // Sets display of '+' and '-' icons.
var treeMenuAltText    = true;            // Use menu item text for icon image ALT text.

// Define the items for the top-level of the tree menu.

//全文目录
//treeMenu.addItem(new TreeMenuItem("序言","content-0.htm","content"));
treeMenu.addItem(new TreeMenuItem("第一章 命题逻辑","content-1-0.htm","content"));
treeMenu.addItem(new TreeMenuItem("第二章 谓词逻辑","content-2-0.htm","content"));
treeMenu.addItem(new TreeMenuItem("第三章 集合","content-3-0.htm","content"));
treeMenu.addItem(new TreeMenuItem("第四章 二元关系","content-4-0.htm","content"));
treeMenu.addItem(new TreeMenuItem("第五章 函数","content-5-0.htm","content"));
treeMenu.addItem(new TreeMenuItem("第六章 代数系统","content-6-0.htm","content"));
//treeMenu.addItem(new TreeMenuItem("关于本课件","about.htm","content"));

//第一章
var chap_1 = new TreeMenu();
chap_1.addItem(new TreeMenuItem("第一节 命题","content-1-1.htm","content"));
chap_1.addItem(new TreeMenuItem("第二节 判定问题","content-1-2.htm","content"));
chap_1.addItem(new TreeMenuItem("第三节 推理","content-1-3.htm","content"));
treeMenu.items[0].makeSubmenu(chap_1);
//第一章第一节
var chap_1_1 = new TreeMenu();
chap_1_1.addItem(new TreeMenuItem("命题", "content-1-1-1.htm", "content"));
chap_1_1.addItem(new TreeMenuItem("联结词", "content-1-1-2.htm", "content"));
chap_1_1.addItem(new TreeMenuItem("命题公式", "content-1-1-3.htm", "content"));
chap_1_1.addItem(new TreeMenuItem("本节习题", "content-1-1-x.htm", "content"));
chap_1.items[0].makeSubmenu(chap_1_1);
//第一章第二节
var chap_1_2 = new TreeMenu();
chap_1_2.addItem(new TreeMenuItem("命题间的关系", "content-1-2-1.htm", "content"));
chap_1_2.addItem(new TreeMenuItem("范式", "content-1-2-2.htm", "content"));
chap_1_2.addItem(new TreeMenuItem("本节习题", "content-1-2-x.htm", "content"));
chap_1.items[1].makeSubmenu(chap_1_2);
//第一章第三节
var chap_1_3 = new TreeMenu();
chap_1_3.addItem(new TreeMenuItem("真值表技术", "content-1-3-1.htm", "content"));
chap_1_3.addItem(new TreeMenuItem("推理规则", "content-1-3-2.htm", "content"));
chap_1_3.addItem(new TreeMenuItem("本节习题", "content-1-3-x.htm", "content"));
chap_1.items[2].makeSubmenu(chap_1_3);


//第二章
var chap_2 = new TreeMenu();
chap_2.addItem(new TreeMenuItem("第一节 基本概念","content-2-1.htm","content"));
chap_2.addItem(new TreeMenuItem("第二节 永真式","content-2-2.htm","content"));
chap_2.addItem(new TreeMenuItem("第三节 谓词推理","content-2-3.htm","content"));
treeMenu.items[1].makeSubmenu(chap_2);
//第二章第一节
var chap_2_1 = new TreeMenu();
chap_2_1.addItem(new TreeMenuItem("客体", "content-2-1-1.htm", "content"));
chap_2_1.addItem(new TreeMenuItem("谓词", "content-2-1-2.htm", "content"));
chap_2_1.addItem(new TreeMenuItem("量词", "content-2-1-3.htm", "content"));
chap_2_1.addItem(new TreeMenuItem("谓词公式", "content-2-1-4.htm", "content"));
chap_2_1.addItem(new TreeMenuItem("约束", "content-2-1-5.htm", "content"));
chap_2_1.addItem(new TreeMenuItem("本节习题", "content-2-1-x.htm", "content"));
chap_2.items[0].makeSubmenu(chap_2_1);
//第二章第二节
var chap_2_2 = new TreeMenu();
chap_2_2.addItem(new TreeMenuItem("基本概念", "content-2-2-1.htm", "content"));
chap_2_2.addItem(new TreeMenuItem("永真式", "content-2-2-2.htm", "content"));
chap_2_2.addItem(new TreeMenuItem("范式", "content-2-2-3.htm", "content"));
chap_2_2.addItem(new TreeMenuItem("本节习题", "content-2-2-x.htm", "content"));
chap_2.items[1].makeSubmenu(chap_2_2);
//第二章第三节
var chap_2_3 = new TreeMenu();
chap_2_3.addItem(new TreeMenuItem("基本定律", "content-2-3-1.htm", "content"));
chap_2_3.addItem(new TreeMenuItem("推理规则", "content-2-3-2.htm", "content"));
chap_2_3.addItem(new TreeMenuItem("本节习题", "content-2-3-x.htm", "content"));
chap_2.items[2].makeSubmenu(chap_2_3);

//第三章
var chap_3 = new TreeMenu();
chap_3.addItem(new TreeMenuItem("第一节 基本概念","content-3-1.htm","content"));
chap_3.addItem(new TreeMenuItem("第二节 集合代数","content-3-2.htm","content"));
chap_3.addItem(new TreeMenuItem("第三节 笛卡尔乘积","content-3-3.htm","content"));
treeMenu.items[2].makeSubmenu(chap_3);
//第三章第一节
var chap_3_1 = new TreeMenu();
chap_3_1.addItem(new TreeMenuItem("集合", "content-3-1-1.htm", "content"));
chap_3_1.addItem(new TreeMenuItem("元素", "content-3-1-2.htm", "content"));
chap_3_1.addItem(new TreeMenuItem("特殊集合", "content-3-1-3.htm", "content"));
chap_3_1.addItem(new TreeMenuItem("集合间的关系", "content-3-1-4.htm", "content"));
chap_3_1.addItem(new TreeMenuItem("本节习题", "content-3-1-x.htm", "content"));
chap_3.items[0].makeSubmenu(chap_3_1);
//第三章第二节
var chap_3_2 = new TreeMenu();
chap_3_2.addItem(new TreeMenuItem("集合的运算", "content-3-2-1.htm", "content"));
chap_3_2.addItem(new TreeMenuItem("集合代数", "content-3-2-2.htm", "content"));
chap_3_2.addItem(new TreeMenuItem("本节习题", "content-3-2-x.htm", "content"));
chap_3.items[1].makeSubmenu(chap_3_2);
//第三章第三节
var chap_3_3 = new TreeMenu();
chap_3_3.addItem(new TreeMenuItem("序偶", "content-3-3-1.htm", "content"));
chap_3_3.addItem(new TreeMenuItem("笛卡尔乘积", "content-3-3-2.htm", "content"));
chap_3_3.addItem(new TreeMenuItem("本节习题", "content-3-3-x.htm", "content"));
chap_3.items[2].makeSubmenu(chap_3_3);

//第四章
var chap_4 = new TreeMenu();
chap_4.addItem(new TreeMenuItem("第一节 关系","content-4-1.htm","content"));
chap_4.addItem(new TreeMenuItem("第二节 等价关系","content-4-2.htm","content"));
chap_4.addItem(new TreeMenuItem("第三节 关系的合成","content-4-3.htm","content"));
treeMenu.items[3].makeSubmenu(chap_4);
//第四章第一节
var chap_4_1 = new TreeMenu();
chap_4_1.addItem(new TreeMenuItem("基本概念", "content-4-1-1.htm", "content"));
chap_4_1.addItem(new TreeMenuItem("基本性质", "content-4-1-2.htm", "content"));
chap_4_1.addItem(new TreeMenuItem("关系的表示", "content-4-1-3.htm", "content"));
chap_4_1.addItem(new TreeMenuItem("本节习题", "content-4-1-x.htm", "content"));
chap_4.items[0].makeSubmenu(chap_4_1);
//第四章第二节
var chap_4_2 = new TreeMenu();
chap_4_2.addItem(new TreeMenuItem("等价关系", "content-4-2-1.htm", "content"));
chap_4_2.addItem(new TreeMenuItem("划分", "content-4-2-2.htm", "content"));
chap_4_2.addItem(new TreeMenuItem("由等价来划分", "content-4-2-3.htm", "content"));
chap_4_2.addItem(new TreeMenuItem("由划分定义等价", "content-4-2-4.htm", "content"));
chap_4_2.addItem(new TreeMenuItem("本节习题", "content-4-2-x.htm", "content"));
chap_4.items[1].makeSubmenu(chap_4_2);
//第四章第三节
var chap_4_3 = new TreeMenu();
chap_4_3.addItem(new TreeMenuItem("关系的合成", "content-4-3-1.htm", "content"));
chap_4_3.addItem(new TreeMenuItem("合成的表示", "content-4-3-2.htm", "content"));
chap_4_3.addItem(new TreeMenuItem("关系的逆", "content-4-3-3.htm", "content"));
chap_4_3.addItem(new TreeMenuItem("本节习题", "content-4-3-x.htm", "content"));
chap_4.items[2].makeSubmenu(chap_4_3);


//第五章
var chap_5 = new TreeMenu();
chap_5.addItem(new TreeMenuItem("第一节 基本性质","content-5-1.htm","content"));
chap_5.addItem(new TreeMenuItem("第二节 重要函数","content-5-2.htm","content"));
chap_5.addItem(new TreeMenuItem("第三节 反函数","content-5-3.htm","content"));
chap_5.addItem(new TreeMenuItem("第四节 置换","content-5-4.htm","content"));
chap_5.addItem(new TreeMenuItem("第五节 二元函数","content-5-5.htm","content"));
treeMenu.items[4].makeSubmenu(chap_5);
//第五章第一节
var chap_5_1 = new TreeMenu();
chap_5_1.addItem(new TreeMenuItem("基本定义", "content-5-1-1.htm", "content"));
chap_5_1.addItem(new TreeMenuItem("函数间的关系", "content-5-1-2.htm", "content"));
chap_5_1.addItem(new TreeMenuItem("本节习题", "content-5-1-x.htm", "content"));
chap_5.items[0].makeSubmenu(chap_5_1);
//第五章第二节
var chap_5_2 = new TreeMenu();
chap_5_2.addItem(new TreeMenuItem("第一组", "content-5-2-1.htm", "content"));
chap_5_2.addItem(new TreeMenuItem("第二组", "content-5-2-2.htm", "content"));
chap_5_2.addItem(new TreeMenuItem("第三组", "content-5-2-3.htm", "content"));
chap_5_2.addItem(new TreeMenuItem("第四组", "content-5-2-4.htm", "content"));
chap_5_2.addItem(new TreeMenuItem("本节习题", "content-5-2-x.htm", "content"));
chap_5.items[1].makeSubmenu(chap_5_2);
//第五章第三节
var chap_5_3 = new TreeMenu();
chap_5_3.addItem(new TreeMenuItem("反函数", "content-5-3-1.htm", "content"));
chap_5_3.addItem(new TreeMenuItem("本节习题", "content-5-3-x.htm", "content"));
chap_5.items[2].makeSubmenu(chap_5_3);
//第五章第四节
var chap_5_4 = new TreeMenu();
chap_5_4.addItem(new TreeMenuItem("置换", "content-5-4-1.htm", "content"));
chap_5_4.addItem(new TreeMenuItem("本节习题", "content-5-4-x.htm", "content"));
chap_5.items[3].makeSubmenu(chap_5_4);
//第五章第五节
var chap_5_5 = new TreeMenu();
chap_5_5.addItem(new TreeMenuItem("二元运算", "content-5-5-1.htm", "content"));
chap_5_5.addItem(new TreeMenuItem("单位元", "content-5-5-2.htm", "content"));
chap_5_5.addItem(new TreeMenuItem("零元", "content-5-5-3.htm", "content"));
chap_5_5.addItem(new TreeMenuItem("逆元", "content-5-5-4.htm", "content"));
chap_5_5.addItem(new TreeMenuItem("本节习题", "content-5-5-x.htm", "content"));
chap_5.items[4].makeSubmenu(chap_5_5);

//第六章
var chap_6 = new TreeMenu();
chap_6.addItem(new TreeMenuItem("第一节 代数结构","content-6-1.htm","content"));
chap_6.addItem(new TreeMenuItem("第二节 代数系统间的关系","content-6-2.htm","content"));
chap_6.addItem(new TreeMenuItem("第三节 群简介","content-6-3.htm","content"));
treeMenu.items[5].makeSubmenu(chap_6);
//第六章第一节
var chap_6_1 = new TreeMenu();
chap_6_1.addItem(new TreeMenuItem("定义","content-6-1-1.htm","content"));
chap_6_1.addItem(new TreeMenuItem("实例","content-6-1-2.htm","content"));
chap_6.items[0].makeSubmenu(chap_6_1);
//第六章第二节
var chap_6_2 = new TreeMenu();
chap_6_2.addItem(new TreeMenuItem("同一类型", "content-6-2-1.htm", "content"));
chap_6_2.addItem(new TreeMenuItem("子代数", "content-6-2-2.htm", "content"));
chap_6_2.addItem(new TreeMenuItem("同态关系", "content-6-2-3.htm", "content"));
chap_6_2.addItem(new TreeMenuItem("商代数", "content-6-2-4.htm", "content"));
chap_6_2.addItem(new TreeMenuItem("积代数", "content-6-2-5.htm", "content"));
chap_6.items[1].makeSubmenu(chap_6_2);
//第六章第三节
//var chap_6_3 = new TreeMenu();
//chap_6_3.addItem(new TreeMenuItem("定义", "content-6-3-1.htm", "content"));
//chap_6_3.addItem(new TreeMenuItem("应用", "content-6-3-2.htm", "content"));
//chap_6.items[2].makeSubmenu(chap_6_3);

