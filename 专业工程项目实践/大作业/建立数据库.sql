CREATE DATABASE MyBlogDB16337300;

use MyBlogDB16337300;
create table User (
	userID varchar(20) not null,
    password varchar(20) default null,
    profilePhoto varchar(255) default null,
    time timestamp not null default current_timestamp,
    signature text,
    primary key(userID)
) character set = utf8;

insert into User values("用户名", 0, "img/lengtu.jpg", now(), "个性签名");
insert into User values("用户名1", 0, "img/lengtu.jpg", now(), "个性签名1");
insert into User values("用户名2", 0, "img/lengtu.jpg", now(), "个性签名2");
insert into User values("用户名3", 0, "img/lengtu.jpg", now(), "个性签名3");
insert into User values("用户名4", 0, "img/lengtu.jpg", now(), "个性签名4");
insert into User values("用户名5", 0, "img/lengtu.jpg", now(), "个性签名5");
insert into User values("用户名6", 0, "img/lengtu.jpg", now(), "个性签名6");
insert into User values("用户名7", 0, "img/lengtu.jpg", now(), "个性签名7");
insert into User values("用户名8", 0, "img/lengtu.jpg", now(), "个性签名8");
insert into User values("用户名9", 0, "img/lengtu.jpg", now(), "个性签名9");

create table Label (
	labelID varchar(20) not null,
    description text,
    primary key (labelID)
) character set = utf8;

insert into Label values("科技", "科技类文献");
insert into Label values("鬼畜", "鬼畜类文献");
insert into Label values("游戏", "游戏类文献");
insert into Label values("动画", "动画类文献");
insert into Label values("番剧", "番剧类文献");
insert into Label values("国创", "国创类文献");
insert into Label values("舞蹈", "舞蹈类文献");
insert into Label values("音乐", "音乐类文献");
insert into Label values("数码", "数码类文献");
insert into Label values("生活", "生活类文献");
insert into Label values("时尚", "时尚类文献");
insert into Label values("广告", "广告类文献");
insert into Label values("娱乐", "娱乐类文献");
insert into Label values("电影", "电影类文献");
insert into Label values("TV剧", "TV剧类文献");
insert into Label values("影视", "影视类文献");
insert into Label values("纪录片", "纪录片类文献");

create table Blog (
	blogID int not null,
    userID varchar(20) default null,
    labelID varchar(20) default null,
    title text,
    content longtext,
    time timestamp not null default current_timestamp,
    likeCount int default 0,
    reprintConunt int default 0,
    pageviews int default 0,
    commentCount int default 0,
	sign int default 0,
	img varchar(255) default "img/lengtu.jpg",
    primary key(blogID),
    foreign key(userID) references User(userID),
    foreign key(labelID) references Label(labelID)
) character set = utf8;

insert into Blog values(0, "用户名1", "广告", "跑步三年，一个人会有哪些变化？", "今天的故事主人公鲍哥是位马拉松跑者，也是蔚来ES8创始版899号车主 。三年前，他还是一个180斤的大胖子，因为减肥与跑步结缘，成功甩肉40多斤。三年时间里，他的跑步累积里程达到4833公里，平均每个月都要跑100公里以上，最近正在紧张地备战波士顿马拉松。马拉松", now(), 100, 100, 1000, 9999, 0, "img/lengtu.jpg");
insert into Blog values(1, "用户名1", "鬼畜", "唱、跳、rap和篮球", "我是练习时长两年半的练习生蔡徐坤，喜欢唱、跳、rap和篮球，music", now(), 100, 100, 1000, 9999, 0, "img/lengtu.jpg");
insert into Blog values(2, "用户名1", "游戏", "LPL夏季赛", "IG vs EDG", now(), 2, 2, 2, 2, 0, "img/lengtu.jpg");
insert into Blog values(3, "用户名1", "动画", "转生成为女人？", "主角的操作震撼我妈30年", now(), 3, 3, 3, 3, 0, "img/lengtu.jpg");
insert into Blog values(4, "用户名1", "番剧", "JOJO的奇妙冒险", "住在意大利那不勒斯的青年乔鲁诺·乔巴拿，是继承了乔斯达家宿敌·DIO之血脉的儿子。 幼年时遭受迫害而自暴自弃的他，由于拯救了一名黑帮男子，而学到了“相信他人”。不忘恩义、带着敬意对待自己的黑帮，让他的心变得率直。就这样，乔鲁诺开始对“黑帮明星”怀有憧憬。15岁的乔鲁诺，与统领意大利黑社会的黑帮组织“热情”一同引发事端，并成为被盯上的目标……", now(), 4, 4, 4, 4, 0, "img/lengtu.jpg");
insert into Blog values(5, "用户名1", "国创", "没出息的阴阳师一家", "即使Boss永远刷不过、即使对战永远打不赢、即使SSR永远抽不到、即使组队永远组翻车、即使是倒霉的人生，也总会遇到一起努（dao）力（mei）的伙伴。这里，是那个阴阳师晴明和他手下式神们的”奋斗“剧！", now(), 5, 5, 5, 5, 0, "img/lengtu.jpg");
insert into Blog values(6, "用户名1", "数码", "【装机猿】知名UP“罗汉解说”装机被骗", "现场语音通话讨说法，装机不赚钱，就是交个朋友。@罗汉解说", now(), 6, 6, 6, 6, 0, "img/lengtu.jpg");
insert into Blog values(7, "用户名1", "生活", "真的能用自制的弓箭抓到猎物吗", "购买LIFE IS FANTASTIC 的衣服，都是对信誓蛋蛋视频的大力支持。我们非常感谢大家在线上的支持，也给了我们一个可以将自己的热情投入到自己工作的机会。LIFE IS FANTASTIC！当然，如果不买我们也依然很爱你 ;)", now(), 7, 7, 7, 7, 0, "img/lengtu.jpg");
insert into Blog values(8, "用户名1", "时尚", "【党妹】三十变十三！", "毕业季必须拥有的芒果系JK妆容，成为甜甜山吹女孩！", now(), 8, 8, 8, 8, 0, "img/lengtu.jpg");
insert into Blog values(9, "用户名1", "娱乐", "真当我游乐王子不玩B站吗？", "雨女无瓜，悠呢哇子还不睡？", now(), 9, 0, 0, 0, 0, "img/lengtu.jpg");
insert into Blog values(10, "用户名1", "科技", "学习JSP编程", "内容内容内容内容", now(), 0, 0, 0, 0, 0, "img/lengtu.jpg");


create table Album (
	albumID int not null,
    userID varchar(20) default null,
    pictureID int default null,
    name text,
    description text,
    time timestamp not null default current_timestamp,
    primary key(albumID),
    foreign key(userID) references User(userID)
) character set = utf8;

insert into Album values(0, "用户名", 0, "相册", "相册描述", now());
insert into Album values(1, "用户名1", 1, "相册", "相册描述", now());

create table Picture (
	pictureID int not null,
    albumID int default null,
    name text,
    content varchar(255) default null,
    likeCount int default 0,
    reprintCount int default 0,
    time timestamp not null default current_timestamp,
    primary key(pictureID),
    foreign key(albumID) references Album(albumID)
) character set = utf8;

insert into Picture values(0, 0, "图片", "img/lengtu.jpg", 0, 0, now());
insert into Picture values(1, 1, "图片", "img/lengtu.jpg", 0, 0, now());

create table BlogComment (
	commentID int not null,
    userID varchar(20) default null,
    blogID int default null,
    time timestamp not null default current_timestamp,
    content text,
    primary key(commentID),
    foreign key(userID) references User(userID),
    foreign key(blogID) references Blog(blogID)
) character set = utf8;

insert into BlogComment values (0, "用户名", 0, now(), "千万不要夜跑，我家楼下烧烤摊巨多，这两年我天天跑步，还是胖了");
insert into BlogComment values (1, "用户名3", 1, now(), "魔仙女王：滚出我的魔仙堡");
insert into BlogComment values (2, "用户名4", 2, now(), "古娜拉面筋之神，可得劲了！全身变！");
insert into BlogComment values (3, "用户名5", 3, now(), "一看到烤面筋，特别是草莓的，我知道我无能为力");
insert into BlogComment values (4, "用户名6", 4, now(), "难道只有我盯着封面笑了半小时吗？");
insert into BlogComment values (5, "用户名7", 5, now(), "说出来你们可能不信。我看过美琪美雪的百合本。。。");
insert into BlogComment values (6, "用户名2", 1, now(), "巴筋筋能量 魔筋变身！");

create table PictureComment (
	commentID int not null,
    userID varchar(20) default null,
    pictureID int default null,
    time timestamp not null default current_timestamp,
    content text,
    primary key(commentID),
    foreign key(userID) references User(userID),
    foreign key(pictureID) references Picture(pictureID)
) character set = utf8;

alter table PictureComment change time time timestamp default current_timestamp;

insert into PictureComment values(0, "用户名1", 0, now(), "相片评论");
insert into PictureComment values(1, "用户名2", 0, now(), "棒的蛤蛤蛤蛤");
insert into PictureComment values(2, "用户名3", 0, now(), "半夜出去吃个烤面筋容易么");
insert into PictureComment values(3, "用户名4", 0, now(), "全村人的希望(°∀°)ﾉ");
insert into PictureComment values(4, "用户名5", 0, now(), "是游乐娃子");
insert into PictureComment values(5, "用户名6", 0, now(), "要你寡，雨女无瓜");
